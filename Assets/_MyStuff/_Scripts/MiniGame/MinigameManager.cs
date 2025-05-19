using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Atavism;  // Provides ClientAPI, NetworkAPI, OID, etc. for Atavism integration

public class MinigameManager : MonoBehaviour
{
    public static MinigameManager Instance { get; private set; }

    // --- Gameplay Settings ---
    [Header("Gameplay Settings")]
    [Tooltip("Time limit in seconds for the minigame (0 for no limit).")]
    public float timeLimit = 60f;
    [Tooltip("Optional: override player prefab for the minigame. If set, spawns this prefab at the Respawn point and disables the regular player.")]
    public GameObject playerOverridePrefab;

    // --- Completion Logic ---
    [Header("Completion Logic")]
    [Tooltip("If true, the minigame ends when a specific collectible (assigned below) is collected.")]
    public bool useCompletionCollectible = false;
    [Tooltip("Assign the special collectible object that triggers completion when collected (e.g., a key or crown).")]
    public Collectible completionCollectibleInstance;

    // --- Guaranteed Completion Reward ---
    [Header("Guaranteed Completion Reward")]
    [Tooltip("If true, grant a fixed reward upon successful completion (defined below).")]
    public bool grantCompletionReward = false;
    [Tooltip("The reward given for completing the minigame (item or currency).")]
    public RewardEntry completionReward;

    // --- Score Reward Tiers ---
    [Header("Score Reward Tiers")]
    [Tooltip("Define score thresholds and their rewards. The highest threshold reached (<= player score) grants all its rewards.")]
    public List<ScoreRewardTier> rewardThresholds = new List<ScoreRewardTier>();

    // --- Optional Coin Reward ---
    [Header("Coin Reward (Optional)")]
    [Tooltip("If set to a valid Currency ID (>0), any coins collected in-game will be granted as this currency upon completion.")]
    public int coinCurrencyID = 0;

    // --- UI References ---
    [Header("UI References")]
    public TMP_Text scoreText;
    public TMP_Text coinsText;
    public TMP_Text timerText;
    public GameObject summaryPanel;
    public TMP_Text summaryText;
    public Button exitButton;

    // --- Exit Countdown ---
    [Header("Exit Countdown")]
    [Tooltip("Time in seconds before automatically exiting the instance after game completion.")]
    public float autoExitDelay = 10f;
    private float exitCountdown = 0f;
    private bool exitCountdownActive = false;

    // --- Private State Tracking ---
    private int score = 0;
    private int coins = 0;
    private float timeRemaining = 0f;
    private bool gameActive = false;
    private int collectiblesInScene = 0;
    private int collectiblesCollected = 0;
    private bool rewardsSentToServer = false;

    // Player control references
    private CharacterController playerController;
    private MonoBehaviour movementScript;
    private GameObject playerOverrideInstance;

    void Awake()
    {
        Instance = this;  // Initialize singleton instance
    }

    void Start()
    {
        // Initialize game state
        collectiblesInScene = FindObjectsOfType<Collectible>().Length;
        collectiblesCollected = 0;
        score = 0;
        coins = 0;
        timeRemaining = timeLimit;
        gameActive = true;
        rewardsSentToServer = false;
        summaryPanel.SetActive(false);

        // (Optional) Spawn a custom player prefab for the minigame 
        if (playerOverridePrefab != null)
        {
            // Determine spawn position (use object tagged "Respawn" if exists, else origin)
            Vector3 spawnPos = Vector3.zero;
            GameObject spawnObj = GameObject.FindWithTag("Respawn");
            if (spawnObj != null)
                spawnPos = spawnObj.transform.position;
            // Instantiate the override player character
            playerOverrideInstance = Instantiate(playerOverridePrefab, spawnPos, Quaternion.identity);
            playerOverrideInstance.tag = "Player";  // Tag it as Player so collectibles detect it

            // Disable the main Atavism player character (to hide it during the minigame)
            CharacterController atavismPlayer = FindObjectOfType<CharacterController>();
            if (atavismPlayer != null)
                atavismPlayer.gameObject.SetActive(false);
        }

        // Find the (active) player controller in the scene
        playerController = FindObjectOfType<CharacterController>();
        // If there's a separate movement script on the player, it can be stored here (optional)
        // movementScript = ... (assign if needed)

        // Hook up the Exit button to allow manual early exit
        if (exitButton != null)
            exitButton.onClick.AddListener(ExitMinigame);

        // Update the on-screen UI for initial values (score, coins, timer)
        UpdateUI();
    }

    void Update()
    {
        if (gameActive)
        {
            // Countdown timer logic (if a time limit is set)
            if (timeLimit > 0f)
            {
                timeRemaining -= Time.deltaTime;
                if (timeRemaining < 0f)
                    timeRemaining = 0f;
                // Update timer display each frame
                if (timerText != null)
                    timerText.text = $"Time: {Mathf.CeilToInt(timeRemaining)}";
                // If time is up, end the game with failure
                if (timeRemaining <= 0f)
                {
                    EndGame(success: false);
                }
            }
        }
        else
        {
            // After game ends, handle automatic exit countdown
            if (exitCountdownActive)
            {
                exitCountdown -= Time.unscaledDeltaTime;
                UpdateExitButtonText();
                if (exitCountdown <= 0f)
                {
                    // Time to auto-exit
                    exitCountdownActive = false;
                    ExitMinigame();
                }
            }
        }
    }

    /// <summary>
    /// Called by a Collectible object when the player picks it up.
    /// Increments score and coin counts, updates UI, and checks for completion conditions.
    /// </summary>
    public void CollectItem(Collectible item)
    {
        if (!gameActive) return;  // Ignore if game already ended (safety check)

        // Increase score and coins based on the collectible's values
        score += item.points;
        coins += item.coins;
        collectiblesCollected++;
        // Refresh score and coin display
        UpdateUI();

        // Check if this item is the special completion collectible (if using one)
        if (useCompletionCollectible && completionCollectibleInstance != null && item == completionCollectibleInstance)
        {
            // Collecting the special item ends the game successfully
            EndGame(success: true);
            return;
        }

        // If not using a specific completion item, check if all collectibles are gathered
        if (collectiblesCollected >= collectiblesInScene)
        {
            // All items collected – end game with success
            EndGame(success: true);
        }
    }

    /// <summary>
    /// Updates the UI text fields for score, coins, and time.
    /// </summary>
    void UpdateUI()
    {
        if (scoreText != null)
            scoreText.text = $"Score: {score}";
        if (coinsText != null)
            coinsText.text = $"Coins: {coins}";
        if (timerText != null && timeLimit > 0f)
            timerText.text = $"Time: {Mathf.CeilToInt(timeRemaining)}";
    }

    /// <summary>
    /// Ends the minigame, showing results and processing rewards.
    /// </summary>
    /// <param name="success">True if the player completed the minigame successfully, false if failed/timed out.</param>
    void EndGame(bool success)
    {
        // Only allow EndGame once
        if (!gameActive)
            return;
        gameActive = false;

        // Disable player movement controls when game ends
        if (playerController != null)
            playerController.enabled = false;
        if (movementScript != null)
            movementScript.enabled = false;

        // Show the summary/results UI
        summaryPanel.SetActive(true);
        summaryText.text = GenerateSummary(success);

        // Unlock the mouse cursor for UI interaction
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        // Start the exit countdown (auto-exit after delay)
        exitCountdown = autoExitDelay;
        exitCountdownActive = true;
        UpdateExitButtonText();  // initialize button text with timer

        // If the game was completed successfully, send rewards to server (only once)
        if (success && !rewardsSentToServer)
        {
            List<RewardEntry> grantedRewards = GetAllGrantedRewards();
            SendCompletionToServer(grantedRewards, completed: true);
            rewardsSentToServer = true;
        }
    }

    /// <summary>
    /// Updates the exit button label to show remaining seconds (for auto-exit countdown).
    /// </summary>
    void UpdateExitButtonText()
    {
        if (exitButton != null)
        {
            int secondsLeft = Mathf.CeilToInt(exitCountdown);
            exitButton.GetComponentInChildren<TMP_Text>().text = $"Exit ({secondsLeft})";
        }
    }

    /// <summary>
    /// Generate the summary text displayed to the player at end of the game.
    /// Includes outcome (win/lose), final score, coins, and rewards earned.
    /// </summary>
    string GenerateSummary(bool success)
    {
        if (!success)
        {
            // Failure case – time ran out or otherwise not completed
            return $"<b>Time's Up!</b>\nScore: {score}\nCoins: {coins}\nNo rewards earned.";
        }
        else
        {
            // Success case – display earned rewards
            string rewardText = GetRewardsSummaryText();
            return $"<b>Minigame Complete!</b>\nScore: {score}\nCoins: {coins}\n{rewardText}";
        }
    }

    // -------------------- Reward Determination --------------------

    /// <summary>
    /// Determines all rewards the player should receive for their performance.
    /// Includes the completion reward (if enabled) and the rewards from the highest achieved score tier.
    /// </summary>
    List<RewardEntry> GetAllGrantedRewards()
    {
        List<RewardEntry> allRewards = new List<RewardEntry>();

        // If a guaranteed completion reward is configured, add it
        if (grantCompletionReward && completionReward != null)
        {
            allRewards.Add(completionReward);
        }

        // Find the highest score tier that the player qualifies for
        ScoreRewardTier bestTier = null;
        foreach (ScoreRewardTier tier in rewardThresholds)
        {
            if (score >= tier.scoreThreshold)
            {
                // This tier is achieved; check if it's the highest one achieved so far
                if (bestTier == null || tier.scoreThreshold > bestTier.scoreThreshold)
                {
                    bestTier = tier;
                }
            }
        }
        // If a tier was achieved, add all its rewards
        if (bestTier != null && bestTier.rewards != null)
        {
            allRewards.AddRange(bestTier.rewards);
        }

        return allRewards;
    }

    /// <summary>
    /// Builds a human-readable rewards summary string for the summary UI.
    /// Lists each reward (quantity and type).
    /// </summary>
    string GetRewardsSummaryText()
    {
        List<RewardEntry> rewards = GetAllGrantedRewards();
        if (rewards.Count == 0)
        {
            return "No rewards earned.";
        }

        List<string> rewardDescriptions = new List<string>();
        foreach (RewardEntry reward in rewards)
        {
            rewardDescriptions.Add(FormatReward(reward));
        }
        // Join the descriptions with commas
        return "<b>Rewards:</b> " + string.Join(", ", rewardDescriptions);
    }

    /// <summary>
    /// Formats a single RewardEntry into a string for display (e.g., "5x Item (ID 123)" or "10 Currency (ID 4)").
    /// </summary>
    string FormatReward(RewardEntry reward)
    {
        if (reward.rewardType == RewardType.Item)
        {
            return $"{reward.rewardAmount}x Item (ID {reward.rewardID})";
        }
        else // Currency
        {
            return $"{reward.rewardAmount} Currency (ID {reward.rewardID})";
        }
    }

    // -------------------- Atavism Server Communication --------------------

    /// <summary>
    /// Sends the completion results to the Atavism server, granting rewards and triggering instance exit.
    /// </summary>
    /// <param name="rewards">List of rewards to grant to the player (from completion reward and tier).</param>
    /// <param name="completed">Whether the minigame was completed successfully. (If false, no rewards sent.)</param>
    void SendCompletionToServer(List<RewardEntry> rewards, bool completed)
    {
        if (!completed)
        {
            // If not successfully completed, we do not send any reward messages.
            return;
        }

        // Get the player's OID for sending extension messages
        long playerOid = ClientAPI.GetPlayerOid();

        // (1) Grant coins collected as a currency, if configured
        if (coinCurrencyID > 0 && coins > 0)
        {
            Dictionary<string, object> coinProps = new Dictionary<string, object>();
            coinProps.Add("currencyID", coinCurrencyID);
            coinProps.Add("amount", coins);
            Debug.Log($"[Minigame] Sending currency.GAIN_CURRENCY: id={coinCurrencyID}, amount={coins}");
            NetworkAPI.SendExtensionMessage(playerOid, false, "currency.GAIN_CURRENCY", coinProps);
            Debug.Log($"[Minigame] Sent currency.GAIN_CURRENCY: id={coinCurrencyID}, amount={coins}");
        }

        // (2) Grant each reward from the list (could be items or currencies)
        foreach (RewardEntry reward in rewards)
        {
            if (reward.rewardType == RewardType.Currency)
            {
                // Prepare and send currency reward message
                Dictionary<string, object> curProps = new Dictionary<string, object>();
                curProps.Add("currencyID", reward.rewardID);
                curProps.Add("amount", reward.rewardAmount);
                Debug.Log($"[Minigame] Sending currency.GAIN_CURRENCY: id={reward.rewardID}, amount={reward.rewardAmount}");
                NetworkAPI.SendExtensionMessage(playerOid, false, "currency.GAIN_CURRENCY", curProps);
                Debug.Log($"[Minigame] Sent currency.GAIN_CURRENCY: id={reward.rewardID}, amount={reward.rewardAmount}");
            }
            else if (reward.rewardType == RewardType.Item)
            {
                // Prepare and send item reward message
                Dictionary<string, object> itemProps = new Dictionary<string, object>();
                itemProps.Add("itemTemplateID", reward.rewardID);
                itemProps.Add("count", reward.rewardAmount);
                Debug.Log($"[Minigame] Sending inventory.GAIN_ITEM: id={reward.rewardID}, amount={reward.rewardAmount}");
                NetworkAPI.SendExtensionMessage(playerOid, false, "inventory.GAIN_ITEM", itemProps);
                Debug.Log($"[Minigame] Sent inventory.GAIN_ITEM: id={reward.rewardID}, amount={reward.rewardAmount}");
            }
        }
        // (All reward messages have been sent. The instance exit will be handled after the delay or when the exit button is pressed.)
    }

    /// <summary>
    /// Initiates leaving the instance (minigame), returning the player to the main world.
    /// This sends the Atavism "ao.leaveInstance" message to trigger teleportation.
    /// </summary>
    public void ExitMinigame()
    {
        // If called via button, show immediate exit text (stop the countdown display)
        if (exitButton != null)
        {
            exitButton.GetComponentInChildren<TMP_Text>().text = "Exit";
        }
        exitCountdownActive = false;

        Debug.Log("[Minigame] Exiting minigame...");

        // If a custom player prefab was used, destroy it and re-enable the original player
        if (playerOverrideInstance != null)
        {
            Destroy(playerOverrideInstance);
            CharacterController atavismPlayer = FindObjectOfType<CharacterController>();
            if (atavismPlayer != null)
                atavismPlayer.gameObject.SetActive(true);
        }

        // Send the Atavism extension message to leave the instance
        Dictionary<string, object> props = new Dictionary<string, object>();
        NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "ao.leaveInstance", props);
        // (The server will handle teleporting the player out of the instance)
    }

    // -------------------- Data Classes for Rewards --------------------

    [System.Serializable]
    public class ScoreRewardTier
    {
        public int scoreThreshold = 0;
        public List<RewardEntry> rewards = new List<RewardEntry>();
    }

    [System.Serializable]
    public class RewardEntry
    {
        public RewardType rewardType;
        [Tooltip("For Item: Item Template ID. For Currency: Currency ID.")]
        public int rewardID = 0;
        public int rewardAmount = 1;
    }

    public enum RewardType { Item, Currency }
}

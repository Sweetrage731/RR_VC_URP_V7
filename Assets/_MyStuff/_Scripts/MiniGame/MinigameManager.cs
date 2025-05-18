using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Atavism; // For Atavism network calls

public enum CollectibleType { Coin, Key, Gem, Custom }

public class MinigameManager : MonoBehaviour
{
    public static MinigameManager Instance { get; private set; }

    [Header("Gameplay Settings")]
    public float timeLimit = 60f;
    public GameObject playerOverridePrefab; // Optional: swap out player prefab for minigame

    [Header("Completion Logic")]
    [Tooltip("Drag the specific collectible instance in the scene (e.g., the 'Crown') here. When collected, minigame ends!")]
    public Collectible completionCollectibleInstance;
    public bool useCompletionCollectible = false;

    [Header("Guaranteed Completion Reward")]
    public bool grantCompletionReward = false;
    public RewardEntry completionReward;

    [Header("Score Reward Tiers")]
    [Tooltip("Highest tier reached (by score) gives all rewards in that tier, plus the completion reward if enabled.")]
    public List<ScoreRewardTier> rewardThresholds;

    [Header("UI References")]
    public TMP_Text scoreText;
    public TMP_Text coinsText;
    public TMP_Text timerText;
    public GameObject summaryPanel;
    public TMP_Text summaryText;
    public Button exitButton;

    [Header("Exit Countdown")]
    public float autoExitDelay = 10f; // seconds
    private float exitCountdown = 0f;
    private bool exitCountdownActive = false;

    [Header("Currency Settings")]
    [Tooltip("The Atavism currencyID for your standard coin currency.")]
    public int coinCurrencyID = 1; // Replace with your actual coin currency ID!

    // --- Private State ---
    int score = 0;
    int coins = 0;
    float timeRemaining = 0f;
    bool gameActive = false;
    int collectiblesInScene = 0;
    int collectiblesCollected = 0;
    bool rewardsSentToServer = false;

    CharacterController playerController;
    MonoBehaviour movementScript;
    GameObject playerOverrideInstance;

    void Awake()
    {
        Instance = this;
    }

    void Start()
    {
        collectiblesInScene = FindObjectsOfType<Collectible>().Length;
        collectiblesCollected = 0;
        score = 0;
        coins = 0;
        timeRemaining = timeLimit;
        gameActive = true;
        summaryPanel.SetActive(false);
        rewardsSentToServer = false;

        // (Optional) Override player prefab for minigame
        if (playerOverridePrefab != null)
        {
            Vector3 spawnPos = Vector3.zero;
            var spawnObj = GameObject.FindWithTag("Respawn");
            if (spawnObj != null)
                spawnPos = spawnObj.transform.position;
            playerOverrideInstance = Instantiate(playerOverridePrefab, spawnPos, Quaternion.identity);
            playerOverrideInstance.tag = "Player";
            var atavismPlayer = FindObjectOfType<CharacterController>();
            if (atavismPlayer != null) atavismPlayer.gameObject.SetActive(false);
        }

        playerController = FindObjectOfType<CharacterController>();
        UpdateUI();

        if (exitButton != null)
            exitButton.onClick.AddListener(ExitMinigame);
    }

    void Update()
    {
        if (!gameActive)
        {
            // Handle auto-exit countdown after summary is shown
            if (exitCountdownActive)
            {
                exitCountdown -= Time.unscaledDeltaTime;
                UpdateExitButtonText();

                if (exitCountdown <= 0f)
                {
                    exitCountdownActive = false;
                    ExitMinigame();
                }
            }
            return;
        }

        if (timeLimit > 0f)
        {
            timeRemaining -= Time.deltaTime;
            if (timeRemaining < 0f) timeRemaining = 0f;
            if (timerText != null)
                timerText.text = $"Time: {Mathf.CeilToInt(timeRemaining)}";
            if (timeRemaining <= 0f)
            {
                EndGame(false);
            }
        }
    }

    // ----------- MAIN ENTRY: CollectItem is called by Collectible when picked up -----------
    public void CollectItem(Collectible item)
    {
        score += item.points;
        coins += item.coins;
        collectiblesCollected++;
        UpdateUI();

        // Unique object-based completion (DRAG-AND-DROP INSPECTOR FIELD)
        if (useCompletionCollectible && completionCollectibleInstance != null && item == completionCollectibleInstance)
        {
            EndGame(true);
            return;
        }

        // Otherwise, win if all collectibles gathered
        if (collectiblesCollected >= collectiblesInScene)
        {
            EndGame(true);
        }
    }

    void UpdateUI()
    {
        if (scoreText) scoreText.text = $"Score: {score}";
        if (coinsText) coinsText.text = $"Coins: {coins}";
        if (timerText && timeLimit > 0f) timerText.text = $"Time: {Mathf.CeilToInt(timeRemaining)}";
    }

    void EndGame(bool success)
    {
        if (!gameActive) return;
        gameActive = false;

        // Lock movement
        if (playerController != null)
            playerController.enabled = false;
        if (movementScript != null)
            movementScript.enabled = false;

        // Show summary UI
        summaryPanel.SetActive(true);
        summaryText.text = GenerateSummary(success);

        // Unlock cursor for UI
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        // Start exit countdown
        exitCountdown = autoExitDelay;
        exitCountdownActive = true;
        UpdateExitButtonText();

        // Send rewards to Atavism server, only once
        if (success && !rewardsSentToServer)
        {
            List<RewardEntry> grantedRewards = GetAllGrantedRewards();
            SendCompletionToServer(grantedRewards, true);
            rewardsSentToServer = true;
        }
    }

    void UpdateExitButtonText()
    {
        if (exitButton != null)
        {
            int seconds = Mathf.CeilToInt(exitCountdown);
            exitButton.GetComponentInChildren<TMP_Text>().text = $"Exit ({seconds})";
        }
    }

    string GenerateSummary(bool success)
    {
        if (!success)
            return $"<b>Time's Up!</b>\nScore: {score}\nCoins: {coins}\nNo rewards earned.";

        var rewardMsg = GetRewardsSummaryText();
        return $"<b>Minigame Complete!</b>\nScore: {score}\nCoins: {coins}\n{rewardMsg}";
    }

    // ----------- REWARDS LOGIC -----------
    List<RewardEntry> GetAllGrantedRewards()
    {
        List<RewardEntry> allRewards = new List<RewardEntry>();
        // Always give completion reward if enabled
        if (grantCompletionReward && completionReward != null)
            allRewards.Add(completionReward);

        // Find highest tier for score
        ScoreRewardTier bestTier = null;
        foreach (var tier in rewardThresholds)
        {
            if (score >= tier.scoreThreshold)
            {
                if (bestTier == null || tier.scoreThreshold > bestTier.scoreThreshold)
                    bestTier = tier;
            }
        }
        if (bestTier != null && bestTier.rewards != null && bestTier.rewards.Count > 0)
            allRewards.AddRange(bestTier.rewards);

        return allRewards;
    }

    string GetRewardsSummaryText()
    {
        var rewards = GetAllGrantedRewards();
        if (rewards.Count == 0)
            return "No rewards earned.";
        List<string> rewardDescs = new List<string>();
        foreach (var reward in rewards)
            rewardDescs.Add(FormatReward(reward));
        return $"<b>Rewards:</b> " + string.Join(", ", rewardDescs);
    }

    string FormatReward(RewardEntry reward)
    {
        // If you want pretty names, look them up from your currency/item database!
        return reward.rewardType == RewardType.Item
            ? $"{reward.rewardAmount}x Item (ID {reward.rewardID})"
            : $"{reward.rewardAmount} Currency (ID {reward.rewardID})";
    }

    // ----------- GIVE OUT THE REWARDS -----------
    void SendCompletionToServer(List<RewardEntry> rewards, bool completed)
    {
        if (!completed || rewards == null)
            return;

        foreach (var reward in rewards)
        {
            if (reward.rewardType == RewardType.Currency)
            {
                Dictionary<string, object> props = new Dictionary<string, object>();
                props.Add("currencyID", reward.rewardID);
                props.Add("amount", reward.rewardAmount);
                NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "currency.GAIN_CURRENCY", props);
            }
            else if (reward.rewardType == RewardType.Item)
            {
                Dictionary<string, object> itemProps = new Dictionary<string, object>();
                itemProps.Add("itemID", reward.rewardID);
                itemProps.Add("amount", reward.rewardAmount);
                NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "inventory.GAIN_ITEM", itemProps);
            }
        }
        // Grant coins as a currency if you want
        if (coins > 0)
        {
            Dictionary<string, object> props = new Dictionary<string, object>();
            props.Add("currencyID", coinCurrencyID); // replace with your real coin currency ID!
            props.Add("amount", coins);
            NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "currency.GAIN_CURRENCY", props);
        }
    }

    // ----------- EXIT INSTANCE: USES ATAVISM NETWORK CALL -----------
    public void ExitMinigame()
    {
        if (exitButton != null)
            exitButton.GetComponentInChildren<TMP_Text>().text = "Exit";
        exitCountdownActive = false;

        Debug.Log("[Minigame] Exiting minigame...");

        if (playerOverrideInstance != null)
        {
            Destroy(playerOverrideInstance);
            var atavismPlayer = FindObjectOfType<CharacterController>();
            if (atavismPlayer != null) atavismPlayer.gameObject.SetActive(true);
        }

        // Forcibly send the Atavism instance exit message!
        Dictionary<string, object> props = new Dictionary<string, object>();
        NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "ao.leaveInstance", props);
    }

    // ----------- REWARD DATA CLASSES -----------
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
        public int rewardID = 0; // Atavism ItemTemplateID or CurrencyID
        public int rewardAmount = 1;
    }
    public enum RewardType { Item, Currency }
}

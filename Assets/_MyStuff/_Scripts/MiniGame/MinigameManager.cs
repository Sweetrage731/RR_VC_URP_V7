using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Atavism;
using UnityEngine.SceneManagement;

public class MinigameManager : MonoBehaviour
{
    public static MinigameManager Instance { get; private set; }

    [Header("Gameplay Settings")]
    public float timeLimit = 60f;
    public GameObject playerOverridePrefab;

    [Header("Completion Logic")]
    public bool useCompletionCollectible = false;
    public Collectible completionCollectibleInstance;

    [Header("Guaranteed Completion Reward")]
    public bool grantCompletionReward = false;
    public RewardEntry completionReward;

    [Header("Score Reward Tiers")]
    public List<ScoreRewardTier> rewardThresholds = new List<ScoreRewardTier>();

    [Header("Coin Reward (Optional)")]
    public int coinCurrencyID = 0; // The ID of the currency to grant for collected 'coins'

    [Header("UI References")]
    public TMP_Text scoreText;
    public TMP_Text coinsText;
    public TMP_Text timerText;
    public GameObject summaryPanel;
    public TMP_Text summaryText;
    public Button exitButton;

    [Header("Exit Countdown")]
    public float autoExitDelay = 10f;
    private float exitCountdown = 0f;
    private bool exitCountdownActive = false;

    private int score = 0;
    private int coins = 0;
    private float timeRemaining = 0f;
    private bool gameActive = false;
    private int collectiblesInScene = 0;
    private int collectiblesCollected = 0;
    private bool rewardsSentToServer = false;

    private CharacterController playerController;
    private MonoBehaviour movementScript;
    private GameObject playerOverrideInstance;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else if (Instance != this)
        {
            Destroy(gameObject);
            return;
        }
    }

    void Start()
    {
        GameObject playerObj = null;

        if (playerOverridePrefab != null)
        {
            Vector3 spawnPos = ArcadeTeleportSessionData.miniGameSpawnPosition;
            GameObject spawnPointOverride = GameObject.FindWithTag("Respawn");
            if (spawnPointOverride != null)
            {
                spawnPos = spawnPointOverride.transform.position;
                Debug.Log($"[MinigameManager] Using tagged 'Respawn' object for spawn position: {spawnPos}");
            }
            else if (spawnPos == Vector3.zero)
            {
                Debug.LogWarning("[MinigameManager] No miniGameSpawnPosition from ArcadeTeleportSessionData and no 'Respawn' tagged object found. Player may spawn at prefab's default or (0,0,0).");
            }

            playerOverrideInstance = Instantiate(playerOverridePrefab, spawnPos, Quaternion.identity);
            playerOverrideInstance.tag = "Player";
            playerObj = playerOverrideInstance;

            CharacterController[] allControllers = FindObjectsOfType<CharacterController>(true);
            foreach (CharacterController cc in allControllers)
            {
                if (cc.gameObject != playerOverrideInstance)
                {
                    AtavismNode atavismNode = cc.GetComponent<AtavismNode>();
                    if (atavismNode != null && atavismNode.IsPlayer())
                    {
                        Debug.Log($"[MinigameManager] Deactivating original Atavism player: {cc.gameObject.name}");
                        cc.gameObject.SetActive(false);
                        break;
                    }
                }
            }
        }
        else
        {
            playerObj = GameObject.FindGameObjectWithTag("Player");
        }

        StartCoroutine(ForcePlacePlayerAtMinigameSpawn());

        collectiblesInScene = FindObjectsOfType<Collectible>().Length;
        collectiblesCollected = 0;
        score = 0;
        coins = 0;
        timeRemaining = timeLimit;
        gameActive = true;
        rewardsSentToServer = false;

        if (summaryPanel != null) summaryPanel.SetActive(false);

        if (playerObj != null)
        {
            playerController = playerObj.GetComponent<CharacterController>();
        }
        else
        {
            Debug.LogError("[MinigameManager] Player object not found or assigned!");
        }

        if (exitButton != null)
            exitButton.onClick.AddListener(ExitMinigame);

        UpdateUI();
    }

    IEnumerator ForcePlacePlayerAtMinigameSpawn()
    {
        yield return new WaitForSeconds(0.5f);

        Vector3 targetPos = ArcadeTeleportSessionData.miniGameSpawnPosition;
        GameObject spawnPointOverride = GameObject.FindWithTag("Respawn");
        if (spawnPointOverride != null)
        {
            targetPos = spawnPointOverride.transform.position;
        }

        // ---- FIXED: Use only bool variable assignments here! ----
        bool isTargetPosZero = (targetPos == Vector3.zero);
        bool isPlayerOverrideNull = (playerOverrideInstance == null);

        if (isTargetPosZero && isPlayerOverrideNull)
        {
            Debug.LogWarning("[MinigameManager] No target spawn position defined and no player override instance. Cannot force place player.");
            yield break;
        }

        GameObject playerToMove = playerOverrideInstance != null ? playerOverrideInstance : GameObject.FindGameObjectWithTag("Player");

        int attempts = 0;
        while ((playerToMove == null || !playerToMove.activeInHierarchy) && attempts < 120)
        {
            playerToMove = playerOverrideInstance != null ? playerOverrideInstance : GameObject.FindGameObjectWithTag("Player");
            attempts++;
            yield return new WaitForSeconds(0.1f);
        }

        if (playerToMove != null)
        {
            Debug.Log($"[MinigameManager] Forcing player position to: {targetPos}");
            CharacterController cc = playerToMove.GetComponent<CharacterController>();
            if (cc != null && cc.enabled)
            {
                cc.enabled = false;
                playerToMove.transform.position = targetPos;
                playerToMove.transform.rotation = Quaternion.identity;
                cc.enabled = true;
            }
            else
            {
                playerToMove.transform.position = targetPos;
                playerToMove.transform.rotation = Quaternion.identity;
            }

            Dictionary<string, object> posProps = new Dictionary<string, object>
            {
                { "x", targetPos.x },
                { "y", targetPos.y },
                { "z", targetPos.z }
            };
            NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "ao.SetPosition", posProps);
            Debug.Log($"[MinigameManager] Sent position update to Atavism server: {targetPos}");
        }
        else
        {
            Debug.LogError("[MinigameManager] Could not find player object to force position after multiple attempts.");
        }
    }

    void Update()
    {
        if (gameActive)
        {
            if (timeLimit > 0f)
            {
                timeRemaining -= Time.deltaTime;
                if (timeRemaining < 0f) timeRemaining = 0f;

                if (timerText != null) timerText.text = $"Time: {Mathf.CeilToInt(timeRemaining)}";

                if (timeRemaining <= 0f)
                {
                    EndGame(false);
                }
            }
        }
        else if (exitCountdownActive)
        {
            exitCountdown -= Time.unscaledDeltaTime;
            UpdateExitButtonText();
            if (exitCountdown <= 0f)
            {
                exitCountdownActive = false;
                ExitMinigame();
            }
        }
    }

    public void CollectItem(Collectible item)
    {
        if (!gameActive || item == null) return;

        score += item.points;
        coins += item.coins;
        collectiblesCollected++;
        UpdateUI();

        if (useCompletionCollectible && completionCollectibleInstance != null && item == completionCollectibleInstance)
        {
            EndGame(true);
            return;
        }

        if (collectiblesInScene > 0 && collectiblesCollected >= collectiblesInScene && !useCompletionCollectible)
        {
            EndGame(true);
        }
    }

    void UpdateUI()
    {
        if (scoreText != null) scoreText.text = $"Score: {score}";
        if (coinsText != null) coinsText.text = $"Coins: {coins}";
        if (timerText != null && timeLimit > 0f)
            timerText.text = $"Time: {Mathf.CeilToInt(timeRemaining)}";
    }

    void EndGame(bool successObjectiveMet)
    {
        if (!gameActive) return;
        gameActive = false;
        Debug.Log($"[MinigameManager] EndGame called. Success: {successObjectiveMet}");

        if (playerController != null) playerController.enabled = false;
        if (movementScript != null) movementScript.enabled = false;

        if (summaryPanel != null)
        {
            summaryPanel.SetActive(true);
            if (summaryText != null)
                summaryText.text = GenerateSummary(successObjectiveMet);
        }

        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;

        exitCountdown = autoExitDelay;
        exitCountdownActive = true;
        UpdateExitButtonText();

        if (successObjectiveMet && !rewardsSentToServer)
        {
            var grantedRewards = GetAllGrantedRewards();
            SendCompletionToServer(grantedRewards, true);
            rewardsSentToServer = true;
        }
        else if (!successObjectiveMet)
        {
            Debug.Log("[MinigameManager] Game ended (e.g. time up), no rewards sent for objectives.");
            // Optionally grant collected coins even on failure:
            // if (coinCurrencyID > 0 && coins > 0)
            // {
            //     long playerOid = ClientAPI.GetPlayerOid();
            //     var coinProps = new Dictionary<string, object>
            //     {
            //         { "currencyID", coinCurrencyID },
            //         { "amount", coins }
            //     };
            //     NetworkAPI.SendExtensionMessage(playerOid, false, "currency.GAIN_CURRENCY", coinProps);
            //     Debug.Log($"[MinigameManager] Granted {coins} of currency {coinCurrencyID} (ID) despite game objective failure.");
            // }
        }
    }

    void UpdateExitButtonText()
    {
        if (exitButton != null)
        {
            int secondsLeft = Mathf.CeilToInt(exitCountdown);
            TMP_Text txt = exitButton.GetComponentInChildren<TMP_Text>();
            if (txt) txt.text = $"Exit ({secondsLeft})";
        }
    }

    string GenerateSummary(bool success)
    {
        string summary = success
            ? $"<b>Minigame Complete!</b>\nScore: {score}\nCollected Coins: {coins}\n"
            : $"<b>Time's Up!</b>\nScore: {score}\nCollected Coins: {coins}\n";

        if (success)
        {
            summary += GetRewardsSummaryText();
        }
        else
        {
            summary += "No objective-based rewards earned.";
        }
        return summary;
    }

    List<RewardEntry> GetAllGrantedRewards()
    {
        List<RewardEntry> allRewards = new List<RewardEntry>();
        if (grantCompletionReward && completionReward != null && completionReward.rewardID > 0)
        {
            allRewards.Add(completionReward);
        }

        ScoreRewardTier bestTier = null;
        foreach (var tier in rewardThresholds)
        {
            if (score >= tier.scoreThreshold)
            {
                if (bestTier == null || tier.scoreThreshold > bestTier.scoreThreshold)
                {
                    bestTier = tier;
                }
            }
        }

        if (bestTier != null && bestTier.rewards != null)
        {
            foreach (var reward in bestTier.rewards)
            {
                if (reward.rewardID > 0)
                    allRewards.Add(reward);
            }
        }
        return allRewards;
    }

    string GetRewardsSummaryText()
    {
        var rewards = GetAllGrantedRewards();

        // ---- FIXED: Only bool variables, no method groups! ----
        bool noMainRewards = (rewards.Count == 0);
        bool noCoinsToGrantAsReward = !(coinCurrencyID > 0 && coins > 0);

        if (noMainRewards && noCoinsToGrantAsReward) return "No rewards earned.";

        List<string> desc = new List<string>();

        if (coinCurrencyID > 0 && coins > 0)
        {
            desc.Add($"{coins} x Currency (ID {coinCurrencyID})");
        }

        foreach (var r in rewards)
        {
            desc.Add(FormatReward(r));
        }

        if (desc.Count == 0) return "No rewards earned.";
        return "<b>Rewards Granted:</b>\n" + string.Join("\n", desc);
    }

    string FormatReward(RewardEntry reward)
    {
        if (reward.rewardID <= 0 || reward.rewardAmount <= 0) return "";

        return reward.rewardType == RewardType.Item
            ? $"{reward.rewardAmount}x Item (ID {reward.rewardID})"
            : $"{reward.rewardAmount}x Currency (ID {reward.rewardID})";
    }

    void SendCompletionToServer(List<RewardEntry> rewards, bool completedSuccessfully)
    {
        if (!completedSuccessfully)
        {
            Debug.Log("[MinigameManager] Minigame not completed successfully, skipping server reward messages for objectives.");
            return;
        }

        long playerOid = ClientAPI.GetPlayerOid();
        Debug.Log($"[MinigameManager] Sending completion rewards to server for player OID: {playerOid}. Rewards count: {rewards.Count}, Coins to grant: {coins} of currency ID {coinCurrencyID}");

        if (coinCurrencyID > 0 && coins > 0)
        {
            Debug.Log($"[MinigameManager] Preparing to send coin reward: CurrencyID={coinCurrencyID}, Amount={coins}");
            var coinProps = new Dictionary<string, object>
            {
                { "currencyID", coinCurrencyID },
                { "amount", coins }
            };
            NetworkAPI.SendExtensionMessage(playerOid, false, "currency.GAIN_CURRENCY", coinProps);
            Debug.Log($"[MinigameManager] Sent currency.GAIN_CURRENCY for collected coins.");
        }

        foreach (var reward in rewards)
        {
            if (reward.rewardID <= 0 || reward.rewardAmount <= 0)
            {
                Debug.LogWarning($"[MinigameManager] Skipping invalid reward: ID={reward.rewardID}, Amount={reward.rewardAmount}, Type={reward.rewardType}");
                continue;
            }

            if (reward.rewardType == RewardType.Currency)
            {
                Debug.Log($"[MinigameManager] Preparing to send currency reward: CurrencyID={reward.rewardID}, Amount={reward.rewardAmount}");
                var curProps = new Dictionary<string, object>
                {
                    { "currencyID", reward.rewardID },
                    { "amount", reward.rewardAmount }
                };
                NetworkAPI.SendExtensionMessage(playerOid, false, "currency.GAIN_CURRENCY", curProps);
                Debug.Log($"[MinigameManager] Sent currency.GAIN_CURRENCY for reward.");
            }
            else // RewardType.Item
            {
                Debug.Log($"[MinigameManager] Preparing to send item reward: ItemTemplateID={reward.rewardID}, Count={reward.rewardAmount}");
                var itemProps = new Dictionary<string, object>
                {
                    { "itemTemplateID", reward.rewardID },
                    { "count", reward.rewardAmount }
                };
                NetworkAPI.SendExtensionMessage(playerOid, false, "inventory.GAIN_ITEM", itemProps);
                Debug.Log($"[MinigameManager] Sent inventory.GAIN_ITEM for reward.");
            }
        }
    }

    public void ExitMinigame()
    {
        Debug.Log("[MinigameManager] ExitMinigame called.");
        if (exitButton != null)
        {
            TMP_Text txt = exitButton.GetComponentInChildren<TMP_Text>();
            if (txt) txt.text = "Exit";
        }

        exitCountdownActive = false;

        if (playerOverrideInstance != null)
        {
            Debug.Log($"[MinigameManager] Destroying player override instance: {playerOverrideInstance.name}");
            Destroy(playerOverrideInstance);

            CharacterController[] allControllers = FindObjectsOfType<CharacterController>(true);
            foreach (CharacterController cc in allControllers)
            {
                AtavismNode atavismNode = cc.GetComponent<AtavismNode>();
                if (atavismNode != null && atavismNode.IsPlayer())
                {
                    Debug.Log($"[MinigameManager] Re-activating original Atavism player: {cc.gameObject.name}");
                    cc.gameObject.SetActive(true);
                    break;
                }
            }
        }

        var props = new Dictionary<string, object>();
        NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "ao.leaveInstance", props);
        Debug.Log("[MinigameManager] Sent 'ao.leaveInstance' message to server.");
    }

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
        public int rewardID = 0;
        public int rewardAmount = 1;
    }

    public enum RewardType { Item, Currency }
}

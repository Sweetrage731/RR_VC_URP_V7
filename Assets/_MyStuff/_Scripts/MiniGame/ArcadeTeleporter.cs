using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

/// <summary>
/// Place this on any arcade cabinet object. Allows for custom minigame scene and settings per cabinet.
/// </summary>
public class ArcadeTeleporter : MonoBehaviour
{
    [Header("Minigame Teleport Config")]
    public string minigameSceneName = "PlatformTest";
    public Vector3 minigameSpawnPosition = new Vector3(-2.7f, 1.5f, 129f);

    [Header("Custom Data (Optional)")]
    public string miniGameType = "Platformer";
    public string miniGameSkin = "Default";

    [Header("UI & Settings")]
    public float interactDistance = 2f;
    public float cooldown = 1f;
    public TMP_Text interactPrompt;

    private float lastInteractTime = -999f;
    private Transform player;
    private bool isValidPlayer => player != null && player.gameObject.activeInHierarchy;

    void Start()
    {
        if (interactPrompt) interactPrompt.gameObject.SetActive(false);
    }

    void Update()
    {
        if (!player)
        {
            GameObject playerObj = GameObject.FindGameObjectWithTag("Player");
            if (playerObj) player = playerObj.transform;
        }

        if (!isValidPlayer) return;

        float dist = Vector3.Distance(player.position, transform.position);
        if (dist <= interactDistance)
        {
            if (interactPrompt) interactPrompt.gameObject.SetActive(true);
            if (Input.GetKeyDown(KeyCode.E) && Time.time > lastInteractTime + cooldown)
            {
                lastInteractTime = Time.time;
                BeginMiniGameTeleport();
            }
        }
        else
        {
            if (interactPrompt) interactPrompt.gameObject.SetActive(false);
        }
    }

    void BeginMiniGameTeleport()
    {
        if (!isValidPlayer) return;
        // Save return position (in front of the arcade cabinet)
        ArcadeTeleportSessionData.returnWorldPosition = player.position;
        ArcadeTeleportSessionData.returnWorldRotation = player.rotation;
        ArcadeTeleportSessionData.miniGameSpawnPosition = minigameSpawnPosition;
        ArcadeTeleportSessionData.miniGameType = miniGameType;
        ArcadeTeleportSessionData.miniGameSkin = miniGameSkin;
        ArcadeTeleportSessionData.lastCabinet = this;

        // Simple check: if scene is in build settings
        if (Application.CanStreamedLevelBeLoaded(minigameSceneName))
            SceneManager.LoadScene(minigameSceneName);
        else
            Debug.LogError($"[ArcadeTeleporter] Scene '{minigameSceneName}' is not in build settings!");
    }
}

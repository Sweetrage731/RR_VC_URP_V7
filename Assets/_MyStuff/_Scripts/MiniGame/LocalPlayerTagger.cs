using UnityEngine;

/// <summary>
/// Automatically tags the local player object as 'Player' for minigame collectible logic.
/// </summary>
public class LocalPlayerTagger : MonoBehaviour
{
    private GameObject localPlayer;
    private string previousTag = "";

    void Start()
    {
        localPlayer = FindLocalPlayer();
        if (localPlayer != null)
        {
            previousTag = localPlayer.tag;
            localPlayer.tag = "Player";
        }
    }

    void OnDestroy()
    {
        if (localPlayer != null && previousTag != "Player")
        {
            localPlayer.tag = previousTag;
        }
    }

    GameObject FindLocalPlayer()
    {
        foreach (var cc in GameObject.FindObjectsOfType<CharacterController>())
        {
            return cc.gameObject;
        }
        return null;
    }
}

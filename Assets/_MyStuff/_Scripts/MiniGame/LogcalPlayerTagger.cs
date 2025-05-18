using UnityEngine;

public class LocalPlayerTagger : MonoBehaviour
{
    private GameObject localPlayer;
    private string previousTag = "";

    void Start()
    {
        // Find the local player object by looking for a CharacterController AND a component that guarantees it's local.
        // If you're using networking, replace this with your local player check.
        localPlayer = FindLocalPlayer();

        if (localPlayer != null)
        {
            previousTag = localPlayer.tag;
            localPlayer.tag = "Player";
            Debug.Log($"Local player '{localPlayer.name}' tagged as 'Player' for minigame.");
        }
        else
        {
            Debug.LogWarning("Local player not found. Ensure your CharacterController is on the local player and you have a unique identifying script if networked.");
        }
    }

    void OnDestroy()
    {
        // Reset the tag when the minigame ends (optional)
        if (localPlayer != null && previousTag != "Player")
        {
            localPlayer.tag = previousTag;
            Debug.Log($"Local player '{localPlayer.name}' tag reset to '{previousTag}'.");
        }
    }

    GameObject FindLocalPlayer()
    {
        // Try to find the local player in a single-player scene
        // If networked, add your local-check here (like isLocalPlayer or photonView.IsMine)
        foreach (var cc in GameObject.FindObjectsOfType<CharacterController>())
        {
            // If you're using a custom script, add additional checks here
            // For Mirror/MLAPI/Photon, use your local player check
            // Example: if (cc.GetComponent<YourNetworkScript>()?.isLocalPlayer ?? false)
            return cc.gameObject; // For single-player or single local player scene
        }
        return null;
    }
}

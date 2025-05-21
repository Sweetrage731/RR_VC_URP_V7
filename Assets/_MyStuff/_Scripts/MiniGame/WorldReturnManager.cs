using UnityEngine;

public class WorldReturnManager : MonoBehaviour
{
    void Start()
    {
        GameObject player = GameObject.FindGameObjectWithTag("Player");
        if (player && ArcadeTeleportSessionData.returnWorldPosition != Vector3.zero)
        {
            player.transform.position = ArcadeTeleportSessionData.returnWorldPosition;
            player.transform.rotation = ArcadeTeleportSessionData.returnWorldRotation;
            ArcadeTeleportSessionData.Clear();
        }
    }
}

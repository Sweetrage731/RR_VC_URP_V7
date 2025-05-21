using UnityEngine;

public static class ArcadeTeleportSessionData
{
    public static Vector3 returnWorldPosition = Vector3.zero;
    public static Quaternion returnWorldRotation = Quaternion.identity;
    public static Vector3 miniGameSpawnPosition = Vector3.zero;
    public static string miniGameType = "";
    public static string miniGameSkin = "";
    // Can store additional info here as needed.
    public static ArcadeTeleporter lastCabinet = null;

    public static void Clear()
    {
        returnWorldPosition = Vector3.zero;
        returnWorldRotation = Quaternion.identity;
        miniGameSpawnPosition = Vector3.zero;
        miniGameType = "";
        miniGameSkin = "";
        lastCabinet = null;
    }
}

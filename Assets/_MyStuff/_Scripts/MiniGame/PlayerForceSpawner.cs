using UnityEngine;

public class PlayerSpawnForcer : MonoBehaviour
{
    public Vector3 desiredPosition = new Vector3(0, 1, 0);
    public Quaternion desiredRotation = Quaternion.identity;
    public float forceDuration = 2.0f; // seconds to keep forcing
    private float timer = 0f;
    private GameObject playerObj;

    void Start()
    {
        // Allow override from ArcadeTeleportSessionData
        if (ArcadeTeleportSessionData.miniGameSpawnPosition != Vector3.zero)
            desiredPosition = ArcadeTeleportSessionData.miniGameSpawnPosition;
        desiredRotation = Quaternion.identity;
        timer = 0f;
    }

    void Update()
    {
        playerObj = FindPlayerObject();
        if (playerObj != null)
        {
            if (!playerObj.activeInHierarchy)
                playerObj.SetActive(true);

            playerObj.transform.position = desiredPosition;
            playerObj.transform.rotation = desiredRotation;

            // Double-tap to really annoy Atavism :P
            playerObj.transform.position = desiredPosition;
            playerObj.transform.rotation = desiredRotation;
        }
        timer += Time.deltaTime;
        if (timer > forceDuration)
        {
            Debug.Log($"[PlayerSpawnForcer] Done forcing player position at {desiredPosition}.");
            Destroy(this); // Self-destruct!
        }
    }

    GameObject FindPlayerObject()
    {
        foreach (var t in GameObject.FindObjectsOfType<Transform>(true))
        {
            if (t.CompareTag("Player"))
                return t.gameObject;
        }
        return null;
    }
}

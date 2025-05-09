using UnityEngine;

public class HeartbeatGlow : MonoBehaviour
{
    public Material heartMat;
    public Color emissionColor = Color.magenta;
    public float intensity = 1.5f;

    [Header("Proximity Settings")]
    public string playerTag = "Player";
    public float minDistance = 2f;      // Fastest beat
    public float maxDistance = 15f;     // Slowest beat
    public float minBeatSpeed = 1.2f;
    public float maxBeatSpeed = 0.5f;

    private float time;
    private float beatSpeed = 1.0f;
    private Transform player;

    void Start()
    {
        GameObject found = GameObject.FindWithTag(playerTag);
        if (found != null)
            player = found.transform;
        else
            Debug.LogWarning($"HeartbeatGlow could not find any GameObject with tag '{playerTag}'");
    }

    void Update()
    {
        // Update beatSpeed based on distance
        if (player != null)
        {
            float dist = Vector3.Distance(transform.position, player.position);
            float t = Mathf.InverseLerp(maxDistance, minDistance, dist); // 0 = far, 1 = near
            beatSpeed = Mathf.Lerp(maxBeatSpeed, minBeatSpeed, t);       // Inverted: faster when closer
        }

        time += Time.deltaTime * beatSpeed;

        // Heartbeat pattern: two quick beats
        float pulse =
            Mathf.Exp(-Mathf.Pow((time - 0.15f) * 12, 2)) +
            Mathf.Exp(-Mathf.Pow((time - 0.4f) * 12, 2));

        Color finalColor = emissionColor * (0.5f + intensity * pulse);
        heartMat.SetColor("_EmissionColor", finalColor);

        if (time > 1.2f) time = 0f;
    }
}

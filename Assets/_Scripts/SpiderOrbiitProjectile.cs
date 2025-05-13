using UnityEngine;

public class SpiderProjectileOrbit : MonoBehaviour
{
    public Transform orbitCenter;    // Center point around which to orbit
    public float radius = 3f;        // Distance from center
    public float speed = 1f;         // How fast to rotate
    public float heightAmplitude = 0.5f;  // Optional: vertical bobbing
    public float heightFrequency = 1f;

    private float angle = 0f;

    void Update()
    {
        if (orbitCenter == null) return;

        angle += speed * Time.deltaTime;
        float x = Mathf.Cos(angle) * radius;
        float z = Mathf.Sin(angle) * radius;
        float y = Mathf.Sin(Time.time * heightFrequency) * heightAmplitude;

        transform.position = orbitCenter.position + new Vector3(x, y, z);
        transform.LookAt(orbitCenter);  // Optional: face the center
    }
}

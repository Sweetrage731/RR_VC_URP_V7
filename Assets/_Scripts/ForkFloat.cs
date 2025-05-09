using UnityEngine;

public class FloatingMagicalFork : MonoBehaviour
{
    [Header("Float Settings")]
    public float floatStrength = 0.5f;
    public float floatSpeed = 2.0f;

    [Header("Rotation Settings (degrees/second)")]
    public float rotateX = 0f;
    public float rotateY = 0f;
    public float rotateZ = 30f;

    [Header("Glow Settings")]
    public Color glowColor = Color.magenta;
    public float glowIntensity = 2.0f;
    private float baseGlow = 0.5f;

    private Vector3 initialPosition;
    private Material forkMaterial;

    void Start()
    {
        initialPosition = transform.position;

        Renderer renderer = GetComponent<Renderer>();
        if (renderer != null)
        {
            forkMaterial = renderer.material;
            forkMaterial.EnableKeyword("_EMISSION");
        }
    }

    void Update()
    {
        // Hover motion
        float wave = Mathf.Sin(Time.time * floatSpeed);
        float newY = wave * floatStrength;
        transform.position = initialPosition + new Vector3(0, newY, 0);

        // Independent axis rotation
        transform.Rotate(
            rotateX * Time.deltaTime,
            rotateY * Time.deltaTime,
            rotateZ * Time.deltaTime,
            Space.World
        );

        // Glow synced with float
        if (forkMaterial != null)
        {
            float emissionStrength = baseGlow + Mathf.Abs(wave) * glowIntensity;
            Color finalColor = glowColor * emissionStrength;
            forkMaterial.SetColor("_EmissionColor", finalColor);
        }
    }
}
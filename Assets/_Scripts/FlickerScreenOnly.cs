using UnityEngine;

public class FlickerScreenOnly : MonoBehaviour
{
    public Renderer targetRenderer;
    public int materialIndex = 5;

    [Header("Flicker Settings")]
    public Color baseEmissionColor = new Color(1f, 1f, 1f, 1f) * 5f;
    public float flickerSpeed = 4f;
    public float flickerIntensity = 1.2f;
    public float noiseScale = 1.0f;
    public float blinkChance = 0.01f; // chance per frame of a hard flicker

    private Material screenMat;
    private float flickerTimer;
    private float noiseSeed;

    void Start()
    {
        if (targetRenderer != null && targetRenderer.materials.Length > materialIndex)
        {
            Material[] mats = targetRenderer.materials;
            screenMat = mats[materialIndex];
            targetRenderer.materials = mats;

            screenMat.EnableKeyword("_EMISSION");
            screenMat.globalIlluminationFlags = MaterialGlobalIlluminationFlags.RealtimeEmissive;

            noiseSeed = Random.Range(0f, 100f);
        }
        else
        {
            Debug.LogWarning("FlickerScreenOnly: Invalid material index or missing renderer.");
        }
    }

    void Update()
    {
        if (screenMat != null)
        {
            flickerTimer += Time.deltaTime * flickerSpeed;

            // Base sine flicker
            float sine = Mathf.Abs(Mathf.Sin(flickerTimer)) * flickerIntensity;

            // Add Perlin noise
            float noise = Mathf.PerlinNoise(Time.time * noiseScale, noiseSeed);
            float flicker = sine * noise;

            // Random hard blink
            if (Random.value < blinkChance)
            {
                flicker = 0f;
            }

            Color finalColor = baseEmissionColor * flicker;
            screenMat.SetColor("_EmissionColor", finalColor);
        }
    }
}

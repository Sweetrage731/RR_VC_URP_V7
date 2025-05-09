using UnityEngine;

[RequireComponent(typeof(Renderer))]
public class EmissionFlicker : MonoBehaviour
{
    public Color baseEmissionColor = Color.red;
    public float minIntensity = 0.2f;
    public float maxIntensity = 2f;
    public float flickerSpeed = 5f;
    public float noiseScale = 1f;

    private Material mat;
    private float noiseOffset;

    void Start()
    {
        mat = GetComponent<Renderer>().material;
        mat.EnableKeyword("_EMISSION");
        noiseOffset = Random.Range(0f, 1000f); // Offset to avoid uniform flicker across objects
    }

    void Update()
    {
        float noise = Mathf.PerlinNoise(Time.time * flickerSpeed + noiseOffset, 0f);
        float intensity = Mathf.Lerp(minIntensity, maxIntensity, noise);
        Color finalColor = baseEmissionColor * intensity;
        mat.SetColor("_EmissionColor", finalColor);
        DynamicGI.SetEmissive(GetComponent<Renderer>(), finalColor); // optional, for real-time GI
    }
}

using UnityEngine;

[RequireComponent(typeof(Renderer))]
public class EmissionPulse : MonoBehaviour
{
    public Color emissionColor = Color.magenta;
    public float pulseSpeed = 1.5f;  // How fast it pulses
    public float minIntensity = 0.2f;
    public float maxIntensity = 2f;

    private Material mat;
    private float pulse;

    void Start()
    {
        mat = GetComponent<Renderer>().material;
        mat.EnableKeyword("_EMISSION");
    }

    void Update()
    {
        pulse = Mathf.Lerp(minIntensity, maxIntensity, (Mathf.Sin(Time.time * pulseSpeed) + 1f) / 2f);
        Color finalColor = emissionColor * pulse;
        mat.SetColor("_EmissionColor", finalColor);
    }
}
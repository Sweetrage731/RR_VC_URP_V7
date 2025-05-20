using UnityEngine;
using CandyGame; // 👈 This is critical to resolve the error

public class CandyCannonBall : MonoBehaviour
{
    public float lifetime = 5f;
    public GameObject hitEffect;

    void Start()
    {
        Destroy(gameObject, lifetime); // Auto-destroy after a while
    }

    void OnTriggerEnter(Collider other)
    {
        Debug.Log($"Scene test hit: {other.name} (Layer: {LayerMask.LayerToName(other.gameObject.layer)})");

        CandyEnemyHealth enemy = other.GetComponentInParent<CandyEnemyHealth>();
        if (enemy != null)
        {
            Debug.Log("ENEMY HIT: Taking damage");
            enemy.TakeDamage(1);
        }
        else
        {
            Debug.Log("No CandyEnemyHealth found in " + other.name + " or its parents.");
        }

        Destroy(gameObject);
    }




}

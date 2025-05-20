using UnityEngine;

public class CandyProjectile : MonoBehaviour
{
    public GameObject explosionEffectPrefab;
    public float lifetime = 5f;

    void Start()
    {
        Destroy(gameObject, lifetime); // destroy if it flies too long
    }

    void OnCollisionEnter(Collision collision)
    {
        // Optional: only explode if it hits something tagged "Enemy"
        // if (!collision.gameObject.CompareTag("Enemy")) return;

        // Create the explosion effect
        if (explosionEffectPrefab != null)
        {
            Instantiate(explosionEffectPrefab, transform.position, Quaternion.identity);
        }

        // Destroy the thing you hit (if you want)
        // Destroy(collision.gameObject); 

        // Destroy the projectile
        Destroy(gameObject);
    }
}

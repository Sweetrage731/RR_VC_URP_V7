using UnityEngine;

public class CandyCannon : MonoBehaviour
{
    public GameObject projectilePrefab;
    public Transform firePoint;
    public float projectileSpeed = 20f;

    public void Fire()
    {
        if (projectilePrefab == null || firePoint == null)
        {
            Debug.LogWarning("Missing firepoint or projectile prefab.");
            return;
        }

        GameObject shot = Instantiate(projectilePrefab, firePoint.position, firePoint.rotation);

        Rigidbody rb = shot.GetComponent<Rigidbody>();
        if (rb != null)
        {
            rb.linearVelocity = firePoint.forward * projectileSpeed;
        }
        else
        {
            Debug.LogWarning("No Rigidbody on projectile.");
        }
    }
}

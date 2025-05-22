using UnityEngine;

public class CandyEnemyHealth : MonoBehaviour
{
    public int maxHealth = 3;
    public int points = 10; // Set this per monster in the Inspector
    private int currentHealth;

    public GameObject deathEffect;

    void Start()
    {
        currentHealth = maxHealth;
    }

    public void TakeDamage(int damage)
    {
        Debug.Log(">>> CANDY ENEMY HEALTH: Took " + damage + " damage on " + gameObject.name);

        currentHealth -= damage;

        if (currentHealth <= 0)
        {
            Debug.Log(">>> CANDY ENEMY HEALTH: Dying now...");
            Die();
        }
    }

    void Die()
    {
        if (deathEffect)
            Instantiate(deathEffect, transform.position, Quaternion.identity);

        Debug.Log("Enemy died.");

        // Add score
        CandyScoreManager.AddPoints(points);

        Destroy(gameObject);
    }
}

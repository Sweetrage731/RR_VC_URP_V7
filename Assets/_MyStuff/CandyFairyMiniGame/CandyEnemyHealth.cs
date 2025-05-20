using UnityEngine;

public class CandyEnemyHealth : MonoBehaviour
{
    public int maxHealth = 3;
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

        Destroy(gameObject);
        // TODO: Add score reward here
    }
}

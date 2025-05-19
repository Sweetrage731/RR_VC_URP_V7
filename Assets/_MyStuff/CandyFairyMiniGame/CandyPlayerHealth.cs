using UnityEngine;
using System.Collections;

namespace CandyGame
{
    public class CandyPlayerHealth : MonoBehaviour
    {
        [Header("Candy Fairy Health Settings")]
        public int maxCandyHearts = 3;
        public float candyInvincibilityDuration = 2f;

        private int currentHearts;
        private bool isInvincible = false;

        [Header("Candy Fairy Visuals")]
        public GameObject candyDeathEffect;
        public Renderer candyRenderer;
        public Color hurtFlashColor = new Color(1f, 0.3f, 0.3f); // Cotton-candy red!
        public float flashDuration = 0.1f;

        void Start()
        {
            currentHearts = maxCandyHearts;
        }

        public void TakeCandyDamage(int damageAmount)
        {
            if (isInvincible || currentHearts <= 0)
                return;

            currentHearts -= damageAmount;
            StartCoroutine(FlashCandyHurt());

            if (currentHearts <= 0)
            {
                CandyDie();
            }
        }

        public void HealCandyHearts(int healAmount)
        {
            currentHearts = Mathf.Min(currentHearts + healAmount, maxCandyHearts);
        }

        public void GrantCandyInvincibility(float duration)
        {
            StartCoroutine(CandyInvincibility(duration));
        }

        private IEnumerator CandyInvincibility(float duration)
        {
            isInvincible = true;
            yield return new WaitForSeconds(duration);
            isInvincible = false;
        }

        private IEnumerator FlashCandyHurt()
        {
            if (candyRenderer)
            {
                Color originalColor = candyRenderer.material.color;
                candyRenderer.material.color = hurtFlashColor;
                yield return new WaitForSeconds(flashDuration);
                candyRenderer.material.color = originalColor;
            }
        }

        private void CandyDie()
        {
            if (candyDeathEffect)
                Instantiate(candyDeathEffect, transform.position, Quaternion.identity);

            Debug.Log("Candy Fairy Died.");
            // Add Game Over UI trigger or scene reload logic here
            Destroy(gameObject); // or disable, depending on your needs
        }

        public int GetCandyHearts()
        {
            return currentHearts;
        }

        public int GetMaxCandyHearts()
        {
            return maxCandyHearts;
        }

        public bool IsCandyInvincible()
        {
            return isInvincible;
        }
    }
}

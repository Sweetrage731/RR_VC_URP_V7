using UnityEngine;

namespace CandyGame
{
    public class CandyHeartAnimator : MonoBehaviour
    {
        private Vector3 originalScale;
        public float squishScale = 0.8f;
        public float squishDuration = 0.2f;

        private void Awake()
        {
            originalScale = transform.localScale;
        }

        public void Squish()
        {
            StopAllCoroutines();
            StartCoroutine(SquishRoutine());
        }

        private System.Collections.IEnumerator SquishRoutine()
        {
            Vector3 squished = new Vector3(originalScale.x * squishScale, originalScale.y * squishScale, originalScale.z);
            float t = 0f;

            while (t < squishDuration)
            {
                t += Time.deltaTime;
                transform.localScale = Vector3.Lerp(originalScale, squished, t / squishDuration);
                yield return null;
            }

            t = 0f;
            while (t < squishDuration)
            {
                t += Time.deltaTime;
                transform.localScale = Vector3.Lerp(squished, originalScale, t / squishDuration);
                yield return null;
            }

            transform.localScale = originalScale;
        }
    }
}

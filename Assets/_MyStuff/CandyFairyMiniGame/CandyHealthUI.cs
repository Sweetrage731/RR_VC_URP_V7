using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

namespace CandyGame
{
    public class CandyHealthUI : MonoBehaviour
    {
        public CandyPlayerHealth candyPlayer;
        public List<Image> heartIcons = new List<Image>();
        public Sprite fullHeart;
        public Sprite emptyHeart;

        void Update()
        {
            if (!candyPlayer) return;

            int current = candyPlayer.GetCandyHearts();
            int max = candyPlayer.GetMaxCandyHearts();

            for (int i = 0; i < heartIcons.Count; i++)
            {
                if (i < current)
                {
                    heartIcons[i].sprite = fullHeart;
                    heartIcons[i].enabled = true;
                }
                else if (i < max)
                {
                    // Only trigger squish if this heart just changed to empty
                    if (heartIcons[i].sprite != emptyHeart)
                    {
                        CandyHeartAnimator anim = heartIcons[i].GetComponent<CandyHeartAnimator>();
                        if (anim != null)
                            anim.Squish();
                    }

                    heartIcons[i].sprite = emptyHeart;
                    heartIcons[i].enabled = true;
                }
                else
                {
                    heartIcons[i].enabled = false;
                }
            }
        }
    }
}

using UnityEngine;
using TMPro;

public class CandyScoreUI : MonoBehaviour
{
    public TextMeshProUGUI scoreText;

    void Update()
    {
        scoreText.text = "Score: " + CandyScoreManager.GetScore();
    }
}
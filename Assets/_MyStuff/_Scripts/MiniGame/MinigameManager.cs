using UnityEngine;
using TMPro;

public class MinigameManager : MonoBehaviour
{
    public static MinigameManager Instance { get; private set; }

    public int score { get; private set; }
    public int coins { get; private set; }
    public float timer = 60f;

    public TMP_Text scoreText;
    public TMP_Text coinsText;
    public TMP_Text timerText;

    void Awake()
    {
        Instance = this;
        score = 0;
        coins = 0;
    }

    void Update()
    {
        if (timer > 0)
        {
            timer -= Time.deltaTime;
            timerText.text = "Time: " + Mathf.CeilToInt(timer);
            if (timer <= 0)
            {
                EndGame();
            }
        }
    }

    public void CollectItem(Collectible item)
    {
        score += item.points;
        coins += item.coins;
        UpdateUI();
    }

    void UpdateUI()
    {
        scoreText.text = "Score: " + score;
        coinsText.text = "Coins: " + coins;
    }

    void EndGame()
    {
        Debug.Log("Game Over! Score: " + score + ", Coins: " + coins);
        // You can trigger a Game Over UI here if needed!
    }
}

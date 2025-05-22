using UnityEngine;

public static class CandyScoreManager
{
    private static int currentScore = 0;

    public static void AddPoints(int points)
    {
        currentScore += points;
        Debug.Log("Score: " + currentScore);
    }

    public static int GetScore()
    {
        return currentScore;
    }

    public static void ResetScore()
    {
        currentScore = 0;
    }
}
using UnityEngine;

public enum CollectibleType
{
    Coin,
    Gem,
    Key,
    Custom
}

public class Collectible : MonoBehaviour
{
    public CollectibleType type;   // Now this is valid!
    public int points = 0;
    public int coins = 0;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            MinigameManager.Instance.CollectItem(this);
            Destroy(gameObject);
        }
    }
}

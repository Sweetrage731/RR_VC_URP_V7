using UnityEngine;

public class Collectible : MonoBehaviour
{
    public enum CollectibleType { Coin, Key, Gem, Custom }
    public CollectibleType type;
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

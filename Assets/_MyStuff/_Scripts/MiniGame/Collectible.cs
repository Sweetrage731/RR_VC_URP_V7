using UnityEngine;

public enum CollectibleType
{
    Coin,
    Gem,
    Key,
    Custom
}

[RequireComponent(typeof(Collider))]
public class Collectible : MonoBehaviour
{
    public CollectibleType type;
    public int points = 0;
    public int coins = 0;

    void Start()
    {
        Collider col = GetComponent<Collider>();
        if (col && !col.isTrigger)
            col.isTrigger = true;
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (MinigameManager.Instance)
                MinigameManager.Instance.CollectItem(this);
            Destroy(gameObject);
        }
    }
}

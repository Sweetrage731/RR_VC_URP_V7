using UnityEngine;

public class TestHit : MonoBehaviour
{
    void OnTriggerEnter(Collider other)
    {
        Debug.Log("Scene test hit: " + other.name);
    }
}

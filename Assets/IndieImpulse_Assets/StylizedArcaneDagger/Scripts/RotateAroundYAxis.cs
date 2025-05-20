using UnityEngine;
namespace IndieImpulseAssets
{
    public class RotateAroundYAxis : MonoBehaviour
    {
        public float rotationSpeed = 50f;

        // Update is called once per frame
        void Update()
        {
            // Rotate the object around the Y-axis with the specified rotationSpeed
            transform.Rotate(Vector3.up, rotationSpeed * Time.deltaTime);
        }
    }
}
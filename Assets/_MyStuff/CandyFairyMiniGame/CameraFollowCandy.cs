using UnityEngine;

public class CameraFollowCandy : MonoBehaviour
{
    public Transform target;                      // The player to follow
    public Vector3 offset = new Vector3(0f, 3f, -7f); // Camera offset
    public float followSpeed = 5f;                // Smooth follow speed
    public bool rotateWithPlayer = true;          // Toggle rotation with player

    void LateUpdate()
    {
        if (target == null) return;

        // Smooth position follow
        Vector3 desiredPosition = target.position + offset;
        transform.position = Vector3.Lerp(transform.position, desiredPosition, followSpeed * Time.deltaTime);

        // Optional rotation follow
        if (rotateWithPlayer)
        {
            Quaternion desiredRotation = Quaternion.Euler(0, target.eulerAngles.y, 0);
            transform.rotation = Quaternion.Lerp(transform.rotation, desiredRotation, followSpeed * Time.deltaTime);
        }
    }
}

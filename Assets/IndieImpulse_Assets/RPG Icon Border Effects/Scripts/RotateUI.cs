using UnityEngine;
namespace IndieImpulseAssets
{
    public enum RotateType
    {
        X, Y, Z, XZ, XYZ
    }

    public class RotateUI : MonoBehaviour
    {
        private RectTransform rectTransform;
        public float rotationSpeed = 30f; // Adjust the speed as needed
        public RotateType rotateType = RotateType.Z;
        void Update()
        {

            rectTransform = GetComponent<RectTransform>();
            switch (rotateType)
            {
                case RotateType.X:
                    // Rotate around x-axis
                    RotateAxis(Vector3.right);
                    break;
                case RotateType.Y:
                    // Rotate around y-axis
                    RotateAxis(Vector3.up);
                    break;
                case RotateType.Z:
                    // Rotate around z-axis
                    RotateAxis(Vector3.forward);
                    break;
                case RotateType.XYZ:
                    // Rotate around z-axis
                    RotateAxis(Vector3.up);
                    RotateAxis(Vector3.right);
                    RotateAxis(Vector3.forward);
                    break;
                case RotateType.XZ:
                    // Rotate around z-axis
                    RotateAxis(Vector3.right);
                    RotateAxis(Vector3.forward);
                    break;
            }





        }

        void RotateAxis(Vector3 axis)
        {
            float rotationAmount = rotationSpeed * Time.deltaTime;
            rectTransform.Rotate(axis, rotationAmount);
        }
    }
}
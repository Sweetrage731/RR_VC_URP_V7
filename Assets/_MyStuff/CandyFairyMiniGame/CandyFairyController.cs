using UnityEngine;
using UnityEngine.InputSystem;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
public class CandyFairyController : MonoBehaviour
{
    [Header("Movement Settings")]
    public float moveSpeed = 6f;
    public float rotationSpeed = 5f;
    public float jumpForce = 10f;
    public float floatGravityScale = 0.3f;

    [Header("Ground Check")]
    public Transform groundCheck;
    public float groundRadius = 0.2f;
    public LayerMask groundLayer;

    [Header("Camera Reference")]
    public Transform cameraTransform;

    [Header("Combat")]
    public GameObject candyCannon; // Prefab
    public float cannonSpeed = 15f;
    public Transform cannonSpawnPoint;

    private Rigidbody rb;
    private CandyControls controls;
    private Animator animator;

    private Vector2 moveInput;
    private bool isGrounded;
    private bool jumpQueued;
    private bool isFloating;
    private bool isDead;

    private Coroutine floatCoroutine;

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        animator = GetComponentInChildren<Animator>();
        controls = new CandyControls();

        controls.CandyPlayer.Move.performed += ctx => moveInput = ctx.ReadValue<Vector2>();
        controls.CandyPlayer.Move.canceled += _ => moveInput = Vector2.zero;

        controls.CandyPlayer.Jump.performed += _ =>
        {
            if (isGrounded)
            {
                jumpQueued = true;
                // Moved animator.SetTrigger("Jump") to Update()
            }
        };

        controls.CandyPlayer.Float.performed += _ =>
        {
            if (floatCoroutine != null) StopCoroutine(floatCoroutine);
            isFloating = true;
            animator.SetBool("IsFloating", true);
            floatCoroutine = StartCoroutine(EndFloatAfterDelay(3f));
        };

        controls.CandyPlayer.Float.canceled += _ =>
        {
            if (floatCoroutine != null) StopCoroutine(floatCoroutine);
            isFloating = false;
            animator.SetBool("IsFloating", false);
        };

        controls.CandyPlayer.Dash.performed += _ => Trigger("Dash");

        controls.CandyPlayer.Cast.performed += _ =>
        {
            FireCandyCannon();
            Trigger("Cast");
        };

        controls.CandyPlayer.Interact.performed += _ => Trigger("Interact");
        controls.CandyPlayer.Emote.performed += _ => Trigger("Emote");
        controls.CandyPlayer.Special.performed += _ => Trigger("Special");
    }

    void OnEnable() => controls.Enable();
    void OnDisable() => controls.Disable();

    void Update()
    {
        if (groundCheck == null || cameraTransform == null || isDead) return;

        isGrounded = Physics.CheckSphere(groundCheck.position, groundRadius, groundLayer);

        if (jumpQueued && isGrounded)
        {
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
            jumpQueued = false;

            if (animator != null)
                animator.SetTrigger("Jump"); // ✅ Play animation only when jump actually happens
        }
    }

    void FixedUpdate()
    {
        if (isDead) return;

        Vector3 camForward = cameraTransform.forward;
        Vector3 camRight = cameraTransform.right;
        camForward.y = 0f;
        camRight.y = 0f;
        camForward.Normalize();
        camRight.Normalize();

        Vector3 moveDir = camForward * moveInput.y + camRight * moveInput.x;

        if (moveDir.sqrMagnitude > 0.01f)
        {
            Quaternion targetRotation = Quaternion.LookRotation(moveDir);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, rotationSpeed * Time.fixedDeltaTime);
        }

        Vector3 velocity = moveDir.normalized * moveSpeed;
        velocity.y = rb.linearVelocity.y;
        rb.linearVelocity = velocity;

        if (!isGrounded && isFloating)
        {
            rb.AddForce(Vector3.down * (1 - floatGravityScale) * Physics.gravity.y, ForceMode.Acceleration);
        }

        if (animator != null)
        {
            float speed = new Vector2(rb.linearVelocity.x, rb.linearVelocity.z).magnitude;
            animator.SetFloat("MoveSpeed", speed);
        }
    }

    private IEnumerator EndFloatAfterDelay(float duration)
    {
        yield return new WaitForSeconds(duration);
        isFloating = false;
        if (animator != null)
            animator.SetBool("IsFloating", false);
    }

    private void Trigger(string trigger)
    {
        if (animator != null)
            animator.SetTrigger(trigger);
    }

    public void Die()
    {
        isDead = true;
        if (animator != null)
            animator.SetBool("IsDead", true);
        rb.linearVelocity = Vector3.zero;
        rb.isKinematic = true;
    }

    void OnDrawGizmosSelected()
    {
        if (groundCheck != null)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(groundCheck.position, groundRadius);
        }

        if (cannonSpawnPoint != null)
        {
            Gizmos.color = Color.magenta;
            Gizmos.DrawWireSphere(cannonSpawnPoint.position, 0.1f);
        }
    }

    private void FireCandyCannon()
    {
        if (candyCannon == null) return;

        Vector3 spawnPosition = cannonSpawnPoint != null ? cannonSpawnPoint.position : transform.position + transform.forward * 0.5f;
        GameObject projectile = Instantiate(candyCannon, spawnPosition, transform.rotation);

        Rigidbody rbProjectile = projectile.GetComponent<Rigidbody>();
        if (rbProjectile != null)
        {
            rbProjectile.linearVelocity = transform.forward * cannonSpeed;
        }
    }
}

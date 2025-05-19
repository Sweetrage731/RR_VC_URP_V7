using UnityEngine;
using UnityEngine.InputSystem;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
public class CandyFairyFullController : MonoBehaviour
{
    [Header("Movement Settings")]
    public float moveSpeed = 6f;
    public float rotationSpeed = 300f;
    public float jumpForce = 10f;
    public float floatGravityScale = 0.3f;

    [Header("Ground Check")]
    public Transform groundCheck;
    public float groundRadius = 0.2f;
    public LayerMask groundLayer;

    [Header("Camera Reference")]
    public Transform cameraTransform;

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
            if (isGrounded && !isDead)
            {
                jumpQueued = true;
                animator.SetTrigger("Jump");
            }
        };

        controls.CandyPlayer.Float.performed += _ =>
        {
            if (!isDead)
            {
                if (floatCoroutine != null) StopCoroutine(floatCoroutine);
                isFloating = true;
                animator.SetBool("IsFloating", true);
                floatCoroutine = StartCoroutine(EndFloatAfterDelay(3f));
            }
        };

        controls.CandyPlayer.Float.canceled += _ =>
        {
            if (!isDead)
            {
                if (floatCoroutine != null) StopCoroutine(floatCoroutine);
                isFloating = false;
                animator.SetBool("IsFloating", false);
            }
        };

        controls.CandyPlayer.Cast.performed += _ => Trigger("Cast");
        controls.CandyPlayer.Dash.performed += _ => Trigger("Dash");
        controls.CandyPlayer.Emote.performed += _ => Trigger("Emote");
        controls.CandyPlayer.Special.performed += _ => Trigger("Special");
        controls.CandyPlayer.Interact.performed += _ => Trigger("Interact");
    }

    void OnEnable() => controls.Enable();
    void OnDisable() => controls.Disable();

    void Update()
    {
        if (groundCheck == null || isDead) return;
        isGrounded = Physics.CheckSphere(groundCheck.position, groundRadius, groundLayer);

        if (jumpQueued && isGrounded)
        {
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
            jumpQueued = false;
        }
    }

    void FixedUpdate()
    {
        if (isDead || cameraTransform == null) return;

        Vector3 camForward = cameraTransform.forward;
        Vector3 camRight = cameraTransform.right;
        camForward.y = 0f;
        camRight.y = 0f;
        camForward.Normalize();
        camRight.Normalize();

        Vector3 moveDir = camForward * moveInput.y + camRight * moveInput.x;
        float moveAmount = moveDir.magnitude;

        if (moveAmount > 0.1f)
        {
            Quaternion targetRotation = Quaternion.LookRotation(moveDir);
            transform.rotation = Quaternion.RotateTowards(transform.rotation, targetRotation, rotationSpeed * Time.fixedDeltaTime);
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
            animator.SetFloat("MoveSpeed", moveAmount);
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
    }
}

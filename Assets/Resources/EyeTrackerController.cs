using UnityEngine;
using System.Collections;
using System.Collections.Generic; // Required for List

// Helper class to manage individual renderers for aggro effects
[System.Serializable]
public class AggroAffectedRenderer
{
    public Renderer renderer;
    public Material originalMaterialSnapshot;
    public MaterialPropertyBlock mpb;
    public Color originalBaseColor;
    public Color originalEmissionColor;
    public bool hasBaseColorProp;
    public bool hasEmissionProp;
    public int baseColorIdCache;
    public int emissionColorIdCache;

    public Color fadeStartBaseColor;
    public Color fadeStartEmissionColor;

    public AggroAffectedRenderer(Renderer rend, Color defaultOriginalBase, Color defaultOriginalEmission)
    {
        renderer = rend;
        mpb = new MaterialPropertyBlock();
        if (renderer == null)
        {
            return;
        }

        renderer.GetPropertyBlock(mpb);
        originalMaterialSnapshot = renderer.sharedMaterial;

        if (originalMaterialSnapshot == null)
        {
            hasBaseColorProp = false;
            hasEmissionProp = false;
            originalBaseColor = defaultOriginalBase;
            originalEmissionColor = defaultOriginalEmission;
            return;
        }

        if (originalMaterialSnapshot.HasProperty(EyeTrackerController.BaseColorID))
        {
            originalBaseColor = originalMaterialSnapshot.GetColor(EyeTrackerController.BaseColorID);
            hasBaseColorProp = true;
            baseColorIdCache = EyeTrackerController.BaseColorID;
        }
        else if (originalMaterialSnapshot.HasProperty(EyeTrackerController.ColorID))
        {
            originalBaseColor = originalMaterialSnapshot.GetColor(EyeTrackerController.ColorID);
            hasBaseColorProp = true;
            baseColorIdCache = EyeTrackerController.ColorID;
        }
        else
        {
            originalBaseColor = defaultOriginalBase;
            hasBaseColorProp = false;
        }

        if (originalMaterialSnapshot.HasProperty(EyeTrackerController.EmissionColorID))
        {
            originalEmissionColor = originalMaterialSnapshot.GetColor(EyeTrackerController.EmissionColorID);
            hasEmissionProp = true;
            emissionColorIdCache = EyeTrackerController.EmissionColorID;
        }
        else
        {
            originalEmissionColor = defaultOriginalEmission;
            hasEmissionProp = false;
        }
    }

    public void StoreCurrentColorsAsFadeStart()
    {
        if (renderer == null) return;
        renderer.GetPropertyBlock(mpb);
        fadeStartBaseColor = hasBaseColorProp ? mpb.GetColor(baseColorIdCache) : originalBaseColor;
        fadeStartEmissionColor = hasEmissionProp ? mpb.GetColor(emissionColorIdCache) : originalEmissionColor;
    }

    public void ApplyColorsToMPB(Color baseColor, Color emissionColorValue)
    {
        if (renderer == null) return;
        if (hasBaseColorProp) mpb.SetColor(baseColorIdCache, baseColor);
        if (hasEmissionProp) mpb.SetColor(emissionColorIdCache, emissionColorValue);
        renderer.SetPropertyBlock(mpb);
    }

    public void ResetToOriginalColors()
    {
        if (renderer == null) return;
        ApplyColorsToMPB(originalBaseColor, originalEmissionColor);
    }
}


public class EyeTrackerController : MonoBehaviour
{
    public enum EyeState
    {
        IDLE,
        LOOKING_RANDOM,
        NEUTRAL_POSE,
        SUSPICIOUS,
        TRACKING_PLAYER,
        BLINKING,
        AGGRO,
        AGGRO_SEARCHING,
        AGGRO_COOLDOWN
    }

    [Header("Current State (Read-Only)")]
    [SerializeField] private EyeState currentState = EyeState.IDLE;
    private EyeState _previousState = EyeState.IDLE;
    private EyeState _stateBeforeBlink = EyeState.IDLE;

    [Header("Model Orientation Offset")]
    [Tooltip("Euler angles describing how the model's actual 'front' (pupil) is rotated relative to a standard Z-Forward, Y-Up object. E.g., if pupil is along model's local +X axis when its rotation is (0,0,0), use (0, 90, 0).")]
    [SerializeField] private Vector3 modelRotationOffsetEuler = Vector3.zero;
    private Quaternion _modelCorrectionQuaternion;

    [Header("Player Settings")]
    [SerializeField] private Transform playerTransform;
    [SerializeField] private string playerTag = "Player";
    [SerializeField] private float sightRadius = 15f;
    [SerializeField] private float loseSightRadius = 18f;
    [Tooltip("Offset from the player's pivot where the eye should aim. Interpretation (local/world) depends on 'Use Player Local Offset'.")]
    [SerializeField] private Vector3 playerLookTargetOffset = Vector3.zero;
    [Tooltip("If true, Player Look Target Offset is applied in the player's local space. If false, it's a world space offset.")]
    [SerializeField] private bool usePlayerLocalOffset = true;
    [SerializeField] private float suspiciousDuration = 1.5f;
    private float _suspiciousStateEnterTime;
    private Vector3 _lastKnownPlayerActualTargetPosition;

    [Header("Eye Visuals & Materials")]
    [Tooltip("The primary renderer for the eye itself. Its material properties are used as fallback for additional renderers.")]
    [SerializeField] private Renderer eyeRenderer;
    [Tooltip("Original material for the main eye. Used for restoring after blink. Additional renderers use their own shared materials.")]
    [SerializeField] private Material originalMaterial;
    [Tooltip("Material to use for the main eye during blinking.")]
    [SerializeField] private Material blinkMaterial;
    [SerializeField] private Color aggroTintColor = new Color(1f, 0.2f, 0.2f, 1f);
    [SerializeField] private float aggroEmissionMultiplier = 2.0f;

    [Header("Additional Aggro-Affected Objects")]
    [Tooltip("Other renderers that should tint/glow during aggro states.")]
    [SerializeField] private Renderer[] additionalAggroRenderers;
    private List<AggroAffectedRenderer> _allAffectedRenderers = new List<AggroAffectedRenderer>();

    private Color _mainEyeOriginalBaseColor = Color.white;
    private Color _mainEyeOriginalEmissionColor = Color.black;

    public static readonly int BaseColorID = Shader.PropertyToID("_BaseColor");
    public static readonly int ColorID = Shader.PropertyToID("_Color");
    public static readonly int EmissionColorID = Shader.PropertyToID("_EmissionColor");

    [Header("Aggro Mode Visuals")]
    [Tooltip("Duration for the aggro color to fade in when entering AGGRO or AGGRO_SEARCHING states.")]
    [SerializeField][Min(0.01f)] private float aggroColorFadeInDuration = 0.2f;
    [Tooltip("Duration for the aggro color to fade out when entering AGGRO_COOLDOWN or transitioning to normal states.")]
    [SerializeField][Min(0.01f)] private float aggroColorFadeOutDuration = 1.5f;

    [Header("Blinking Behavior")]
    [SerializeField] private float minBlinkInterval = 2.5f;
    [SerializeField] private float maxBlinkInterval = 8f;
    [SerializeField] private float blinkDuration = 0.12f;
    [SerializeField][Range(0f, 1f)] private float doubleBlinkChance = 0.15f;
    private float _nextBlinkTime;
    private int _blinksToPerform = 1;
    private float _blinkSequenceEndTime;

    [Header("Idle & Looking Behavior")]
    [Tooltip("Desired resting orientation (pitch, yaw, roll) as if the model was standard Z-forward. The 'Model Rotation Offset' is applied after these angles to get the final pose. E.g., (0,0,0) for straight, (20,0,0) to pitch down.")]
    [SerializeField] private Vector3 neutralPoseEuler = new Vector3(0f, 0f, 0f);
    private Quaternion _finalCorrectedNeutralPoseLocalRotation;
    [SerializeField] private float minIdleActionInterval = 2f;
    [SerializeField] private float maxIdleActionInterval = 4.5f;
    [SerializeField][Range(0f, 1f)] private float chanceToInitiateSuspicion = 0.6f;
    [SerializeField][Range(0f, 1f)] private float chanceToLookNeutral = 0.25f;
    [SerializeField] private float maxIdleYawAngle = 45f;
    private float _nextIdleActionTime;

    [Header("Rotation & Movement")]
    [SerializeField] private float idleRotationSpeed = 1.5f;
    [SerializeField] private float suspiciousRotationSpeed = 2.5f;
    [SerializeField] private float trackingRotationSpeed = 4f;
    [SerializeField] private float aggroRotationSpeed = 7f;
    [SerializeField] private float searchingRotationSpeed = 2.0f;
    [SerializeField] private float cooldownTrackingSpeedMultiplier = 0.75f;
    [SerializeField] private AnimationCurve rotationSpeedCurve = AnimationCurve.EaseInOut(0, 0, 1, 1);
    private float _currentRotationSpeed;
    private Quaternion _targetRotation;
    private float _rotationProgress = 0f;
    private Quaternion _rotationStartQuaternion;

    [Header("Aggro Mode General")]
    [SerializeField] private Collider aggroTriggerCollider;
    [SerializeField] private float aggroCooldownDuration = 3f;
    [SerializeField] private float aggroSearchDuration = 5f;
    private float _aggroStateChangeTime;
    private bool _isPlayerInAggroZone = false;

    private bool _isFadingInAggroColor = false;
    private float _fadeInStartTime;
    private bool _isFadingOutAggroColor = false;
    private float _fadeOutStartTime;
    private bool _isCurrentlyInCooldownInitiatedByFullAggro = false;

    [Header("Pupil Iris (Bonus)")]
    [SerializeField] private Transform pupilIrisTransform;
    [SerializeField] private Vector3 pupilNormalScale = Vector3.one;
    [SerializeField] private Vector3 pupilSuspiciousScale = new Vector3(1.1f, 1.1f, 1f);
    [SerializeField] private Vector3 pupilAggroScale = new Vector3(1.6f, 1.6f, 1f);
    [SerializeField] private float pupilScaleSpeed = 4f;


    void Awake()
    {
        if (eyeRenderer == null) eyeRenderer = GetComponent<Renderer>();
        if (eyeRenderer == null) { Debug.LogError("EyeTrackerController: Main Eye Renderer not assigned or found on this GameObject!", this); enabled = false; return; }

        if (originalMaterial == null)
        {
            if (eyeRenderer.sharedMaterial != null)
            {
                originalMaterial = eyeRenderer.sharedMaterial;
            }
            else
            {
                Debug.LogError("EyeTrackerController: Original Material for main eye not assigned and no shared material on its renderer! Visuals may be incorrect.", this); enabled = false; return;
            }
        }
        eyeRenderer.sharedMaterial = originalMaterial;

        if (originalMaterial.HasProperty(BaseColorID)) { _mainEyeOriginalBaseColor = originalMaterial.GetColor(BaseColorID); }
        else if (originalMaterial.HasProperty(ColorID)) { _mainEyeOriginalBaseColor = originalMaterial.GetColor(ColorID); }

        if (originalMaterial.HasProperty(EmissionColorID)) { _mainEyeOriginalEmissionColor = originalMaterial.GetColor(EmissionColorID); }

        _allAffectedRenderers.Clear();
        _allAffectedRenderers.Add(new AggroAffectedRenderer(eyeRenderer, _mainEyeOriginalBaseColor, _mainEyeOriginalEmissionColor));

        if (additionalAggroRenderers != null)
        {
            foreach (var rend in additionalAggroRenderers)
            {
                if (rend != null && rend != eyeRenderer)
                {
                    _allAffectedRenderers.Add(new AggroAffectedRenderer(rend, _mainEyeOriginalBaseColor, _mainEyeOriginalEmissionColor));
                }
            }
        }

        if (blinkMaterial == null) Debug.LogWarning("EyeTrackerController: Blink Material not assigned. Blinking will fallback to disabling main eye renderer.", this);

        if (playerTransform == null && !string.IsNullOrEmpty(playerTag))
        {
            GameObject playerObj = GameObject.FindGameObjectWithTag(playerTag);
            if (playerObj != null) playerTransform = playerObj.transform;
        }

        if (playerTransform == null) Debug.LogWarning("EyeTrackerController: Player Transform not set. Player-related behaviors will be disabled.", this);
        _lastKnownPlayerActualTargetPosition = playerTransform != null ? GetPlayerTargetPosition() : transform.position + transform.forward * 5f;


        if (aggroTriggerCollider == null) Debug.LogWarning("EyeTrackerController: Aggro Trigger Collider not assigned. Trigger-based aggro will not work.", this);
    }

    void Start()
    {
        _modelCorrectionQuaternion = Quaternion.Euler(modelRotationOffsetEuler);
        _finalCorrectedNeutralPoseLocalRotation = Quaternion.Euler(neutralPoseEuler) * _modelCorrectionQuaternion;
        transform.localRotation = _finalCorrectedNeutralPoseLocalRotation;
        _targetRotation = _finalCorrectedNeutralPoseLocalRotation;
        _rotationStartQuaternion = _finalCorrectedNeutralPoseLocalRotation;
        _currentRotationSpeed = idleRotationSpeed;
        SetNextBlinkTime();
        _nextIdleActionTime = Time.time + Random.Range(minIdleActionInterval * 0.5f, maxIdleActionInterval * 0.5f);
        if (pupilIrisTransform != null) pupilIrisTransform.localScale = pupilNormalScale;

        InstantlySetVisualsToNormal();
        TransitionToState(EyeState.IDLE);
    }

    Vector3 GetPlayerTargetPosition()
    {
        if (playerTransform == null) return _lastKnownPlayerActualTargetPosition;
        Vector3 targetPosition = playerTransform.position;
        if (usePlayerLocalOffset) targetPosition += playerTransform.TransformDirection(playerLookTargetOffset);
        else targetPosition += playerLookTargetOffset;
        return targetPosition;
    }

    void Update()
    {
        float deltaTime = Time.deltaTime;
        HandleStateTransitions();
        HandleBlinkingLogic(deltaTime);

        if (_isFadingInAggroColor) HandleAggroFadeIn(deltaTime);
        if (_isFadingOutAggroColor) HandleAggroFadeOut(deltaTime);

        if (currentState == EyeState.BLINKING)
        {
            return;
        }

        ExecuteCurrentStateLogic(deltaTime);
        PerformRotation(deltaTime);
        HandlePupilScale(deltaTime);
    }

    void HandleStateTransitions()
    {
        if (currentState == EyeState.BLINKING) return;

        if (currentState == EyeState.AGGRO_COOLDOWN && _isPlayerInAggroZone)
        {
            TransitionToState(EyeState.AGGRO);
            return;
        }

        if (_isPlayerInAggroZone && currentState != EyeState.AGGRO && currentState != EyeState.AGGRO_SEARCHING && currentState != EyeState.AGGRO_COOLDOWN)
        { TransitionToState(EyeState.AGGRO); return; }

        if (!_isPlayerInAggroZone && (currentState == EyeState.AGGRO || currentState == EyeState.AGGRO_SEARCHING))
        { TransitionToState(EyeState.AGGRO_COOLDOWN); return; }

        switch (currentState)
        {
            case EyeState.IDLE:
                if (Time.time >= _nextIdleActionTime) DecideNextIdleAction();
                break;
            case EyeState.SUSPICIOUS:
                if (playerTransform == null || !IsPlayerInRadius(sightRadius)) TransitionToState(EyeState.IDLE);
                else if (Time.time > _suspiciousStateEnterTime + suspiciousDuration) TransitionToState(EyeState.TRACKING_PLAYER);
                break;
            case EyeState.TRACKING_PLAYER:
                if (playerTransform == null || !IsPlayerInRadius(loseSightRadius)) TransitionToState(EyeState.IDLE);
                break;
            case EyeState.LOOKING_RANDOM:
            case EyeState.NEUTRAL_POSE:
                if (_rotationProgress >= 1f && Quaternion.Angle(transform.localRotation, _targetRotation) < 0.5f)
                    TransitionToState(EyeState.IDLE);
                break;
            case EyeState.AGGRO_COOLDOWN:
                if (Time.time > _aggroStateChangeTime + aggroCooldownDuration && !_isFadingOutAggroColor)
                {
                    // Cooldown finished. Decide next state.
                    if (_isPlayerInAggroZone) // Should have been caught earlier, but as a safeguard
                    {
                        TransitionToState(EyeState.AGGRO);
                    }
                    else if (playerTransform != null && IsPlayerInRadius(loseSightRadius)) // Player still in general sight
                    {
                        TransitionToState(EyeState.TRACKING_PLAYER);
                    }
                    else // Player lost
                    {
                        TransitionToState(EyeState.IDLE);
                    }
                }
                break;
            case EyeState.AGGRO_SEARCHING:
                if (Time.time > _aggroStateChangeTime + aggroSearchDuration) TransitionToState(EyeState.AGGRO_COOLDOWN);
                else if (playerTransform != null && IsPlayerInLineOfSight(GetPlayerTargetPosition())) TransitionToState(EyeState.AGGRO);
                break;
            case EyeState.AGGRO:
                break;
        }
    }
    void ExecuteCurrentStateLogic(float deltaTime)
    {
        switch (currentState)
        {
            case EyeState.IDLE:
            case EyeState.LOOKING_RANDOM:
            case EyeState.NEUTRAL_POSE:
                break;
            case EyeState.SUSPICIOUS:
            case EyeState.TRACKING_PLAYER:
                if (playerTransform != null)
                {
                    Vector3 actualTargetPos = GetPlayerTargetPosition();
                    _lastKnownPlayerActualTargetPosition = actualTargetPos;
                    Vector3 worldDir = (actualTargetPos - transform.position).normalized;
                    if (worldDir != Vector3.zero) UpdateTargetRotation(ConvertWorldDirToCorrectedLocalTarget(worldDir));
                }
                break;
            case EyeState.AGGRO:
                if (playerTransform != null)
                {
                    Vector3 actualTargetPos = GetPlayerTargetPosition();
                    if (IsPlayerInLineOfSight(actualTargetPos))
                    {
                        _lastKnownPlayerActualTargetPosition = actualTargetPos;
                        Vector3 worldDir = (actualTargetPos - transform.position).normalized;
                        if (worldDir != Vector3.zero) UpdateTargetRotation(ConvertWorldDirToCorrectedLocalTarget(worldDir));
                    }
                    else
                    {
                        TransitionToState(EyeState.AGGRO_SEARCHING);
                    }
                }
                else
                {
                    TransitionToState(EyeState.AGGRO_COOLDOWN);
                }
                break;
            case EyeState.AGGRO_SEARCHING:
                if (playerTransform != null && IsPlayerInLineOfSight(GetPlayerTargetPosition()))
                {
                    TransitionToState(EyeState.AGGRO);
                    return;
                }
                if (Quaternion.Angle(transform.localRotation, _targetRotation) < 10f || _rotationProgress >= 1f)
                {
                    Vector3 offset = Random.onUnitSphere * 3f;
                    offset.y = Mathf.Clamp(Random.Range(-1f, 1f) * offset.magnitude * 0.3f, -1.5f, 1.5f);
                    Vector3 worldSearchTargetPos = _lastKnownPlayerActualTargetPosition + offset;
                    Vector3 worldDir = (worldSearchTargetPos - transform.position).normalized;
                    if (worldDir != Vector3.zero) UpdateTargetRotation(ConvertWorldDirToCorrectedLocalTarget(worldDir));
                }
                break;
            case EyeState.AGGRO_COOLDOWN:
                Vector3 targetToLookAtDuringCooldown = _lastKnownPlayerActualTargetPosition;
                if (playerTransform != null && IsPlayerInLineOfSight(GetPlayerTargetPosition()))
                {
                    targetToLookAtDuringCooldown = GetPlayerTargetPosition();
                    _lastKnownPlayerActualTargetPosition = targetToLookAtDuringCooldown;
                }

                if (targetToLookAtDuringCooldown != Vector3.zero)
                {
                    Vector3 worldDirToLkp = (targetToLookAtDuringCooldown - transform.position).normalized;
                    if (worldDirToLkp != Vector3.zero) UpdateTargetRotation(ConvertWorldDirToCorrectedLocalTarget(worldDirToLkp));
                }
                else
                {
                    UpdateTargetRotation(_finalCorrectedNeutralPoseLocalRotation);
                }
                break;
        }
    }
    void DecideNextIdleAction()
    {
        _nextIdleActionTime = Time.time + Random.Range(minIdleActionInterval, maxIdleActionInterval);
        if (playerTransform != null && IsPlayerInRadius(sightRadius) && Random.value < chanceToInitiateSuspicion)
            TransitionToState(EyeState.SUSPICIOUS);
        else if (Random.value < chanceToLookNeutral)
            TransitionToState(EyeState.NEUTRAL_POSE);
        else
            TransitionToState(EyeState.LOOKING_RANDOM);
    }
    void UpdateTargetRotation(Quaternion newCorrectedLocalTargetRotation, bool immediate = false)
    {
        if (immediate || Quaternion.Angle(_targetRotation, newCorrectedLocalTargetRotation) > 0.1f)
        {
            _rotationStartQuaternion = transform.localRotation;
            _targetRotation = newCorrectedLocalTargetRotation;
            _rotationProgress = 0f;
        }
    }
    void PerformRotation(float deltaTime)
    {
        if (Quaternion.Angle(transform.localRotation, _targetRotation) < 0.01f && _rotationProgress >= 1f)
        {
            transform.localRotation = _targetRotation;
            return;
        }

        if (_rotationProgress < 1f)
        {
            float angleToCover = Quaternion.Angle(_rotationStartQuaternion, _targetRotation);
            float dynamicSpeedFactor = Mathf.Max(0.1f, angleToCover / 90f);
            _rotationProgress += (_currentRotationSpeed / dynamicSpeedFactor) * deltaTime;
            _rotationProgress = Mathf.Clamp01(_rotationProgress);
            transform.localRotation = Quaternion.Slerp(_rotationStartQuaternion, _targetRotation, rotationSpeedCurve.Evaluate(_rotationProgress));
        }
        else
        {
            transform.localRotation = _targetRotation;
        }
    }

    #region Blinking
    void HandleBlinkingLogic(float deltaTime)
    {
        if (currentState == EyeState.BLINKING)
        {
            if (Time.time >= _blinkSequenceEndTime) PerformPostBlinkActions();
        }
        else if (Time.time >= _nextBlinkTime)
        {
            StartBlinkSequence();
        }
    }

    void StartBlinkSequence()
    {
        if (currentState == EyeState.BLINKING) return;
        _stateBeforeBlink = currentState;
        _blinksToPerform = (Random.value < doubleBlinkChance) ? 2 : 1;
        InitiateBlink();
    }

    void InitiateBlink()
    {
        if (blinkMaterial != null) eyeRenderer.sharedMaterial = blinkMaterial;
        else eyeRenderer.enabled = false;
        _blinkSequenceEndTime = Time.time + blinkDuration;
        currentState = EyeState.BLINKING;
    }

    void PerformPostBlinkActions()
    {
        if (blinkMaterial != null) eyeRenderer.sharedMaterial = originalMaterial;
        else eyeRenderer.enabled = true;

        EyeState stateToRestoreFromBlinkLogic = _stateBeforeBlink;
        bool wasFullAggroAndPlayerLeftDuringBlink =
            (_stateBeforeBlink == EyeState.AGGRO || _stateBeforeBlink == EyeState.AGGRO_SEARCHING) && !_isPlayerInAggroZone;

        if (wasFullAggroAndPlayerLeftDuringBlink)
        {
            stateToRestoreFromBlinkLogic = EyeState.AGGRO_COOLDOWN;
        }

        bool shouldBeVisuallyAggro = (stateToRestoreFromBlinkLogic == EyeState.AGGRO ||
                                     stateToRestoreFromBlinkLogic == EyeState.AGGRO_SEARCHING) ||
                                     (_isPlayerInAggroZone &&
                                      stateToRestoreFromBlinkLogic != EyeState.AGGRO_COOLDOWN &&
                                      stateToRestoreFromBlinkLogic != EyeState.IDLE &&
                                      stateToRestoreFromBlinkLogic != EyeState.LOOKING_RANDOM &&
                                      stateToRestoreFromBlinkLogic != EyeState.NEUTRAL_POSE);

        if (shouldBeVisuallyAggro)
        {
            if (wasFullAggroAndPlayerLeftDuringBlink && _isPlayerInAggroZone)
            {
                StartAggroFadeIn();
            }
            else if (!wasFullAggroAndPlayerLeftDuringBlink)
            {
                StartAggroFadeIn();
            }
            else
            {
                _isCurrentlyInCooldownInitiatedByFullAggro = true;
                StartAggroFadeOut();
            }
        }
        else if (stateToRestoreFromBlinkLogic == EyeState.AGGRO_COOLDOWN)
        {
            _isCurrentlyInCooldownInitiatedByFullAggro = wasFullAggroAndPlayerLeftDuringBlink || (_stateBeforeBlink == EyeState.AGGRO || _stateBeforeBlink == EyeState.AGGRO_SEARCHING);
            StartAggroFadeOut();
        }
        else
        {
            InstantlySetVisualsToNormal();
        }

        _blinksToPerform--;
        if (_blinksToPerform > 0)
        {
            StartCoroutine(DelayedNextBlink());
        }
        else
        {
            currentState = _stateBeforeBlink;
            SetNextBlinkTime();

            if ((currentState == EyeState.AGGRO || currentState == EyeState.AGGRO_SEARCHING) && !_isPlayerInAggroZone)
            {
                TransitionToState(EyeState.AGGRO_COOLDOWN);
            }
            else if (_isPlayerInAggroZone && currentState != EyeState.AGGRO && currentState != EyeState.AGGRO_SEARCHING && currentState != EyeState.AGGRO_COOLDOWN)
            {
                TransitionToState(EyeState.AGGRO);
            }
            else if (currentState == EyeState.AGGRO_COOLDOWN)
            {
                if (!_isFadingOutAggroColor) StartAggroFadeOut();
            }
        }
    }
    IEnumerator DelayedNextBlink()
    {
        yield return new WaitForSeconds(blinkDuration * 0.65f);
        if (_blinksToPerform > 0) InitiateBlink();
        else
        {
            currentState = _stateBeforeBlink;
            SetNextBlinkTime();
            if ((currentState == EyeState.AGGRO || currentState == EyeState.AGGRO_SEARCHING) && !_isPlayerInAggroZone) { TransitionToState(EyeState.AGGRO_COOLDOWN); }
            else if (_isPlayerInAggroZone && currentState != EyeState.AGGRO && currentState != EyeState.AGGRO_SEARCHING && currentState != EyeState.AGGRO_COOLDOWN) { TransitionToState(EyeState.AGGRO); }
        }
    }
    void SetNextBlinkTime() { _nextBlinkTime = Time.time + Random.Range(minBlinkInterval, maxBlinkInterval); }
    #endregion

    #region Visuals & Pupil

    void InstantlySetVisualsToAggro()
    {
        _isFadingInAggroColor = false;
        _isFadingOutAggroColor = false;
        foreach (var ar in _allAffectedRenderers)
        {
            if (ar.renderer == null) continue;
            Color baseC = ar.hasBaseColorProp ? aggroTintColor : ar.originalBaseColor;
            Color emissiveC = ar.hasEmissionProp ? aggroTintColor * aggroEmissionMultiplier : ar.originalEmissionColor;
            ar.ApplyColorsToMPB(baseC, emissiveC);
        }
    }

    void InstantlySetVisualsToNormal()
    {
        _isFadingInAggroColor = false;
        _isFadingOutAggroColor = false;
        _isCurrentlyInCooldownInitiatedByFullAggro = false;
        foreach (var ar in _allAffectedRenderers)
        {
            if (ar.renderer == null) continue;
            ar.ResetToOriginalColors();
        }
    }

    void StartAggroFadeIn()
    {
        if (_isFadingInAggroColor && (Time.time - _fadeInStartTime < aggroColorFadeInDuration * 0.95f)) return;

        _isFadingOutAggroColor = false;
        _isFadingInAggroColor = true;
        _isCurrentlyInCooldownInitiatedByFullAggro = false;
        _fadeInStartTime = Time.time;

        foreach (var ar in _allAffectedRenderers)
        {
            if (ar.renderer == null) continue;
            ar.StoreCurrentColorsAsFadeStart();
        }
    }

    void HandleAggroFadeIn(float deltaTime)
    {
        if (!_isFadingInAggroColor) return;

        float elapsed = Time.time - _fadeInStartTime;
        float progress = Mathf.Clamp01(elapsed / aggroColorFadeInDuration);

        foreach (var ar in _allAffectedRenderers)
        {
            if (ar.renderer == null) continue;
            Color targetBase = ar.hasBaseColorProp ? aggroTintColor : ar.originalBaseColor;
            Color targetEmission = ar.hasEmissionProp ? aggroTintColor * aggroEmissionMultiplier : ar.originalEmissionColor;

            Color currentBaseColor = Color.Lerp(ar.fadeStartBaseColor, targetBase, progress);
            Color currentEmissionColor = Color.Lerp(ar.fadeStartEmissionColor, targetEmission, progress);
            ar.ApplyColorsToMPB(currentBaseColor, currentEmissionColor);
        }

        if (progress >= 1.0f)
        {
            _isFadingInAggroColor = false;
            InstantlySetVisualsToAggro();
        }
    }

    void StartAggroFadeOut()
    {
        if (_isFadingOutAggroColor)
        {
            if (Time.time - _fadeOutStartTime < aggroColorFadeOutDuration * 0.05f)
            {
                return;
            }
        }

        _isFadingInAggroColor = false;
        _isFadingOutAggroColor = true;
        _fadeOutStartTime = Time.time;

        bool shouldUseFullAggroStartColor = _isCurrentlyInCooldownInitiatedByFullAggro;

        foreach (var ar in _allAffectedRenderers)
        {
            if (ar.renderer == null) continue;
            if (shouldUseFullAggroStartColor)
            {
                ar.fadeStartBaseColor = ar.hasBaseColorProp ? aggroTintColor : ar.originalBaseColor;
                ar.fadeStartEmissionColor = ar.hasEmissionProp ? aggroTintColor * aggroEmissionMultiplier : ar.originalEmissionColor;
            }
            else
            {
                ar.StoreCurrentColorsAsFadeStart();
            }
        }
    }

    void HandleAggroFadeOut(float deltaTime)
    {
        if (!_isFadingOutAggroColor) return;

        float elapsed = Time.time - _fadeOutStartTime;
        float progress = Mathf.Clamp01(elapsed / aggroColorFadeOutDuration);

        foreach (var ar in _allAffectedRenderers)
        {
            if (ar.renderer == null) continue;
            Color currentBaseColor = Color.Lerp(ar.fadeStartBaseColor, ar.originalBaseColor, progress);
            Color currentEmissionColor = Color.Lerp(ar.fadeStartEmissionColor, ar.originalEmissionColor, progress);
            ar.ApplyColorsToMPB(currentBaseColor, currentEmissionColor);
        }

        if (progress >= 1.0f)
        {
            _isFadingOutAggroColor = false;
            InstantlySetVisualsToNormal();
        }
    }

    void HandlePupilScale(float deltaTime)
    {
        if (pupilIrisTransform == null) return;
        Vector3 targetScale = pupilNormalScale;
        switch (currentState)
        {
            case EyeState.SUSPICIOUS: targetScale = pupilSuspiciousScale; break;
            case EyeState.AGGRO:
            case EyeState.AGGRO_SEARCHING:
            case EyeState.AGGRO_COOLDOWN:
                targetScale = pupilAggroScale; break;
        }
        if (Vector3.Distance(pupilIrisTransform.localScale, targetScale) > 0.001f)
            pupilIrisTransform.localScale = Vector3.Lerp(pupilIrisTransform.localScale, targetScale, pupilScaleSpeed * deltaTime);
    }
    #endregion

    #region State Management & Transitions
    Quaternion ConvertWorldDirToCorrectedLocalTarget(Vector3 worldDirection)
    {
        Quaternion standardWorldLookRot = Quaternion.LookRotation(worldDirection, transform.up);
        Quaternion standardLocalLookRot = ConvertWorldRotationToLocal(standardWorldLookRot);
        return standardLocalLookRot * _modelCorrectionQuaternion;
    }
    void TransitionToState(EyeState newState)
    {
        if (currentState == newState && currentState != EyeState.IDLE) return;

        EyeState actualPreviousState = currentState;
        _previousState = currentState;

        if ((actualPreviousState == EyeState.AGGRO || actualPreviousState == EyeState.AGGRO_SEARCHING))
        {
            if (newState == EyeState.AGGRO_COOLDOWN)
            {
                _isCurrentlyInCooldownInitiatedByFullAggro = true;
            }
            else if (newState != EyeState.AGGRO && newState != EyeState.AGGRO_SEARCHING && newState != EyeState.BLINKING)
            {
                InstantlySetVisualsToNormal();
            }
        }
        else if (actualPreviousState == EyeState.AGGRO_COOLDOWN)
        {
            if (newState != EyeState.AGGRO_COOLDOWN)
            {
                _isCurrentlyInCooldownInitiatedByFullAggro = false;
                if (newState != EyeState.IDLE && newState != EyeState.AGGRO && newState != EyeState.AGGRO_SEARCHING && newState != EyeState.BLINKING && newState != EyeState.TRACKING_PLAYER) // TRACKING_PLAYER will handle its own visuals
                {
                    InstantlySetVisualsToNormal();
                }
            }
        }


        currentState = newState;
        _rotationProgress = 0f;
        _rotationStartQuaternion = transform.localRotation;

        switch (newState)
        {
            case EyeState.IDLE:
                _currentRotationSpeed = idleRotationSpeed;
                _nextIdleActionTime = Time.time + Random.Range(minIdleActionInterval * 0.25f, maxIdleActionInterval * 0.75f);
                if (!_isFadingOutAggroColor)
                {
                    InstantlySetVisualsToNormal();
                }
                break;
            case EyeState.LOOKING_RANDOM:
                _currentRotationSpeed = idleRotationSpeed;
                float randomYaw = Random.Range(-maxIdleYawAngle, maxIdleYawAngle);
                UpdateTargetRotation(_finalCorrectedNeutralPoseLocalRotation * Quaternion.Euler(0f, randomYaw, 0f));
                if (!_isFadingOutAggroColor) InstantlySetVisualsToNormal();
                break;
            case EyeState.NEUTRAL_POSE:
                _currentRotationSpeed = idleRotationSpeed;
                UpdateTargetRotation(_finalCorrectedNeutralPoseLocalRotation);
                if (!_isFadingOutAggroColor) InstantlySetVisualsToNormal();
                break;
            case EyeState.SUSPICIOUS:
                _currentRotationSpeed = suspiciousRotationSpeed;
                _suspiciousStateEnterTime = Time.time;
                if (playerTransform != null)
                {
                    Vector3 actualTargetPos = GetPlayerTargetPosition();
                    _lastKnownPlayerActualTargetPosition = actualTargetPos;
                    Vector3 worldDir = (actualTargetPos - transform.position).normalized;
                    if (worldDir != Vector3.zero) UpdateTargetRotation(ConvertWorldDirToCorrectedLocalTarget(worldDir), true);
                }
                if (!_isFadingOutAggroColor) InstantlySetVisualsToNormal();
                break;
            case EyeState.TRACKING_PLAYER:
                _currentRotationSpeed = trackingRotationSpeed;
                if (!_isFadingOutAggroColor) InstantlySetVisualsToNormal(); // Ensure normal visuals if not coming from cooldown fade
                if (playerTransform != null) _lastKnownPlayerActualTargetPosition = GetPlayerTargetPosition(); // Ensure LKP is fresh
                break;
            case EyeState.AGGRO:
                StartAggroFadeIn();
                _currentRotationSpeed = aggroRotationSpeed;
                _aggroStateChangeTime = Time.time;
                if (playerTransform != null) _lastKnownPlayerActualTargetPosition = GetPlayerTargetPosition();
                break;
            case EyeState.AGGRO_SEARCHING:
                StartAggroFadeIn();
                _currentRotationSpeed = searchingRotationSpeed;
                _aggroStateChangeTime = Time.time;
                if (playerTransform != null) _lastKnownPlayerActualTargetPosition = GetPlayerTargetPosition();
                else if (_lastKnownPlayerActualTargetPosition == Vector3.zero) _lastKnownPlayerActualTargetPosition = transform.position + transform.forward * 5f;
                Vector3 worldDirLKP = (_lastKnownPlayerActualTargetPosition - transform.position).normalized;
                if (worldDirLKP != Vector3.zero) UpdateTargetRotation(ConvertWorldDirToCorrectedLocalTarget(worldDirLKP), true);
                break;
            case EyeState.AGGRO_COOLDOWN:
                _currentRotationSpeed = trackingRotationSpeed * cooldownTrackingSpeedMultiplier;
                _aggroStateChangeTime = Time.time;
                if (actualPreviousState != EyeState.AGGRO && actualPreviousState != EyeState.AGGRO_SEARCHING && actualPreviousState != EyeState.BLINKING)
                {
                    _isCurrentlyInCooldownInitiatedByFullAggro = false;
                }
                StartAggroFadeOut();
                if (playerTransform != null) _lastKnownPlayerActualTargetPosition = GetPlayerTargetPosition();
                break;
        }
    }
    #endregion

    #region Utility & Triggers
    Quaternion ConvertWorldRotationToLocal(Quaternion worldRotation)
    {
        return transform.parent != null ? Quaternion.Inverse(transform.parent.rotation) * worldRotation : worldRotation;
    }
    bool IsPlayerInRadius(float radius)
    {
        if (playerTransform == null) return false;
        // Use LKP for distance check if player is technically null but we have a recent position
        // Or, more simply, just use GetPlayerTargetPosition which falls back to LKP.
        return Vector3.Distance(transform.position, GetPlayerTargetPosition()) <= radius;
    }
    bool IsPlayerInLineOfSight(Vector3 targetPoint)
    {
        // If playerTransform is null, rely on LKP for LoS check target.
        Vector3 pointToCheck = (playerTransform != null) ? targetPoint : _lastKnownPlayerActualTargetPosition;

        // If still no valid point (e.g., LKP is zero and player is null), assume no LoS.
        if (pointToCheck == Vector3.zero && playerTransform == null) return false;


        RaycastHit hit;
        Vector3 origin = transform.position;
        Vector3 directionToTarget = (pointToCheck - origin);

        if (directionToTarget.sqrMagnitude == 0) return true;

        float distanceToTarget = directionToTarget.magnitude;
        // Use loseSightRadius for LoS checks, not just the general player radius checks.
        if (distanceToTarget > loseSightRadius * 1.1f) return false;

        if (Physics.Raycast(origin, directionToTarget.normalized, out hit, distanceToTarget))
        {
            // If we hit the player (if they exist)
            if (playerTransform != null && (hit.transform == playerTransform || (hit.collider.attachedRigidbody != null && hit.collider.attachedRigidbody.transform == playerTransform)))
            {
                return true;
            }
            // If we hit something else *before* reaching the (approximate) target point.
            // This is important if checking LoS to LKP when player is null or far.
            if (hit.distance < distanceToTarget - 0.1f)
            {
                return false; // Obstruction
            }
            // If we hit something at or very near the target point (could be part of player if playerTransform is null but LKP is accurate)
            return true;
        }
        return true; // No obstruction found up to target distance
    }
    void OnTriggerEnter(Collider other)
    {
        if (playerTransform != null && (other.transform == playerTransform || (other.attachedRigidbody && other.attachedRigidbody.transform == playerTransform)))
        {
            _isPlayerInAggroZone = true;
        }
    }
    void OnTriggerExit(Collider other)
    {
        if (playerTransform != null && (other.transform == playerTransform || (other.attachedRigidbody && other.attachedRigidbody.transform == playerTransform)))
        {
            _isPlayerInAggroZone = false;
        }
    }
    #endregion

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.yellow; Gizmos.DrawWireSphere(transform.position, sightRadius);
        Gizmos.color = Color.grey; Gizmos.DrawWireSphere(transform.position, loseSightRadius);

        if (aggroTriggerCollider != null && aggroTriggerCollider.isTrigger)
        {
            Gizmos.color = Color.red;
            Matrix4x4 originalMatrix = Gizmos.matrix;
            Gizmos.matrix = Matrix4x4.TRS(aggroTriggerCollider.transform.position, aggroTriggerCollider.transform.rotation, aggroTriggerCollider.transform.lossyScale);
            if (aggroTriggerCollider is SphereCollider sphere) Gizmos.DrawWireSphere(sphere.center, sphere.radius);
            else if (aggroTriggerCollider is BoxCollider box) Gizmos.DrawWireCube(box.center, box.size);
            Gizmos.matrix = originalMatrix;
        }

        Gizmos.color = Color.cyan;
        Quaternion currentActualFacingRotation = transform.localRotation * Quaternion.Inverse(_modelCorrectionQuaternion);
        Vector3 worldCurrentActualFwd = transform.parent != null ? transform.parent.rotation * (currentActualFacingRotation * Vector3.forward) : (currentActualFacingRotation * Vector3.forward);
        Gizmos.DrawRay(transform.position, worldCurrentActualFwd.normalized * 2.5f);

        Gizmos.color = Color.blue;
        Quaternion targetActualFacingRotation = _targetRotation * Quaternion.Inverse(_modelCorrectionQuaternion);
        Vector3 worldTargetActualFwd = transform.parent != null ? transform.parent.rotation * (targetActualFacingRotation * Vector3.forward) : (targetActualFacingRotation * Vector3.forward);
        Gizmos.DrawRay(transform.position, worldTargetActualFwd.normalized * 2f);

        Gizmos.color = Color.green;
        Quaternion neutralActualFacingRotation = _finalCorrectedNeutralPoseLocalRotation * Quaternion.Inverse(_modelCorrectionQuaternion);
        Vector3 worldNeutralActualFwd = transform.parent != null ? transform.parent.rotation * (neutralActualFacingRotation * Vector3.forward) : (neutralActualFacingRotation * Vector3.forward);
        Gizmos.DrawRay(transform.position, worldNeutralActualFwd.normalized * 1.5f);

        if (Application.isPlaying)
        {
            if (playerTransform != null && (currentState == EyeState.SUSPICIOUS || currentState == EyeState.TRACKING_PLAYER || currentState == EyeState.AGGRO || currentState == EyeState.AGGRO_SEARCHING || currentState == EyeState.AGGRO_COOLDOWN))
            {
                Gizmos.color = Color.cyan;
                Vector3 playerAimTarget = GetPlayerTargetPosition();
                Gizmos.DrawSphere(playerAimTarget, 0.1f);
                Gizmos.DrawLine(transform.position, playerAimTarget);
            }
            if (_lastKnownPlayerActualTargetPosition != Vector3.zero && (currentState == EyeState.AGGRO_SEARCHING || currentState == EyeState.AGGRO_COOLDOWN || playerTransform == null))
            {
                Gizmos.color = Color.magenta;
                Gizmos.DrawLine(transform.position, _lastKnownPlayerActualTargetPosition);
                Gizmos.DrawSphere(_lastKnownPlayerActualTargetPosition, 0.08f);
            }
        }
    }
}
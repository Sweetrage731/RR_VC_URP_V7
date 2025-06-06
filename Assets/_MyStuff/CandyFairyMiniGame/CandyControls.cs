//------------------------------------------------------------------------------
// <auto-generated>
//     This code was auto-generated by com.unity.inputsystem:InputActionCodeGenerator
//     version 1.11.2
//     from Assets/_MyStuff/CandyFairyMiniGame/CandyControls.inputactions
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Utilities;

public partial class @CandyControls: IInputActionCollection2, IDisposable
{
    public InputActionAsset asset { get; }
    public @CandyControls()
    {
        asset = InputActionAsset.FromJson(@"{
    ""name"": ""CandyControls"",
    ""maps"": [
        {
            ""name"": ""CandyPlayer"",
            ""id"": ""a1ec22cd-b9ef-401e-a5aa-914781baa436"",
            ""actions"": [
                {
                    ""name"": ""Move"",
                    ""type"": ""Value"",
                    ""id"": ""59bad9a0-c14f-481d-b213-2587f24f4c2a"",
                    ""expectedControlType"": ""Vector2"",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": true
                },
                {
                    ""name"": ""Jump"",
                    ""type"": ""Button"",
                    ""id"": ""3041ebd5-c7bd-4c33-82ce-e0deaddcd4de"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                },
                {
                    ""name"": ""Float"",
                    ""type"": ""Button"",
                    ""id"": ""0b48df0e-edea-4d7f-bf53-57d0be35e521"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                },
                {
                    ""name"": ""Dash"",
                    ""type"": ""Button"",
                    ""id"": ""7506dac3-0402-43b1-bc6f-cca0bbb7d7c9"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                },
                {
                    ""name"": ""Cast"",
                    ""type"": ""Button"",
                    ""id"": ""8314f7d0-70b7-489d-99eb-41db544373fd"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                },
                {
                    ""name"": ""Interact"",
                    ""type"": ""Button"",
                    ""id"": ""140b5b88-860a-434f-af3c-17c5b7bb9fa3"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                },
                {
                    ""name"": ""Emote"",
                    ""type"": ""Button"",
                    ""id"": ""693f01c5-55df-4b79-b34c-7b56aae2cdeb"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                },
                {
                    ""name"": ""Special"",
                    ""type"": ""Button"",
                    ""id"": ""ec1a2fb2-d3b5-4d92-92a7-cfbe929bcf32"",
                    ""expectedControlType"": """",
                    ""processors"": """",
                    ""interactions"": """",
                    ""initialStateCheck"": false
                }
            ],
            ""bindings"": [
                {
                    ""name"": ""2D Vector"",
                    ""id"": ""ffa2f180-e0f5-438c-8cb2-08179cb82277"",
                    ""path"": ""2DVector"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": true,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""up"",
                    ""id"": ""97f3b37c-a942-4369-ad34-9cb489cfa23c"",
                    ""path"": ""<Keyboard>/w"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""down"",
                    ""id"": ""5099d548-0fd7-4c23-8bc6-ef57aacd2768"",
                    ""path"": ""<Keyboard>/s"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""left"",
                    ""id"": ""b6430127-6a8c-4214-aa6e-505ff68847f7"",
                    ""path"": ""<Keyboard>/a"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""right"",
                    ""id"": ""d7828e0c-2a82-4b10-9825-abe298213d5e"",
                    ""path"": ""<Keyboard>/d"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""2D Vector"",
                    ""id"": ""cbb8ff44-1f38-40e5-ae65-1cad5a8c1263"",
                    ""path"": ""2DVector"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": true,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""up"",
                    ""id"": ""1aeeec47-da5e-4006-a363-ef8d4eca850d"",
                    ""path"": ""<Keyboard>/upArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""down"",
                    ""id"": ""289abf29-1ee0-402b-ae8c-8ade08b0aa30"",
                    ""path"": ""<Keyboard>/downArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""left"",
                    ""id"": ""5a6adfa9-912b-4e6c-84d8-9720a25c481d"",
                    ""path"": ""<Keyboard>/leftArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""right"",
                    ""id"": ""c74dae1c-40d2-4bb4-9f16-2bd5127bd346"",
                    ""path"": ""<Keyboard>/rightArrow"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""2D Vector"",
                    ""id"": ""bdcafd41-1c6a-425a-a084-1f7fa7e1855b"",
                    ""path"": ""2DVector"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": true,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": ""up"",
                    ""id"": ""6fcdc06a-f9a0-44e5-95f6-8ce4a9a0c1b8"",
                    ""path"": ""<Gamepad>/dpad/up"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""down"",
                    ""id"": ""a981a650-9011-46de-af9d-7e8cf82514d3"",
                    ""path"": ""<Gamepad>/dpad/down"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""left"",
                    ""id"": ""a12595a7-9cf1-439e-a8e7-913a1ee18a61"",
                    ""path"": ""<Joystick>/stick/left"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": ""right"",
                    ""id"": ""ed2faba3-775e-499c-866c-a51bd4fabbbc"",
                    ""path"": ""<Gamepad>/dpad/right"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Move"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": true
                },
                {
                    ""name"": """",
                    ""id"": ""ee5d136b-80ba-4f19-96ad-60208cb00f94"",
                    ""path"": ""<Keyboard>/space"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Jump"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""6f5632eb-f292-448c-834d-f7deca4d3a36"",
                    ""path"": ""<Gamepad>/buttonSouth"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Jump"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""5b3589c3-5717-4430-9741-20249728c995"",
                    ""path"": ""<Keyboard>/f"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Float"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""cbb851ff-69ff-45a0-a8ba-01134c20b5f1"",
                    ""path"": ""<Gamepad>/leftTrigger"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Float"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""d7b336d6-adab-4267-8b5f-f58594b7e485"",
                    ""path"": ""<Keyboard>/leftShift"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Dash"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""0a4b9085-0634-46e5-a3cc-e29f01603ae5"",
                    ""path"": ""<Keyboard>/rightShift"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Dash"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""4e426086-3dbb-4ed9-9a29-a95725ffc35d"",
                    ""path"": ""<Gamepad>/rightShoulder"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Dash"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""f2b06e50-b416-45e3-8dd5-09761dbddc4f"",
                    ""path"": ""<Keyboard>/q"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Dash"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""93374f39-e78a-41f3-84e6-ce1a0dca2c5c"",
                    ""path"": ""<Keyboard>/0"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Cast"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""08cea196-885e-4f57-9c7d-d8973b0bd93c"",
                    ""path"": ""<Keyboard>/leftAlt"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Cast"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""22699cbb-ab2e-4da7-877e-5cc930f28f50"",
                    ""path"": ""<Keyboard>/rightAlt"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Cast"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""fb12b408-d09e-4c42-bc9b-2e3519b1b8c9"",
                    ""path"": ""<Gamepad>/rightTrigger"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Cast"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""fc588f2f-edd7-4141-82c0-d38aef8b7b4b"",
                    ""path"": ""<Keyboard>/z"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Interact"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""5bff8768-f874-4e5e-bb9b-b027ef6d3c74"",
                    ""path"": ""<Keyboard>/i"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Interact"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""cd86cd29-4a79-419c-8dc4-d50a95ae4675"",
                    ""path"": ""<Gamepad>/buttonEast"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Interact"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""3e784cc8-bdc2-4040-b3e0-21543bb1b4d1"",
                    ""path"": ""<Keyboard>/e"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Emote"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""14e4502e-1a1f-4142-8eee-e0756ca3b5b0"",
                    ""path"": ""<Gamepad>/rightStickPress"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Emote"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""f8c88ef8-f2dd-40a5-8f11-ac26a74ad4c9"",
                    ""path"": ""<Keyboard>/x"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Special"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""7c32f2bb-a47c-43d6-8ee5-4528bde1a8eb"",
                    ""path"": ""<Keyboard>/numpad1"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Special"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                },
                {
                    ""name"": """",
                    ""id"": ""267ef185-efb3-4b71-83da-1e9377d76e86"",
                    ""path"": ""<Gamepad>/buttonWest"",
                    ""interactions"": """",
                    ""processors"": """",
                    ""groups"": """",
                    ""action"": ""Special"",
                    ""isComposite"": false,
                    ""isPartOfComposite"": false
                }
            ]
        }
    ],
    ""controlSchemes"": []
}");
        // CandyPlayer
        m_CandyPlayer = asset.FindActionMap("CandyPlayer", throwIfNotFound: true);
        m_CandyPlayer_Move = m_CandyPlayer.FindAction("Move", throwIfNotFound: true);
        m_CandyPlayer_Jump = m_CandyPlayer.FindAction("Jump", throwIfNotFound: true);
        m_CandyPlayer_Float = m_CandyPlayer.FindAction("Float", throwIfNotFound: true);
        m_CandyPlayer_Dash = m_CandyPlayer.FindAction("Dash", throwIfNotFound: true);
        m_CandyPlayer_Cast = m_CandyPlayer.FindAction("Cast", throwIfNotFound: true);
        m_CandyPlayer_Interact = m_CandyPlayer.FindAction("Interact", throwIfNotFound: true);
        m_CandyPlayer_Emote = m_CandyPlayer.FindAction("Emote", throwIfNotFound: true);
        m_CandyPlayer_Special = m_CandyPlayer.FindAction("Special", throwIfNotFound: true);
    }

    ~@CandyControls()
    {
        UnityEngine.Debug.Assert(!m_CandyPlayer.enabled, "This will cause a leak and performance issues, CandyControls.CandyPlayer.Disable() has not been called.");
    }

    public void Dispose()
    {
        UnityEngine.Object.Destroy(asset);
    }

    public InputBinding? bindingMask
    {
        get => asset.bindingMask;
        set => asset.bindingMask = value;
    }

    public ReadOnlyArray<InputDevice>? devices
    {
        get => asset.devices;
        set => asset.devices = value;
    }

    public ReadOnlyArray<InputControlScheme> controlSchemes => asset.controlSchemes;

    public bool Contains(InputAction action)
    {
        return asset.Contains(action);
    }

    public IEnumerator<InputAction> GetEnumerator()
    {
        return asset.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }

    public void Enable()
    {
        asset.Enable();
    }

    public void Disable()
    {
        asset.Disable();
    }

    public IEnumerable<InputBinding> bindings => asset.bindings;

    public InputAction FindAction(string actionNameOrId, bool throwIfNotFound = false)
    {
        return asset.FindAction(actionNameOrId, throwIfNotFound);
    }

    public int FindBinding(InputBinding bindingMask, out InputAction action)
    {
        return asset.FindBinding(bindingMask, out action);
    }

    // CandyPlayer
    private readonly InputActionMap m_CandyPlayer;
    private List<ICandyPlayerActions> m_CandyPlayerActionsCallbackInterfaces = new List<ICandyPlayerActions>();
    private readonly InputAction m_CandyPlayer_Move;
    private readonly InputAction m_CandyPlayer_Jump;
    private readonly InputAction m_CandyPlayer_Float;
    private readonly InputAction m_CandyPlayer_Dash;
    private readonly InputAction m_CandyPlayer_Cast;
    private readonly InputAction m_CandyPlayer_Interact;
    private readonly InputAction m_CandyPlayer_Emote;
    private readonly InputAction m_CandyPlayer_Special;
    public struct CandyPlayerActions
    {
        private @CandyControls m_Wrapper;
        public CandyPlayerActions(@CandyControls wrapper) { m_Wrapper = wrapper; }
        public InputAction @Move => m_Wrapper.m_CandyPlayer_Move;
        public InputAction @Jump => m_Wrapper.m_CandyPlayer_Jump;
        public InputAction @Float => m_Wrapper.m_CandyPlayer_Float;
        public InputAction @Dash => m_Wrapper.m_CandyPlayer_Dash;
        public InputAction @Cast => m_Wrapper.m_CandyPlayer_Cast;
        public InputAction @Interact => m_Wrapper.m_CandyPlayer_Interact;
        public InputAction @Emote => m_Wrapper.m_CandyPlayer_Emote;
        public InputAction @Special => m_Wrapper.m_CandyPlayer_Special;
        public InputActionMap Get() { return m_Wrapper.m_CandyPlayer; }
        public void Enable() { Get().Enable(); }
        public void Disable() { Get().Disable(); }
        public bool enabled => Get().enabled;
        public static implicit operator InputActionMap(CandyPlayerActions set) { return set.Get(); }
        public void AddCallbacks(ICandyPlayerActions instance)
        {
            if (instance == null || m_Wrapper.m_CandyPlayerActionsCallbackInterfaces.Contains(instance)) return;
            m_Wrapper.m_CandyPlayerActionsCallbackInterfaces.Add(instance);
            @Move.started += instance.OnMove;
            @Move.performed += instance.OnMove;
            @Move.canceled += instance.OnMove;
            @Jump.started += instance.OnJump;
            @Jump.performed += instance.OnJump;
            @Jump.canceled += instance.OnJump;
            @Float.started += instance.OnFloat;
            @Float.performed += instance.OnFloat;
            @Float.canceled += instance.OnFloat;
            @Dash.started += instance.OnDash;
            @Dash.performed += instance.OnDash;
            @Dash.canceled += instance.OnDash;
            @Cast.started += instance.OnCast;
            @Cast.performed += instance.OnCast;
            @Cast.canceled += instance.OnCast;
            @Interact.started += instance.OnInteract;
            @Interact.performed += instance.OnInteract;
            @Interact.canceled += instance.OnInteract;
            @Emote.started += instance.OnEmote;
            @Emote.performed += instance.OnEmote;
            @Emote.canceled += instance.OnEmote;
            @Special.started += instance.OnSpecial;
            @Special.performed += instance.OnSpecial;
            @Special.canceled += instance.OnSpecial;
        }

        private void UnregisterCallbacks(ICandyPlayerActions instance)
        {
            @Move.started -= instance.OnMove;
            @Move.performed -= instance.OnMove;
            @Move.canceled -= instance.OnMove;
            @Jump.started -= instance.OnJump;
            @Jump.performed -= instance.OnJump;
            @Jump.canceled -= instance.OnJump;
            @Float.started -= instance.OnFloat;
            @Float.performed -= instance.OnFloat;
            @Float.canceled -= instance.OnFloat;
            @Dash.started -= instance.OnDash;
            @Dash.performed -= instance.OnDash;
            @Dash.canceled -= instance.OnDash;
            @Cast.started -= instance.OnCast;
            @Cast.performed -= instance.OnCast;
            @Cast.canceled -= instance.OnCast;
            @Interact.started -= instance.OnInteract;
            @Interact.performed -= instance.OnInteract;
            @Interact.canceled -= instance.OnInteract;
            @Emote.started -= instance.OnEmote;
            @Emote.performed -= instance.OnEmote;
            @Emote.canceled -= instance.OnEmote;
            @Special.started -= instance.OnSpecial;
            @Special.performed -= instance.OnSpecial;
            @Special.canceled -= instance.OnSpecial;
        }

        public void RemoveCallbacks(ICandyPlayerActions instance)
        {
            if (m_Wrapper.m_CandyPlayerActionsCallbackInterfaces.Remove(instance))
                UnregisterCallbacks(instance);
        }

        public void SetCallbacks(ICandyPlayerActions instance)
        {
            foreach (var item in m_Wrapper.m_CandyPlayerActionsCallbackInterfaces)
                UnregisterCallbacks(item);
            m_Wrapper.m_CandyPlayerActionsCallbackInterfaces.Clear();
            AddCallbacks(instance);
        }
    }
    public CandyPlayerActions @CandyPlayer => new CandyPlayerActions(this);
    public interface ICandyPlayerActions
    {
        void OnMove(InputAction.CallbackContext context);
        void OnJump(InputAction.CallbackContext context);
        void OnFloat(InputAction.CallbackContext context);
        void OnDash(InputAction.CallbackContext context);
        void OnCast(InputAction.CallbackContext context);
        void OnInteract(InputAction.CallbackContext context);
        void OnEmote(InputAction.CallbackContext context);
        void OnSpecial(InputAction.CallbackContext context);
    }
}

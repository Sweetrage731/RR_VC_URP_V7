﻿using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace Atavism
{
    [HelpURL("https://unity.wiki.atavismonline.com/project/interactive-object-profile")]
    public class InteractiveObject : MonoBehaviour
    {

        public int id = -1;
        public int profileId = -1;
        public GameObject prefab = null;
        public string interactionType;
        public int interactionID = -1;
        public string interactionData1;
        public string interactionData2;
        public string interactionData3;
        public int questReqID = -1;
        public float interactTimeReq = 0;
        public int refreshDuration = 0;
        public Texture2D cursorIcon;
        public bool highlight = true;
        public Color highlightColour = Color.cyan;
        float cooldown = 0.5f;
        float cooldownEnds;
        public int minLevel = 1;
        public int maxLevel = 99;
        public int itemRequirement = -1;
        public int itemCountRequirement = 0;
        public bool itemRequirementGet = true;
        public int currencyRequirement = -1;
        public int currencyCountRequirement = 0;
        public bool currencyRequirementGet = true;
        public bool makeBusy = true;
        public float despawnTime = 0;
        public float despawnDelay = 0;
        public int useLimit = -1;
        public float interactDistance = 9;
        
        public string interactCoordEffectName;
        public GameObject interactCoordEffect;
        public List<GameObject> activateCoordEffects;
        // public List<string> activateCoordEffectsNames;
        // public string deactivateCoordEffectName;
        // public GameObject deactivateCoordEffect;

        public bool isLODChild = false;

        string currentState = "";
        Color initialColor;
        bool active = false;
        bool selected = false;
        Renderer[] renderers;
        Color[] initialColors;
        bool mouseOver = false;
        float timeClick = 0f;

        // Use this for initialization
        void Start()
        {
            cooldownEnds = Time.time;
            var node = GetComponent<AtavismNode>();
          //  Debug.Log("Interactive Object "+node);
            if(node == null)
               gameObject.AddComponent<AtavismNode>();
            GetComponent<AtavismNode>().AddLocalProperty("targetable", false);
            GetComponent<AtavismNode>().AddLocalProperty("active", active);

            if (highlight)
                if (GetComponent<Renderer>() != null)
                {
                    initialColor = GetComponent<Renderer>().material.color;
                }
                else
                {
                    renderers = GetComponentsInChildren<Renderer>();
                    initialColors = new Color[renderers.Length];
                    for (int i = 0; i < renderers.Length; i++)
                    {
                        if (renderers[i].material.HasProperty("_Color"))
                            initialColors[i] = renderers[i].material.color;
                    }
                }

            // Add child component to all children with colliders
            foreach (Collider child in GetComponentsInChildren<Collider>())
            {
                if (child.gameObject != gameObject)
                    child.gameObject.AddComponent<ObjectChildMouseDetector>();
            }
            if(id > 0)
                InteractiveObjectsManager.Instance.RegisterInteractiveObject(this);
         //   Debug.Log("Interactive Object End");
        }

        public void ObjectNodeReady()
        {
            Debug.Log("ObjectNodeReady");
            object o = GetComponent<AtavismNode>().GetProperty("ioid");
            id = o == null ? -1 : Convert.ToInt32(o);
            Debug.Log("ObjectNodeReady property id "+o);
            object p = GetComponent<AtavismNode>().GetProperty("pid");
            Debug.Log("ObjectNodeReady property pid "+p);
            profileId = p == null ? -1 : Convert.ToInt32(p);

            if(id > 0)
                InteractiveObjectsManager.Instance.RegisterInteractiveObject(this);
            var profile = AtavismPrefabManager.Instance.LoadInteractiveObjectProfilesData(profileId);
            if (profile != null)
            {
                interactionType = profile.interactionType;
                useLimit = profile.useLimit;
                minLevel = profile.minLevel;
                maxLevel = profile.maxLevel;
                questReqID = profile.questRequirement;
                
                itemRequirement = profile.itemRequirement;
                itemCountRequirement = profile.itemCountRequirement;
                itemRequirementGet = profile.itemRequirementGet;
                
                currencyRequirement = profile.currencyRequirement;
                currencyCountRequirement = profile.currencyCountRequirement;
                currencyRequirementGet = profile.currencyRequirementGet;
                
                cursorIcon = AtavismPrefabManager.Instance.GetIcon2d(profile.iconPath);
                
            }

        }
        void OnDestroy()
        {
            if (ClientAPI.ScriptObject != null)
                InteractiveObjectsManager.Instance.RemoveInteractiveObject(id);

            AtavismCursor.Instance.ClearMouseOverObject(GetComponent<AtavismNode>());
        }

        void OnDisable()
        {
            AtavismCursor.Instance.ClearMouseOverObject(GetComponent<AtavismNode>());
        }

        // Update is called once per frame
        void Update()
        {
            if (mouseOver)
            {
                if (AtavismCursor.Instance.IsMouseOverUI())
                {
                    ResetHighlight();
                    AtavismCursor.Instance.ClearMouseOverObject(GetComponent<AtavismNode>());
                }
                else
                {
                    Highlight();
                    AtavismCursor.Instance.SetMouseOverObject(GetComponent<AtavismNode>(), cursorIcon, 4);
                }
                if (Input.GetMouseButtonDown(1) && !AtavismCursor.Instance.IsMouseOverUI())
                {
                    timeClick = Time.time + 0.5f;
                }
                if (/*Input.GetMouseButtonDown(1)*/Input.GetMouseButtonUp(1) && !AtavismCursor.Instance.IsMouseOverUI() && timeClick > Time.time)
                {
                    StartInteraction();
                }
            }
        }

        void OnMouseDown()
        {
            if (!AtavismSettings.Instance.isWindowOpened() && !AtavismSettings.Instance.isMenuBarOpened)
            {
                Transform cam = Camera.main.transform;
                SDETargeting sde = cam.transform.GetComponent<SDETargeting>();

                if (sde != null && sde.softTargetMode)
                {
                    return;
                }
            }
            if (!AtavismCursor.Instance.IsMouseOverUI())
                StartInteraction();
        }

        void OnMouseOver()
        {
            if (active)
            {
                if(!mouseOver)
                    AtavismCursor.Instance.SetMouseOverObject(GetComponent<AtavismNode>(), cursorIcon, 4);
                Highlight();
            }
            mouseOver = true;
        }

        void OnMouseExit()
        {
            
            AtavismCursor.Instance.ClearMouseOverObject(GetComponent<AtavismNode>());
            if (!selected)
                ResetHighlight();
            mouseOver = false;
        }

        public void StartInteraction()
        {
            Debug.Log($"[InteractiveObject] Player is trying to interact with object ID: {id}, type: {interactionType}");

            int level = 1;
            if (ClientAPI.GetPlayerObject().PropertyExists("level"))
                level = (int)ClientAPI.GetPlayerObject().GetProperty("level");

            Debug.Log($"[InteractiveObject] Player level: {level}, Min required: {minLevel}, Max allowed: {maxLevel}");

            if (interactionType.Equals("InstancePortal") && level > maxLevel)
            {
                Debug.LogWarning("[InteractiveObject] Player level too high for this portal.");
                AtavismEventSystem.DispatchEvent("ERROR_MESSAGE", new string[] { "You cannot enter this instance because your level is too high." });
            }
            else if (interactionType.Equals("InstancePortal") && level < minLevel)
            {
                Debug.LogWarning("[InteractiveObject] Player level too low for this portal.");
                AtavismEventSystem.DispatchEvent("ERROR_MESSAGE", new string[] { "You cannot enter this instance because your level is too low." });
            }
            else if (Time.time < cooldownEnds)
            {
                Debug.LogWarning($"[InteractiveObject] Interaction is on cooldown. Time left: {cooldownEnds - Time.time:F2}s");
                AtavismEventSystem.DispatchEvent("ERROR_MESSAGE", new string[] { "You cannot perform that action yet." });
            }
            else
            {
                Debug.Log($"[InteractiveObject] Sending ao.INTERACT_WITH_OBJECT for ID: {id}");
                Dictionary<string, object> props = new Dictionary<string, object>();
                props.Add("objectID", id);
                props.Add("state", MoveToNextState());
                NetworkAPI.SendExtensionMessage(ClientAPI.GetPlayerOid(), false, "ao.INTERACT_WITH_OBJECT", props);
                cooldownEnds = Time.time + cooldown;
            }
        }

        string MoveToNextState()
        {
            int nextPos = 0;
            foreach (GameObject coordEffect in activateCoordEffects)
            {
                nextPos++;
                if (coordEffect != null)
                    if (coordEffect.name == currentState || currentState == "")
                    {
                        if (nextPos == activateCoordEffects.Count)
                        {
                            nextPos = 0;
                        }
                        return activateCoordEffects[nextPos].name;
                    }
            }
            return "";
        }

        public void StateUpdated(string state)
        {
            if (state == null || state == "" || state == "null" || state == currentState)
                return;
            currentState = state;
            Dictionary<string, object> props = new Dictionary<string, object>();
            props["gameObject"] = gameObject;
            props.Add("ceId",-1L);
            CoordinatedEffectSystem.ExecuteCoordinatedEffect(currentState, props);
        }

        public void Highlight()
        {
            if (!highlight)
                return;
            if (GetComponent<Renderer>() != null)
            {
                GetComponent<Renderer>().material.color = highlightColour;
            }
            else
            {
                for (int i = 0; i < renderers.Length; i++)
                {
                    renderers[i].material.color = highlightColour;
                }
            }
        }

        public void ResetHighlight()
        {
            if (!highlight)
                return;
            if (GetComponent<Renderer>() != null)
            {
                GetComponent<Renderer>().material.color = initialColor;
            }
            else
            {
                for (int i = 0; i < renderers.Length; i++)
                {
                    renderers[i].material.color = initialColors[i];
                }
            }
        }

        public int ID
        {
            set
            {
                id = value;
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether this <see cref="ResourceNode"/> is active.
        /// </summary>
        /// <value><c>true</c> if active; otherwise, <c>false</c>.</value>
        public bool Active
        {
            get
            {
                return active;
            }
            set
            {
                if (active == value)
                    return;
                active = value;
                if (!value)
                    OnMouseExit();

                GetComponent<AtavismNode>().AddLocalProperty("active", active);
                if (GetComponent<MeshRenderer>() != null)
                {
                    GetComponent<MeshRenderer>().enabled = active;
                }
                if (GetComponent<Collider>() != null)
                    GetComponent<Collider>().enabled = active;
                foreach (Transform child in GetComponent<Transform>())
                {
                    if (child.GetComponent<MeshRenderer>() != null)
                    {
                        child.GetComponent<MeshRenderer>().enabled = active;
                    }

                    if (child.GetComponent<Collider>() != null)
                    {
                        child.GetComponent<Collider>().enabled = active;
                    }
                    child.gameObject.SetActive(active);
                }

            }
        }

    }
}
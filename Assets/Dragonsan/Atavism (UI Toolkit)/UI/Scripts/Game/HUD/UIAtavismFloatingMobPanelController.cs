﻿using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Atavism.UI;
using UnityEngine.UIElements;

namespace Atavism
{
    [RequireComponent(typeof(UIDocument))]
    public class UIAtavismFloatingMobPanelController : MonoBehaviour
    {

        
        static UIAtavismFloatingMobPanelController instance;

        public UIDocument uiDocument;
        public VisualTreeAsset panelPrefab;
        public bool showCombatText = true;
        public bool showFloatingChatBubbles = true;
        public bool showPlayerName = false;
        Dictionary<AtavismObjectNode, UIAtavismFloatingMobPanel> activePanels = new Dictionary<AtavismObjectNode, UIAtavismFloatingMobPanel>();
        Camera cam;
        private VisualElement uiScreen;
        public float combatTextSpeed = 60f;
        public bool UseNewCombatTexts = true;
        public string[] dmgType = new string[] { "crush", "magical", "pirce", "slash" };
        public string[] eventTypes = new string[] { "CombatHealthTransfer","CombatRevived","CombatDodged","CombatBlocked","CombatParried","CombatEvaded","CombatImmune","CombatResisted","CombatBuffLost","CombatDebuffLost" };

        [System.Serializable]
        public class CombatTextData
        {

            public UIAtavismFloatingMobPanel FloatingPanel;
            public VisualElement FloatingPanelGO;
            public Renderer RendererReference;
            public float LastTimeUsed;
            public AtavismObjectNode CurrentNode;
            public ClaimObject CurrentCliamObject;
        }
        public List<CombatTextData> ALLcombatTextData;

        public int CombatTextPoolAmount = 50;

        private void Reset()
        {
            uiDocument = GetComponent<UIDocument>();
        }

        private void OnEnable()
        {
            RegisterUI();
        }

        void RegisterUI()
        {
            if(uiDocument == null)
                uiDocument = GetComponent<UIDocument>();
            uiDocument.enabled = true;
            
            uiScreen = uiDocument.rootVisualElement.Q<VisualElement>("Screen");

            
            if (UseNewCombatTexts)
            {
                for (int i = 0; i < CombatTextPoolAmount; i++)
                {
                    VisualElement v = panelPrefab.CloneTree();
                    UIAtavismFloatingMobPanel mobPanel = new UIAtavismFloatingMobPanel();
                    mobPanel.Setup(v);
                       
                    mobPanel.m_root.transform.scale = Vector3.one;
                    mobPanel.SetMobDetails(ClientAPI.GetPlayerObject(), showPlayerName);

                    CombatTextData newCombatText = new CombatTextData();
                    newCombatText.FloatingPanel = mobPanel;
                    newCombatText.FloatingPanelGO = mobPanel.m_root;
                    uiScreen.Add(mobPanel.m_root);
                    ALLcombatTextData.Add(newCombatText);
                    ALLcombatTextData[i].FloatingPanelGO.HideVisualElement();
                }
            }
            else
            {

                // Create panel for player
                VisualElement v = panelPrefab.CloneTree().contentContainer;
                UIAtavismFloatingMobPanel mobPanel = new UIAtavismFloatingMobPanel();
                mobPanel.Setup(v);
                
                mobPanel.m_root.transform.scale = Vector3.one;
                mobPanel.SetMobDetails(ClientAPI.GetPlayerObject(), showPlayerName);
                activePanels.Add(ClientAPI.GetPlayerObject(), mobPanel);
                uiScreen.Add(mobPanel.m_root);
            }
            
         //   Debug.LogError("RegisterUI ALLcombatTextData="+ALLcombatTextData.Count+" activePanels="+activePanels.Count);
            
            
        }
        
        
        
        // Use this for initialization
        void Start()
        {
            if (instance != null)
            {
                GameObject.DestroyImmediate(gameObject);
                return;
            }
            instance = this;

            if (!UseNewCombatTexts)
            {

                ClientAPI.WorldManager.ObjectAdded += HandleObjectAdded;
                ClientAPI.WorldManager.ObjectRemoved += HandleObjectRemoved;
            }

            if (showCombatText)
                AtavismEventSystem.RegisterEvent("COMBAT_EVENT", this);
            if (showFloatingChatBubbles)
                AtavismEventSystem.RegisterEvent("CHAT_MSG_SAY", this);
           
            cam = Camera.main;
        }

        void Update()
        {
            if (cam == null)
                cam = Camera.main;
            if (UseNewCombatTexts)
            {

                for (int i = 0; i < ALLcombatTextData.Count; i++)
                {

                    if (ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                    {
                        if ((ALLcombatTextData[i].CurrentNode == null && ALLcombatTextData[i].CurrentCliamObject==null)|| (ALLcombatTextData[i].CurrentNode!=null && ALLcombatTextData[i].CurrentNode.GameObject == null))
                        {
                           // Debug.LogError("Update stop",gameObject);
                        //   Debug.LogError("Update stop || OBJ IS NULL");
                            ALLcombatTextData[i].CurrentNode = null;
                            ALLcombatTextData[i].CurrentCliamObject=null;
                            ALLcombatTextData[i].RendererReference = null;
                            ALLcombatTextData[i].LastTimeUsed = 0;
                            ALLcombatTextData[i].FloatingPanelGO.HideVisualElement();
                            ALLcombatTextData[i].LastTimeUsed = Time.time;
                            ALLcombatTextData[i].RendererReference = null;
                            ALLcombatTextData[i].FloatingPanel.FloatingPanelController = null;
                            break;
                        }

                        float distance = Vector3.Distance((ALLcombatTextData[i].CurrentNode != null?ALLcombatTextData[i].CurrentNode.Position:ALLcombatTextData[i].CurrentCliamObject.transform.position), cam.transform.position);
                        if (distance > ALLcombatTextData[i].FloatingPanel.renderDistance)
                        {
                            if (ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                            {
                               // Debug.LogError("Update stop |",gameObject);
                              // Debug.LogError("Update stop || RENDER DISTANCE");
                                 ALLcombatTextData[i].FloatingPanelGO.HideVisualElement();

                                // TODO RESET COMBAT TEXT
                            }
                        }
                        else
                        {
                            if (ALLcombatTextData[i].RendererReference != null)
                            {
                                if (ALLcombatTextData[i].RendererReference.isVisible || !ALLcombatTextData[i].RendererReference.IsVisibleFrom(cam))
                                {
                                    bool rendererVisible = false;

                                    if (ALLcombatTextData[i].RendererReference.isVisible && ALLcombatTextData[i].RendererReference.IsVisibleFrom(cam))
                                    {
                                        rendererVisible = true;
                                    }


                                    if (rendererVisible)
                                    {
                                        Vector3 screenPoint = cam.WorldToViewportPoint((ALLcombatTextData[i].CurrentNode!=null?ALLcombatTextData[i].CurrentNode.GameObject.transform.position:ALLcombatTextData[i].CurrentCliamObject.transform.position));
                                        rendererVisible = screenPoint.z > 0 && screenPoint.x > 0 && screenPoint.x < 1 && screenPoint.y > 0 && screenPoint.y < 1;
                                    }
                                    if (!rendererVisible)
                                    {
                                        if (ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                                        {
                                           // Debug.LogError("Update stop || NO RENDER");

                                            ALLcombatTextData[i].FloatingPanelGO.HideVisualElement();

                                            // TODO RESET COMBAT TEXT
                                        }
                                        continue;
                                    }
                                }
                            }
                            if (!ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                            {
                                ALLcombatTextData[i].FloatingPanelGO.ShowVisualElement();
                            }
                            ALLcombatTextData[i].FloatingPanel.RunUpdate(cam);

                        }
                    }

                }
            }
            else
            {
                // Run through all panels
                foreach (AtavismObjectNode mobNode in activePanels.Keys)
                {
                    UIAtavismFloatingMobPanel floatingMobPanel = activePanels[mobNode];
                    float distance = Vector3.Distance(mobNode.Position, cam.transform.position);
                    if (distance > floatingMobPanel.renderDistance)
                    {
                        if (floatingMobPanel.m_root.IsVisibleElement())
                        {
                            floatingMobPanel.m_root.HideVisualElement();
                        }
                    }
                    else
                    {
                        if (mobNode.GameObject.GetComponentInChildren<Renderer>() != null)
                            if (mobNode.GameObject.GetComponentInChildren<Renderer>().isVisible || !mobNode.GameObject.GetComponentInChildren<Renderer>().IsVisibleFrom(cam))
                            {
                                bool rendererVisible = false;
                                foreach (Renderer renderer in mobNode.GameObject.GetComponentsInChildren<Renderer>())
                                {
                                    if (renderer.isVisible && renderer.IsVisibleFrom(cam))
                                    {
                                        rendererVisible = true;
                                        break;
                                    }
                                }
                                if (!rendererVisible)
                                {
                                    foreach (Renderer renderer in mobNode.GameObject.GetComponentsInChildren<Renderer>())
                                    {
                                        if (renderer.isVisible)
                                        {
                                            rendererVisible = true;
                                            break;
                                        }
                                    }
                                }
                                if (rendererVisible)
                                {
                                    Vector3 screenPoint = cam.WorldToViewportPoint(mobNode.GameObject.transform.position);
                                    rendererVisible = screenPoint.z > 0 && screenPoint.x > 0 && screenPoint.x < 1 && screenPoint.y > 0 && screenPoint.y < 1;
                                }
                                if (!rendererVisible)
                                {
                                    if (floatingMobPanel.m_root.IsVisibleElement())
                                    {
                                        floatingMobPanel.m_root.HideVisualElement();
                                    }
                                    continue;
                                }
                            }
                        if (!floatingMobPanel.m_root.IsVisibleElement())
                        {
                            floatingMobPanel.m_root.ShowVisualElement();
                        }
                        floatingMobPanel.RunUpdate(cam);
                    }
                }
            }
        }

        void OnDestroy()
        {
            if (!UseNewCombatTexts)
            {
                ClientAPI.WorldManager.ObjectAdded -= HandleObjectAdded;
                ClientAPI.WorldManager.ObjectRemoved -= HandleObjectRemoved;
            }

            if (showCombatText)
                AtavismEventSystem.UnregisterEvent("COMBAT_EVENT", this);
            if (showFloatingChatBubbles)
                AtavismEventSystem.UnregisterEvent("CHAT_MSG_SAY", this);
        }

        void HandleObjectAdded(object sender, AtavismObjectNode objNode)
        {
            if (UseNewCombatTexts)
            {
                return;
            }
            //if (objNode.GameObject.GetComponentInChildren<Renderer>() == null)
            //	return;

            // Check if the object has a mobcontroller - if not, don't display a name
            if (objNode.MobController == null || activePanels.ContainsKey(objNode))
                return;

            // Check if the object has nameDisplay set to false
            if (objNode.PropertyExists("nameDisplay") && !objNode.CheckBooleanProperty("nameDisplay"))
            {
                return;
            }
            VisualElement v = panelPrefab.CloneTree().contentContainer;
            UIAtavismFloatingMobPanel mobPanel = new UIAtavismFloatingMobPanel();
            mobPanel.Setup(v);
            //
            // UIAtavismFloatingMobPanel mobPanel = (UIAtavismFloatingMobPanel)Instantiate(panelPrefab, transform, false);
            //

            uiScreen.Add(mobPanel.m_root);
            //mobPanel.GetComponent<CanvasGroup>().alpha = 0f;

            mobPanel.SetMobDetails(objNode, true);
            activePanels.Add(objNode, mobPanel);
        }

        public void AddObject(AtavismObjectNode objNode)
        {
            if (UseNewCombatTexts)
            {
                return;
            }
            HandleObjectAdded(null, objNode);

        }

        void HandleObjectRemoved(object sender, AtavismObjectNode objNode)
        {
            if (UseNewCombatTexts)
            {
                return;
            }

            if (activePanels.ContainsKey(objNode))
            {
                // Destroy(activePanels[objNode].gameObject);
                activePanels[objNode].m_root.RemoveFromHierarchy();
                activePanels.Remove(objNode);
            }
        }

        public int GetCombatTextToReset()
        {
            float[] allTimes = new float[ALLcombatTextData.Count];

            for (int i = 0; i < allTimes.Length; i++)
            {
                allTimes[i] = ALLcombatTextData[i].LastTimeUsed;
            }

            float LongestTime = Mathf.Min(allTimes);
            int PanelID = System.Array.IndexOf(allTimes, LongestTime);

            return PanelID;
        }

        public void OnEvent(AtavismEventData eData)
        {
        /*    Debug.LogError("Got event "+ eData.eventType+" with numargs: " + eData.eventArgs.Length+" p0="+(eData.eventArgs.Length>0? eData.eventArgs[0]:"---") 
                + " p1=" + (eData.eventArgs.Length > 1 ? eData.eventArgs[1] : "---") + " p2=" + (eData.eventArgs.Length > 2 ? eData.eventArgs[2] : "---")
                + " p3=" + (eData.eventArgs.Length > 3 ? eData.eventArgs[3] : "---")
                + " p4=" + (eData.eventArgs.Length > 4 ? eData.eventArgs[4] : "---")
                + " p5=" + (eData.eventArgs.Length > 5 ? eData.eventArgs[5] : "---")
                + " p6=" + (eData.eventArgs.Length > 6 ? eData.eventArgs[6] : "---")
                + " p7=" + (eData.eventArgs.Length > 7 ? eData.eventArgs[7] : "---")
                + " p8=" + (eData.eventArgs.Length > 8 ? eData.eventArgs[8] : "---")
                + " p9=" + (eData.eventArgs.Length > 9 ? eData.eventArgs[9] : "---")
                );*/

            if (eData.eventType == "COMBAT_EVENT")
            {

                OID target = null;
                AtavismObjectNode targetNode = null;
                if (eData.eventArgs[2].Length > 0)
                {
                    target = OID.fromString(eData.eventArgs[2]);
                    targetNode = ClientAPI.GetObjectNode(target.ToLong());
                }

                if (targetNode != null)
                {
                    if (UseNewCombatTexts)
                    {
                        bool WeFoundOne = false;
                        for (int i = 0; i < ALLcombatTextData.Count; i++)
                        {
                            if (!ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                            {
                                ALLcombatTextData[i].FloatingPanelGO.ShowVisualElement();
                                ALLcombatTextData[i].LastTimeUsed = Time.time;
                                ALLcombatTextData[i].RendererReference = targetNode.GameObject.GetComponentInChildren<Renderer>();
                                ALLcombatTextData[i].CurrentNode = targetNode;
                                ALLcombatTextData[i].FloatingPanel.FloatingPanelController = this;
                                ALLcombatTextData[i].FloatingPanel.ThisPanelID = i;
                                ALLcombatTextData[i].FloatingPanel.SetMobDetails(targetNode, true);
                                ALLcombatTextData[i].FloatingPanel.ShowCombatText(eData.eventArgs[3], eData.eventArgs[0],eData.eventArgs[8]);
                                WeFoundOne = true;
                                break;
                            }
                            else
                            {
                                WeFoundOne = false;
                            }
                        }


                        if (!WeFoundOne)
                        {
                           // Debug.LogError("One text have been reset");

                            int TextToResetID = GetCombatTextToReset();


                            ALLcombatTextData[TextToResetID].CurrentNode = null;
                            ALLcombatTextData[TextToResetID].RendererReference = null;
                            ALLcombatTextData[TextToResetID].LastTimeUsed = 0;
                            ALLcombatTextData[TextToResetID].FloatingPanelGO.ShowVisualElement();
                            ALLcombatTextData[TextToResetID].LastTimeUsed = Time.time;
                            ALLcombatTextData[TextToResetID].RendererReference = targetNode.GameObject.GetComponentInChildren<Renderer>();
                            ALLcombatTextData[TextToResetID].CurrentNode = targetNode;
                            ALLcombatTextData[TextToResetID].FloatingPanel.FloatingPanelController = this;
                            ALLcombatTextData[TextToResetID].FloatingPanel.ThisPanelID = TextToResetID;
                            ALLcombatTextData[TextToResetID].FloatingPanel.SetMobDetails(targetNode, true);
                            ALLcombatTextData[TextToResetID].FloatingPanel.ShowCombatText(eData.eventArgs[3], eData.eventArgs[0],eData.eventArgs[8]);
                        }

                    }
                    else
                    {
                        if (activePanels.ContainsKey(targetNode))
                        {
                            activePanels[targetNode].ShowCombatText(eData.eventArgs[3], eData.eventArgs[0], eData.eventArgs[8]);
                        }
                    }
                }
                else
                {
                    int claimId = -1;
                    int claimObjectId = -1;
                    if (eData.eventArgs[4].Length > 0)
                    {
                        claimId = int.Parse(eData.eventArgs[4]);
                    }
                    if (eData.eventArgs[7].Length > 0)
                    {
                        claimObjectId = int.Parse(eData.eventArgs[7]);
                    }
                   
                    AtavismLogger.LogDebugMessage("OnEvent claimId=" + claimId + " claimObjectId=" + claimObjectId);
                    if(claimId>0 && claimObjectId>0)
                    {
                      //  GameObject go = WorldBuilder.Instance.GetClaim(claimId).claimObjects[claimObjectId].gameObject;
                        if (UseNewCombatTexts)
                        {
                            bool WeFoundOne = false;
                            for (int i = 0; i < ALLcombatTextData.Count; i++)
                            {
                                if (!ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                                {
                                    ALLcombatTextData[i].FloatingPanelGO.ShowVisualElement();
                                    ALLcombatTextData[i].LastTimeUsed = Time.time;
                                    ALLcombatTextData[i].RendererReference = WorldBuilder.Instance.GetClaim(claimId).claimObjects[claimObjectId].gameObject.GetComponentInChildren<Renderer>();
                                        //targetNode.GameObject.GetComponentInChildren<Renderer>();
                                   // ALLcombatTextData[i].CurrentNode = targetNode;
                                   ALLcombatTextData[i].CurrentCliamObject=WorldBuilder.Instance.GetClaim(claimId).claimObjects[claimObjectId];

                                    ALLcombatTextData[i].FloatingPanel.FloatingPanelController = this;
                                    ALLcombatTextData[i].FloatingPanel.ThisPanelID = i;
                                    //ALLcombatTextData[i].FloatingPanel.SetMobDetails(targetNode, true);
                                    ALLcombatTextData[i].FloatingPanel.ShowCombatText(eData.eventArgs[3], eData.eventArgs[0], eData.eventArgs[8]);
                                    WeFoundOne = true;
                                    break;
                                }
                                else
                                {
                                    WeFoundOne = false;
                                }
                            }


                            if (!WeFoundOne)
                            {
                                // Debug.LogError("One text have been reset");

                                int TextToResetID = GetCombatTextToReset();


                                ALLcombatTextData[TextToResetID].CurrentNode = null;
                                ALLcombatTextData[TextToResetID].RendererReference = null;
                                ALLcombatTextData[TextToResetID].LastTimeUsed = 0;
                                ALLcombatTextData[TextToResetID].FloatingPanelGO.ShowVisualElement();
                                ALLcombatTextData[TextToResetID].LastTimeUsed = Time.time;
                                ALLcombatTextData[TextToResetID].RendererReference =WorldBuilder.Instance.GetClaim(claimId).claimObjects[claimObjectId].gameObject.GetComponentInChildren<Renderer>(); 
                                    //targetNode.GameObject.GetComponentInChildren<Renderer>();
                               // ALLcombatTextData[TextToResetID].CurrentNode = targetNode;
                                ALLcombatTextData[TextToResetID].CurrentCliamObject=WorldBuilder.Instance.GetClaim(claimId).claimObjects[claimObjectId];
                                ALLcombatTextData[TextToResetID].FloatingPanel.FloatingPanelController = this;
                                ALLcombatTextData[TextToResetID].FloatingPanel.ThisPanelID = TextToResetID;
                                // ALLcombatTextData[TextToResetID].FloatingPanel.SetMobDetails(targetNode, true);
                                ALLcombatTextData[TextToResetID].FloatingPanel.ShowCombatText(eData.eventArgs[3], eData.eventArgs[0],eData.eventArgs[8]);
                            }
                        }
                    }
                }
            }
            else if (eData.eventType == "CHAT_MSG_SAY")
            {
                AtavismLogger.LogDebugMessage("Got chat say event with numargs: " + eData.eventArgs.Length);
                string senderOid = eData.eventArgs[3];
                if (!string.IsNullOrEmpty(senderOid))
                    if (OID.fromString(senderOid) != null)
                    {
                        AtavismObjectNode node = ClientAPI.GetObjectNode(OID.fromString(senderOid).ToLong());
                        if (node != null)
                        {
                            if (UseNewCombatTexts)
                            {

                                bool WeFoundOne = false;

                                for (int i = 0; i < ALLcombatTextData.Count; i++)
                                {
                                    if (ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                                    {
                                        if (ALLcombatTextData[i].CurrentNode == node)
                                        {
                                            ALLcombatTextData[i].FloatingPanelGO.ShowVisualElement();
                                            ALLcombatTextData[i].LastTimeUsed = Time.time;
                                            ALLcombatTextData[i].RendererReference = node.GameObject.GetComponentInChildren<Renderer>();
                                            ALLcombatTextData[i].CurrentNode = node;
                                            ALLcombatTextData[i].FloatingPanel.FloatingPanelController = this;
                                            ALLcombatTextData[i].FloatingPanel.ThisPanelID = i;
                                            ALLcombatTextData[i].FloatingPanel.SetMobDetails(node, true);
                                            ALLcombatTextData[i].FloatingPanel.ShowChatBubble(eData.eventArgs[0]);


                                            WeFoundOne = true;
                                            return;
                                        }
                                        else
                                        {
                                            WeFoundOne = false;
                                        }
                                    }
                                    else
                                    {
                                        WeFoundOne = false;
                                    }
                                }


                                for (int i = 0; i < ALLcombatTextData.Count; i++)
                                {
                                    if (!ALLcombatTextData[i].FloatingPanelGO.IsVisibleElement())
                                    {
                                        ALLcombatTextData[i].FloatingPanelGO.ShowVisualElement();
                                        ALLcombatTextData[i].LastTimeUsed = Time.time;
                                        ALLcombatTextData[i].RendererReference = node.GameObject.GetComponentInChildren<Renderer>();
                                        ALLcombatTextData[i].CurrentNode = node;
                                        ALLcombatTextData[i].FloatingPanel.FloatingPanelController = this;
                                        ALLcombatTextData[i].FloatingPanel.ThisPanelID = i;
                                        ALLcombatTextData[i].FloatingPanel.SetMobDetails(node, true);
                                        ALLcombatTextData[i].FloatingPanel.ShowChatBubble(eData.eventArgs[0]);


                                        WeFoundOne = true;
                                        break;
                                    }
                                    else
                                    {
                                        WeFoundOne = false;
                                    }
                                }


                                if (!WeFoundOne)
                                {

                                    int TextToResetID = GetCombatTextToReset();


                                    ALLcombatTextData[TextToResetID].CurrentNode = null;
                                    ALLcombatTextData[TextToResetID].RendererReference = null;
                                    ALLcombatTextData[TextToResetID].LastTimeUsed = 0;
                                    ALLcombatTextData[TextToResetID].FloatingPanelGO.ShowVisualElement();
                                    ALLcombatTextData[TextToResetID].LastTimeUsed = Time.time;
                                    ALLcombatTextData[TextToResetID].RendererReference = node.GameObject.GetComponentInChildren<Renderer>();
                                    ALLcombatTextData[TextToResetID].CurrentNode = node;
                                    ALLcombatTextData[TextToResetID].FloatingPanel.FloatingPanelController = this;
                                    ALLcombatTextData[TextToResetID].FloatingPanel.ThisPanelID = TextToResetID;
                                    ALLcombatTextData[TextToResetID].FloatingPanel.SetMobDetails(node, true);
                                    ALLcombatTextData[TextToResetID].FloatingPanel.ShowChatBubble(eData.eventArgs[0]);
                                }

                            }
                            else
                            {
                                if (activePanels.ContainsKey(node))
                                {
                                    activePanels[node].ShowChatBubble(eData.eventArgs[0]);
                                }
                            }
                        }
                    }

            }
        }

        public static UIAtavismFloatingMobPanelController Instance
        {
            get
            {
                return instance;
            }
        }
    }
}
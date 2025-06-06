﻿using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UIElements;
using Atavism.UI;

namespace Atavism
{

    public class  AtavismInventoryItem : Activatable
    {

        string baseName = "";
        OID itemId = null;//
        public int templateId = -1;
        string category = "";
        string subcategory = "";
        int count = 1;//
        public string itemType = "";
        public string subType = "";
        public string slot = "";
        public int quality = 0;
        public int binding = 0;
        public bool isBound = false;//
        bool unique = false;
        [SerializeField] int stackLimit = 1;
        public int currencyType = 0;
        public long cost = 0;
        public bool sellable = true;
        int displayID = 0;
        int energyCost = 0;//
        int encumberance = 0;
        Dictionary<string, int> resistances = new Dictionary<string, int>();//
        Dictionary<string, int> stats = new Dictionary<string, int>();//
        Dictionary<string, int> enchantStats = new Dictionary<string, int>();//
        public Dictionary<int,int> enchantAbilities = new Dictionary<int,int>();//
        public Dictionary<int, int> enchantEffects = new Dictionary<int, int>();//
        Dictionary<string, Dictionary<int, int>> socketSlots = new Dictionary<string, Dictionary<int, int>>();//
        Dictionary<string, Dictionary<int, long>> socketSlotsOid = new Dictionary<string, Dictionary<int, long>>();//
        public int setCount = 0;//
        public int enchantLeval = 0;
        [SerializeField] int damageValue = 0;
        [SerializeField] int damageMaxValue = 0;
        [SerializeField] string damageType = "";
        [SerializeField] int weaponSpeed = 2000;
        bool randomisedStats = false;
        int globalcd = 0;
        int weaponcd = 0;
        string cdtype2 = "";
        int durability = 0;//
        int maxDurability = 0;//
        public bool repairable = true;
        public List<string> itemEffectTypes = new List<string>();
        public List<string> itemEffectNames = new List<string>();
        public List<string> itemEffectValues = new List<string>();
        public List<string> itemReqTypes = new List<string>();
        public List<string> itemReqNames = new List<string>();
        public List<string> itemReqValues = new List<string>();
        [SerializeField]
        int reqLevel = -1;
        public int setId = 0;
        [SerializeField] int enchantId = 0;
        // Dynamic settings for crafting and other systems that allow temporary placement of items
        int usedCount = 0;
        public bool auctionHouse = false;
        public int gear_score = 0;
        public int weaponProfile = -1;
        public string sockettype = "";
        public int weight = 0;
        public int autoattack = -1;
        public int ammoType = -1;
        public int deathLoss = 0;
        public bool parry = false;
        // public AtavismInventoryItem Clone(GameObject go)
        // {
        //     AtavismInventoryItem clone = new AtavismInventoryItem();
        //         //go.AddComponent<AtavismInventoryItem>();
        //     clone.templateId = templateId;
        //     clone.name = name;
        //   //  clone.icon = icon;
        //     clone.baseName = baseName;
        //     clone.category = category;
        //     clone.subcategory = subcategory;
        //     clone.count = count;
        //     clone.itemType = itemType;
        //     clone.subType = subType;
        //     clone.slot = slot;
        //     clone.quality = quality;
        //     clone.binding = binding;
        //     clone.unique = unique;
        //     clone.stackLimit = stackLimit;
        //     clone.currencyType = currencyType;
        //     clone.cost = cost;
        //     clone.sellable = sellable;
        //     clone.displayID = displayID;
        //     clone.energyCost = energyCost;
        //     clone.encumberance = encumberance;
        //     clone.resistances = resistances;
        //     clone.stats = stats;
        //     clone.damageValue = damageValue;
        //     clone.damageMaxValue = damageMaxValue;
        //     clone.weaponSpeed = weaponSpeed;
        //     clone.randomisedStats = randomisedStats;
        //     clone.globalcd = globalcd;
        //     clone.weaponcd = weaponcd;
        //     clone.cdtype2 = cdtype2;
        //     clone.durability = durability;
        //     clone.maxDurability = maxDurability;
        //     clone.repairable = repairable;
        //     clone.tooltip = tooltip;
        //     clone.itemEffectTypes = itemEffectTypes;
        //     clone.itemEffectNames = itemEffectNames;
        //     clone.itemEffectValues = itemEffectValues;
        //     clone.itemReqTypes = itemReqTypes;
        //     clone.itemReqNames = itemReqNames;
        //     clone.itemReqValues = itemReqValues;
        //     clone.ReqLeval = reqLevel;
        //     clone.SetId = setId;
        //     clone.enchantId = enchantId;
        //     clone.auctionHouse = auctionHouse;
        //     clone.gear_score = gear_score;
        //
        //     clone.Durability = durability;
        //     clone.MaxDurability = maxDurability;
        //     clone.sockettype = sockettype;
        //     clone.weight = weight;
        //     clone.autoattack = autoattack;
        //     clone.ammoType = ammoType;
        //     clone.deathLoss = deathLoss;
        //     clone.parry = parry;
        //
        //
        //
        //     return clone;
        // }

        // public AtavismInventoryItem Clone(AtavismInventoryItem clone)
        // {
        //     clone.templateId = templateId;
        //     clone.name = name;
        //     clone.icon = icon;
        //     clone.baseName = baseName;
        //     clone.category = category;
        //     clone.subcategory = subcategory;
        //     clone.count = count;
        //     clone.itemType = itemType;
        //     clone.subType = subType;
        //     clone.slot = slot;
        //     clone.quality = quality;
        //     clone.binding = binding;
        //     clone.unique = unique;
        //     clone.stackLimit = stackLimit;
        //     clone.currencyType = currencyType;
        //     clone.cost = cost;
        //     clone.sellable = sellable;
        //     clone.displayID = displayID;
        //     clone.energyCost = energyCost;
        //     clone.encumberance = encumberance;
        //     clone.resistances = resistances;
        //     clone.stats = stats;
        //     clone.damageValue = damageValue;
        //     clone.damageMaxValue = damageMaxValue;
        //     clone.weaponSpeed = weaponSpeed;
        //     clone.randomisedStats = randomisedStats;
        //     clone.globalcd = globalcd;
        //     clone.weaponcd = weaponcd;
        //     clone.cdtype2 = cdtype2;
        //     clone.durability = durability;
        //     clone.maxDurability = maxDurability;
        //     clone.tooltip = tooltip;
        //     clone.itemEffectTypes = itemEffectTypes;
        //     clone.itemEffectNames = itemEffectNames;
        //     clone.itemEffectValues = itemEffectValues;
        //     clone.itemReqTypes = itemReqTypes;
        //     clone.itemReqNames = itemReqNames;
        //     clone.itemReqValues = itemReqValues;
        //     clone.ReqLeval = reqLevel;
        //     clone.SetId = setId;
        //     clone.enchantId = enchantId;
        //     clone.auctionHouse = auctionHouse;
        //     clone.gear_score = gear_score;
        //
        //     clone.Durability = durability;
        //     clone.MaxDurability = durability;
        //     clone.sockettype = sockettype;
        //     clone.weight = weight;
        //     clone.autoattack = autoattack;
        //     clone.ammoType = ammoType;
        //     clone.deathLoss = deathLoss;
        //     clone.parry = parry;
        //
        //     return clone;
        // }
        public string tostring()
        {
            return "[AtavismInventoryItem " + baseName + ":"+templateId+":" + itemId + " (" + count + ")]";
        }
        
        public override bool Activate()
        {
            ItemPrefabData ipd = AtavismPrefabManager.Instance.GetItemTemplateByID(TemplateId);
            if (ipd != null)
            {
                if (ipd.audioProfile > 0)
                {
                    ItemAudioProfileData iapd =  AtavismPrefabManager.Instance.GetItemAudioProfileByID(ipd.audioProfile);
                    if (iapd != null && AtavismInventoryAudioManager.Instance != null)
                    {
                        AtavismInventoryAudioManager.Instance.PlayAudio(iapd.use, ClientAPI.GetPlayerObject().GameObject);
                    }
                }
            }
            // Not really the best way to do this, but it works - check if the item is a Claim Object
            if (GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                if (WorldBuilder.Instance.ActiveClaim != null)
                {
                    WorldBuilder.Instance.StartPlaceClaimObject(this);
                }
                return true;
            }
            //TODO: provide proper target setup
            if (ClientAPI.GetTargetOid() > 0)
            {
                NetworkAPI.SendActivateItemMessage(itemId, ClientAPI.GetTargetOid());
            }
            else
            {
                if (itemId != null)
                {
                    NetworkAPI.SendActivateItemMessage(itemId, ClientAPI.GetPlayerOid());
                }
                else
                {
                  AtavismInventoryItem aii =  Inventory.Instance.GetInventoryItem(templateId);
                  if (aii != null)
                  {
                      NetworkAPI.SendActivateItemMessage(aii.itemId, ClientAPI.GetPlayerOid());
                  }
                }
            }

            return true;
        }

        /// <summary>
        /// Old Unity GUI Tooltip code. Not used by UGUI
        /// </summary>
        /// <param name="x">The x coordinate.</param>
        /// <param name="y">The y coordinate.</param>
        public override void DrawTooltip(float x, float y)
        {
            List<int> statPositions = GetEffectPositionsOfTypes("Stat");
            int width = 150;
            int height = 50 + statPositions.Count * 20;
            Rect tooltipRect = new Rect(x, y - height, width, height);
            GUI.Box(tooltipRect, "");
            GUI.Label(new Rect(tooltipRect.x + 5, tooltipRect.y + 5, 140, 20), name);
            GUI.Label(new Rect(tooltipRect.x + 5, tooltipRect.y + 25, 140, 20), itemType);
            for (int i = 0; i < statPositions.Count; i++)
            {
                string prefix = "";
                if (!itemEffectValues[statPositions[i]].Contains("-"))
                    prefix = "+";
                GUI.Label(new Rect(tooltipRect.x + 5, tooltipRect.y + 25 + ((i + 1) * 20), 140, 20),
                          prefix + itemEffectValues[statPositions[i]] + " " + itemEffectNames[statPositions[i]]);
            }
        }

        public void AlterUseCount(int delta)
        {
            usedCount += delta;
        }

        public void ResetUseCount()
        {
            usedCount = 0;
        }

        public void AddItemEffect(string itemEffectType, string itemEffectName, string itemEffectValue)
        {
            itemEffectTypes.Add(itemEffectType);
            itemEffectNames.Add(itemEffectName);
            itemEffectValues.Add(itemEffectValue);
        }

        public void ClearEffects()
        {
            itemEffectTypes.Clear();
            itemEffectNames.Clear();
            itemEffectValues.Clear();
        }

        public void AddItemRequirement(string itemReqType, string itemReqName, string itemReqValue)
        {
            itemReqTypes.Add(itemReqType);
            itemReqNames.Add(itemReqName);
            itemReqValues.Add(itemReqValue);
        }

        public void ClearRequirements()
        {
            itemReqTypes.Clear();
            itemReqNames.Clear();
            itemReqValues.Clear();
        }

        public List<int> GetEffectPositionsOfTypes(string effectType)
        {
            List<int> effectPositions = new List<int>();
            for (int i = 0; i < itemEffectTypes.Count; i++)
            {
                if (itemEffectTypes[i] == effectType)
                    effectPositions.Add(i);
            }
            return effectPositions;
        }

        //  List<int> equipEffectPositions = new List<int>();
        /// <summary>
        /// Shows the tooltip for UGUI implementation.
        /// </summary>
        /// <param name="target">Target.</param>
        public void ShowTooltip(GameObject target)
        {
            //  string defaultColor = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(UGUITooltip.Instance.defaultTextColour.r), ToByte(UGUITooltip.Instance.defaultTextColour.g), ToByte(UGUITooltip.Instance.defaultTextColour.b));
            List<AtavismInventoryItem> items = new List<AtavismInventoryItem>();
            string slotName = Inventory.Instance.GetItemByTemplateID(TemplateId).slot;
           // Debug.LogError("Tooltip "+slotName);
            foreach (AtavismInventoryItem item in Inventory.Instance.EquippedItems.Values)
            {
                if (item.itemId != itemId)
                {
                    if (Inventory.Instance.itemGroupSlots.ContainsKey(slotName))
                    {
                       // Debug.LogError(" found Group "+slotName+" GS:"+Inventory.Instance.itemGroupSlots[slotName]);
                        foreach (var s in Inventory.Instance.itemGroupSlots[slotName].slots)
                        {
                           // Debug.LogError(" Group Slot "+s.name+" | "+slotName);

                            if (s.name.ToLower() == item.slot.ToLower())
                            {// Debug.LogError(" add items "+item.itemId);
                                items.Add(item);
                            }
                        }

                      /*  if (item.slot.ToLower() == slotName.ToLower())
                        { //Debug.LogError(" add items "+item.itemId);
                            items.Add(item);
                        }*/
                    }
                    else
                    {
                        if (item.slot.ToLower() == slotName.ToLower())
                        {
                            //Debug.LogError(" add items "+item.itemId);
                            items.Add(item);
                        }
                    }
                }

            }

#if AT_I2LOC_PRESET
        UGUITooltip.Instance.SetTitle((enchantLeval > 0?" +"+ enchantLeval : "")+" "+I2.Loc.LocalizationManager.GetTranslation("Items/"+name));
#else
            UGUITooltip.Instance.SetTitle((enchantLeval > 0 ? " +" + enchantLeval : "") + " " + name);
#endif
            if (Icon != null)
            {
                UGUITooltip.Instance.SetIcon(Icon);
            }
            //UGUITooltip.Instance.SetQuality(quality);
            UGUITooltip.Instance.SetQualityColor(AtavismSettings.Instance.ItemQualityColor(quality));
            UGUITooltip.Instance.SetTitleColour(AtavismSettings.Instance.ItemQualityColor(quality));
           
          //  Debug.LogError("Tooltip "+name+" "+slotName+" "+itemType);
            if (itemType == "Tool")
            {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.SetType(I2.Loc.LocalizationManager.GetTranslation(itemType));
      		    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UGUITooltip.Instance.AddAttribute(slotName, "", true);
                UGUITooltip.Instance.SetType(itemType);
              
#endif
            }
            else if (itemType == "Armor")
            {
#if AT_I2LOC_PRESET
      		UGUITooltip.Instance.SetType(I2.Loc.LocalizationManager.GetTranslation("Slot") + ": "+I2.Loc.LocalizationManager.GetTranslation(slotName));
#else
                UGUITooltip.Instance.SetType(slotName);
#endif

                if (gear_score > 0)
                {
                    string textDamage = gear_score.ToString();
                    string mark = "";
                    if (enchantStats.ContainsKey("gearScore"))
                    {
                        if (gear_score - enchantStats["gearScore"] != 0)
                            textDamage += " (" + (enchantStats["gearScore"] - gear_score) + ")";

                    }

                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.gear_score > 0)
                        {
                            if (item.enchantStats.ContainsKey("gearScore"))
                            {
                                if (enchantStats.ContainsKey("gearScore"))
                                {
                                    if (item.enchantStats["gearScore"] > enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (item.enchantStats["gearScore"] < enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (item.enchantStats["gearScore"] == enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                            else
                            {
                                if (enchantStats.ContainsKey("gearScore"))
                                {
                                    if (gear_score > enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (gear_score < enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (gear_score == enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        }
                    }
#if AT_I2LOC_PRESET
                 if(gear_score>0)
                    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score")+" "+mark, textDamage, true);
#else
                    if (gear_score > 0)
                        UGUITooltip.Instance.AddAttribute("Gear Score " + mark, textDamage, true);
#endif


                }

            }
            else if (itemType == "Weapon")
            {

#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetType(" "+I2.Loc.LocalizationManager.GetTranslation(subType));
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UGUITooltip.Instance.SetType(" " + subType);
                UGUITooltip.Instance.AddAttribute(slotName, "", true);
#endif

                if (gear_score > 0)
                {
                    string textDamage = gear_score.ToString();
                    string mark = "";
                    if (enchantStats.ContainsKey("gearScore"))
                    {
                        if (gear_score - enchantStats["gearScore"] != 0)
                            textDamage += " (" + (enchantStats["gearScore"] - gear_score) + ")";

                    }

                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.gear_score > 0)
                        {
                            if (item.enchantStats.ContainsKey("gearScore")){
                            
                                if(enchantStats.ContainsKey("gearScore")){
                                if (item.enchantStats["gearScore"] > enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (item.enchantStats["gearScore"] < enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (item.enchantStats["gearScore"] == enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                            else
                            {
                                if (enchantStats.ContainsKey("gearScore"))
                                {
                                    if (gear_score > enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (gear_score < enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (gear_score == enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        }
                    }
#if AT_I2LOC_PRESET
                 if(gear_score>0)
                    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score")+" "+mark, textDamage, true);
#else
                    if (gear_score > 0)
                        UGUITooltip.Instance.AddAttribute("Gear Score " + mark, textDamage, true);
#endif


                }



            }
            else
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetType(I2.Loc.LocalizationManager.GetTranslation(itemType));
#else
                UGUITooltip.Instance.SetType(itemType);
#endif
            }
            if (itemType == "Bag")
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Number of Slots"),stackLimit.ToString(),true);
#else
                UGUITooltip.Instance.AddAttribute("Number of Slots", stackLimit.ToString(), true);
#endif
            }
            UGUITooltip.Instance.SetTypeColour(UGUITooltip.Instance.itemTypeColour);
            if (Weight > 0)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetWeight(I2.Loc.LocalizationManager.GetTranslation("Weight")+": " + Weight + "(" + (Weight*count) + ")");
#else
                UGUITooltip.Instance.SetWeight("Weight: " + Weight + " (" + (Weight * count) + ")");
#endif
            }
            else
            {
                UGUITooltip.Instance.SetWeight("");
            }
            if (itemType == "Weapon" || itemEffectTypes.Contains("Stat"))
            {
                UGUITooltip.Instance.AddAttributeSeperator();
#if AT_I2LOC_PRESET
        UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Stats"), UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAttributeTitle("Stats", UGUITooltip.Instance.itemSectionTitleColour);
#endif
            }
            //Color colour = UGUITooltip.Instance.defaultTextColour;
            // string defaultColourText = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(colour.r), ToByte(colour.g), ToByte(colour.b));
            if (itemType == "Weapon")
            {
                // string colourText = "";
                //  colour = UGUITooltip.Instance.defaultTextColour;
                string textDamage = damageValue.ToString();
                string mark = "";
                if (damageMaxValue - damageValue > 0)
                    textDamage += " - " + damageMaxValue.ToString();


                if (enchantStats.ContainsKey("dmg-base"))
                    if ((damageMaxValue + damageValue) / 2 - (enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 != 0)
                        textDamage += " (" + ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 - (damageMaxValue + damageValue) / 2) + ")";
                if (itemType == "Weapon" || itemType == "Armor")
                {
                    foreach (AtavismInventoryItem item in items)
                    {
                        if (enchantStats.ContainsKey("dmg-base"))
                        {
                            if (item.enchantStats.ContainsKey("dmg-base"))
                            {
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            if (item.enchantStats.ContainsKey("dmg-base"))
                            {
                                if ((damageMaxValue + damageValue) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if ((damageMaxValue + damageValue) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if ((damageMaxValue + damageValue) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                if ((damageMaxValue + damageValue) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if ((damageMaxValue + damageValue) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if ((damageMaxValue + damageValue) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                    }
                }
                //  colour = UGUITooltip.Instance.defaultTextColour;
                string textSpeed = ((float)weaponSpeed / 1000).ToString();
                string mark2 = "";

                if (itemType == "Weapon" || itemType == "Armor")
                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.weaponSpeed > weaponSpeed)
                            mark2 += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                        if (item.weaponSpeed < weaponSpeed)
                            mark2 += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                        if (item.weaponSpeed == weaponSpeed)
                            mark2 += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                    }
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage")) + " "+mark,  textDamage, true);
            UGUITooltip.Instance.AddAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("attack_speed")) + " "+mark2,  textSpeed, true);
#else
                UGUITooltip.Instance.AddAttribute("Damage " + mark, textDamage, false, UGUITooltip.Instance.itemTypeColour);
                UGUITooltip.Instance.AddAttribute("Speed " + mark2, textSpeed, false, UGUITooltip.Instance.itemTypeColour);
#endif
            }

            List<string> additonalStats = new List<string>();

            foreach (string st in enchantStats.Keys)
            {
                if (!itemEffectNames.Contains(st) && !additonalStats.Contains(st))
                {
                    // Debug.LogError("Stat " + st);
                    additonalStats.Add(st);
                }
            }
            int ite = 0;
            if (itemType == "Weapon" || itemType == "Armor")
            {
                foreach (AtavismInventoryItem item in items)
                {
                    if (ite == 0)
                        showAdditionalTooltip(item);
                    else
                        showAdditionalTooltip2(item);
                    ite++;
                }
            }
            foreach (int statPos in GetEffectPositionsOfTypes("Stat"))
            {

                string statName = itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                string[] statNames = statName.Split('_');
                if (statNames.Length > 1)
                {
                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                }
                else
                {
                    statName = FirstCharToUpper(statNames[0]);
                }
#endif
                //   colour = UGUITooltip.Instance.defaultTextColour;
                string textParam = "";
                if (int.Parse(itemEffectValues[statPos]) != 0)
                    textParam = itemEffectValues[statPos] + " ";
                if (enchantStats.ContainsKey(itemEffectNames[statPos]))
                    if (int.Parse(itemEffectValues[statPos]) - enchantStats[itemEffectNames[statPos]] != 0)
                        textParam += "(" + (enchantStats[itemEffectNames[statPos]]) + ")";
                string mark = "";

                bool printStat = false;
                if (textParam.Length > 0)
                    printStat = true;
                if (itemType == "Weapon" || itemType == "Armor")
                {

                    foreach (AtavismInventoryItem item in items)
                    {

                        if (item.itemEffectNames.Contains(itemEffectNames[statPos]))
                        {

                            int itemStatIndex = item.itemEffectNames.IndexOf(itemEffectNames[statPos]);
                            if (enchantStats.ContainsKey(itemEffectNames[statPos]))
                            {
                                if (item.enchantStats.ContainsKey(itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] > int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] < int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] == int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) > int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) < int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) == int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                            else
                            {
                                if (item.enchantStats.ContainsKey(itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] > int.Parse(itemEffectValues[statPos]))
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] < int.Parse(itemEffectValues[statPos]))
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] == int.Parse(itemEffectValues[statPos]))
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) > int.Parse(itemEffectValues[statPos]))
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) < int.Parse(itemEffectValues[statPos]))
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) == int.Parse(itemEffectValues[statPos]))
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }

                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                            ;
                        }

                    }
                }
                if (!string.IsNullOrEmpty(itemEffectValues[statPos]))
                    if (int.Parse(itemEffectValues[statPos]) > 0)
                    {
                        UGUITooltip.Instance.AddAttribute(statName + "  " + mark, textParam, false);
                    }
                    else if (int.Parse(itemEffectValues[statPos]) < 0)
                    {
                        UGUITooltip.Instance.AddAttribute(statName + "  " + mark, textParam, false);
                    }
                    else if (int.Parse(itemEffectValues[statPos]) == 0 && printStat)
                    {
                        UGUITooltip.Instance.AddAttribute(statName + "  " + mark, textParam, false);
                    }

            }

            //add stats from equiped items thats not in check item
            foreach (string addStatName in additonalStats)
            {
                bool printStat = false;
                string textParam = "";
                string mark = "";
                if (!addStatName.Equals("dmg-base") && !addStatName.Equals("dmg-max") && !addStatName.Equals("gearScore"))
                {
                    printStat = true;
                    textParam = "(" + enchantStats[addStatName] + ")";
                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.itemEffectNames.Contains(addStatName))
                        {
                            int itemStatIndex = item.itemEffectNames.IndexOf(addStatName);
                            if (item.enchantStats.ContainsKey(addStatName))
                            {
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] > enchantStats[addStatName])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] < enchantStats[addStatName])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] == enchantStats[addStatName])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";

                            }
                            else
                            {
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) > enchantStats[addStatName])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) < enchantStats[addStatName])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) == enchantStats[addStatName])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                            ;
                        }
                    }
                }
                if (printStat)
                {
#if AT_I2LOC_PRESET
                string _addStatName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(addStatName));
#else
                    string[] statNames = addStatName.Split('_');
                    string _addStatName = FirstCharToUpper(statNames[0]);
                    if (statNames.Length > 1)
                    {
                        _addStatName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                    }
#endif
                    UGUITooltip.Instance.AddAttribute(_addStatName + mark, textParam, false);
                }
            }

            //Add Effects and Abilities for Enchants
            if (enchantLeval > 0) 
            {
                UGUITooltip.Instance.AddAttributeTitle("Enchant Effects", UGUITooltip.Instance.itemSectionTitleColour);

                foreach (KeyValuePair<int,int> effects in enchantEffects) 
                {
                    AtavismEffect effect = Abilities.Instance.GetEffect(effects.Key);
                    if (effects.Value > 1)
                        UGUITooltip.Instance.AddAttributeSocket(effect.name + " x " + effects.Value + "\n" + effect.tooltip , effect.Icon, false);
                    else
                        UGUITooltip.Instance.AddAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                }
                foreach (KeyValuePair<int, int> abilities in enchantAbilities)
                {
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilities.Key);
                    if (abilities.Value > 1)
                        UGUITooltip.Instance.AddAttributeSocket(ability.name + " x " + abilities.Value + "\n" + ability.tooltip, ability.Icon, false);
                    else
                        UGUITooltip.Instance.AddAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                }
            }

            if (GetEffectPositionsOfTypes("SocketEffect").Count > 0)
            {
                UGUITooltip.Instance.AddAttributeTitle("Effects ", UGUITooltip.Instance.itemSectionTitleColour);

                //Add Effects and Abilities for socket items
                foreach (int effectPos in GetEffectPositionsOfTypes("SocketEffect"))
                {
                    int effectID = int.Parse(itemEffectValues[effectPos]);
                    AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                    if (effect != null)
                    {
                        UGUITooltip.Instance.AddAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                    }
                }
            }

            if (GetEffectPositionsOfTypes("SocketAbility").Count > 0)
            {
                UGUITooltip.Instance.AddAttributeTitle("Abilities ", UGUITooltip.Instance.itemSectionTitleColour);

                foreach (int effectPos in GetEffectPositionsOfTypes("SocketAbility"))
                {
                    int abilityID = int.Parse(itemEffectValues[effectPos]);
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                    if (ability != null)
                    {
                        UGUITooltip.Instance.AddAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                    }
                }
            }       

            if (socketSlots.Count > 0)
            {
                UGUITooltip.Instance.AddAttributeSeperator();
                foreach (string key in socketSlots.Keys)
                {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Sockets of")+" " + I2.Loc.LocalizationManager.GetTranslation(key), UGUITooltip.Instance.itemSectionTitleColour);
#else
                    UGUITooltip.Instance.AddAttributeTitle("Sockets of " + key, UGUITooltip.Instance.itemSectionTitleColour);
#endif
                    foreach (int it in socketSlots[key].Keys)
                    {
                        //  Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]);
                        if (socketSlots[key][it] > 0)
                        {
                            AtavismInventoryItem aii = Inventory.Instance.GetItemByTemplateID(socketSlots[key][it]);
                            if (aii == null)
                            {
#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                                UGUITooltip.Instance.AddAttributeSocket("Empty", null, false);
#endif
                                continue;
                            }
                            string socketStat = "";
                            foreach (int statPos in aii.GetEffectPositionsOfTypes("Stat"))
                            {
                                //Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]+" Stat pos:"+ statPos+ " count:"+itemEffectNames.Count);

                                string statName = aii.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                                string[] statNames = statName.Split('_');
                                if (statNames.Length > 1)
                                {
                                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                                }
                                else
                                {
                                    statName = FirstCharToUpper(statNames[0]);
                                }
#endif
                                socketStat += statName + " " + (int.Parse(aii.itemEffectValues[statPos]) > 0 ? "+" + aii.itemEffectValues[statPos] : int.Parse(aii.itemEffectValues[statPos]) < 0 ? "-" + aii.itemEffectValues[statPos] : "0") + "\n";
                            }

                            //Add Effects and Abilities for sockets
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketEffect")) 
                            {
                                int effectID = int.Parse(aii.itemEffectValues[effectPos]);                                
                                AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                                if (effect != null) {
                                    //UGUITooltip.Instance.AddAttributeSocket(effect.name, effect.icon, false);
                                    socketStat += effect.name + "\n" + effect.tooltip;
                                }
                            }
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketAbility"))
                            {
                                int abilityID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                                if (ability != null) {
                                    //UGUITooltip.Instance.AddAttributeSocket(ability.name, ability.icon, false);
                                    socketStat += ability.name + "\n" + ability.tooltip;
                                }
                            }
                            UGUITooltip.Instance.AddAttributeSocket(socketStat, aii.Icon, false);
                        }
                        else
                        {
#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                            UGUITooltip.Instance.AddAttributeSocket("Empty", null, false);
#endif
                        }
                    }
                }
            }
            if (setId > 0)
            {
                AtavismInventoryItemSet aiis = Inventory.Instance.GetItemBySetID(setId);
                UGUITooltip.Instance.AddAttributeSeperator();
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set Effects")+" "+I2.Loc.LocalizationManager.GetTranslation(aiis.Name),UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAttributeTitle("Set Effects " + aiis.Name, UGUITooltip.Instance.itemSectionTitleColour);
#endif

                foreach (AtavismInventoryItemSetLevel level in aiis.levelList)
                {
                    Color setColor = UGUITooltip.Instance.itemSetColour;
                    Color setTitleColor = UGUITooltip.Instance.itemSectionTitleColour;
                    if (setCount < level.NumerOfParts)
                    {
                        setColor = UGUITooltip.Instance.itemInactiveSetColour;
                        setTitleColor = UGUITooltip.Instance.itemInactiveSetColour;

                    }
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set")+" "+level.NumerOfParts+" "+I2.Loc.LocalizationManager.GetTranslation("parts"),setTitleColor);
#else
                    UGUITooltip.Instance.AddAttributeTitle("Set " + level.NumerOfParts + " parts", setTitleColor);
#endif
                    if (level.DamageValue != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValue > 0)
                            UGUITooltip.Instance.AddAttribute(statName, "+" + level.DamageValue.ToString(), false, setColor);
                        if (level.DamageValue < 0)
                            UGUITooltip.Instance.AddAttribute(statName, "-" + level.DamageValue.ToString(), false, setColor);
                    }
                    if (level.DamageValuePercentage != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValuePercentage > 0)
                            UGUITooltip.Instance.AddAttribute(statName, "+" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                        if (level.DamageValuePercentage < 0)
                            UGUITooltip.Instance.AddAttribute(statName, "-" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                    }

                    for (int k = 0; k < level.itemStatName.Count; k++)
                    {
                        string statName = level.itemStatName[k];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (level.itemStatValues[k] > 0)
                            UGUITooltip.Instance.AddAttribute(statName, "+" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValues[k] < 0)
                            UGUITooltip.Instance.AddAttribute(statName, "-" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValuesPercentage[k] > 0)
                            UGUITooltip.Instance.AddAttribute(statName, "+" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                        if (level.itemStatValuesPercentage[k] < 0)
                            UGUITooltip.Instance.AddAttribute(statName, "-" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                    }

                    //Add Effects and Abilities
                    if (level.itemEffects != null)
                    {
                        foreach (int ef in level.itemEffects)
                        {
                            AtavismEffect effect = Abilities.Instance.GetEffect(ef);
                            if (effect != null)
                            {
                                UGUITooltip.Instance.AddAttribute(effect.name, effect.tooltip, true, setColor);
                            }
                        }
                    }

                    if (level.itemAbilities != null)
                    {
                        foreach (int ab in level.itemAbilities)
                        {
                            AtavismAbility ability = Abilities.Instance.GetAbility(ab);
                            if (ability != null)
                            {
                                UGUITooltip.Instance.AddAttribute(ability.name, ability.tooltip, true, setColor);
                            }
                        }
                    }
                }
            }
            foreach (int statPos in GetEffectPositionsOfTypes("TalentPoints"))
            {
                string statValue = itemEffectValues[statPos];
                string statName = "Talent Points";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));

#else
                //statName += ((int.Parse(vals[0])!=0)?" "+vals[0]:"")+ ((float.Parse(vals[1]) != 0) ? " " + vals[1]+"%" : "");
#endif
                if (int.Parse(statValue) != 0)
                    UGUITooltip.Instance.AddAttribute(statName, statValue, false);
            }
            foreach (int statPos in GetEffectPositionsOfTypes("SkillPoints"))
            {
                string statValue = itemEffectValues[statPos];
                string statName = "Skill Points";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));

#else
                //statName += ((int.Parse(vals[0])!=0)?" "+vals[0]:"")+ ((float.Parse(vals[1]) != 0) ? " " + vals[1]+"%" : "");
#endif
                if (int.Parse(statValue) != 0)
                    UGUITooltip.Instance.AddAttribute(statName, statValue, false);
            }

            UGUITooltip.Instance.AddAttributeSeperator();
            bool bonus = false;
            if (GetEffectPositionsOfTypes("Bonus").Count>0)
            {
#if AT_I2LOC_PRESET
        UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Bonuses"), UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAttributeTitle("Bonuses", UGUITooltip.Instance.itemSectionTitleColour);
#endif
            }

            foreach (int statPos in GetEffectPositionsOfTypes("Bonus"))
            {
                bonus = true;
                string statName = itemEffectNames[statPos];
                string statValue = itemEffectValues[statPos];
             //   Debug.LogError(statName+" "+ statValue);
                string[] vals = statValue.Split('|');
            //    Debug.LogError(statName + " " + vals[0]+" : "+vals[1]+" : "+vals[2]);
                if(vals.Length>2)
                statName = vals[2];

#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));

#else
                //statName += ((int.Parse(vals[0])!=0)?" "+vals[0]:"")+ ((float.Parse(vals[1]) != 0) ? " " + vals[1]+"%" : "");
#endif
                if (int.Parse(vals[0]) != 0)
                    UGUITooltip.Instance.AddAttribute(statName, vals[0], false);
                if (float.Parse(vals[1]) != 0)
                    UGUITooltip.Instance.AddAttribute(statName, vals[1]+"%", false);

            }
            if (bonus)
                UGUITooltip.Instance.AddAttributeSeperator();


            bool vip = false;
            if (GetEffectPositionsOfTypes("VipPoints").Count > 0 || GetEffectPositionsOfTypes("VipTime").Count > 0)
            {
#if AT_I2LOC_PRESET
        UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Vip"), UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAttributeTitle("Vip", UGUITooltip.Instance.itemSectionTitleColour);
#endif
            }

            foreach (int statPos in GetEffectPositionsOfTypes("VipPoints"))
            {
                vip = true;
                string statName = itemEffectNames[statPos];
                string statValue = itemEffectValues[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("VipPoints"));
#else
                statName = "Vip Points";
#endif
                if (int.Parse(statValue) != 0)
                    UGUITooltip.Instance.AddAttribute(statName, statValue, false);
             

            }
         
            foreach (int statPos in GetEffectPositionsOfTypes("VipTime"))
            {
                vip = true;
                string statName = itemEffectNames[statPos];
                string statValue = itemEffectValues[statPos];

#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("VipTime"));
#else
                statName = "Vip Time";
#endif
                if (int.Parse(statValue) != 0)
                {
                    int time = int.Parse(statValue)*60;
                    int days = 0;
                    int hours = 0;
                    int minutes = 0;
                    if (time > 86400)
                    {
                        days = (int)time / 86400;
                        time -= days * 86400;
                    }
                    if (time > 3600)
                    {
                        hours = (int)time / 3600;
                        time -= hours * 3600;
                    }
                    if (time > 60)
                    {
                        minutes = (int)time / 60;
                        time = minutes * 60;
                    }
                    if (days > 0)
                    {
                        UGUITooltip.Instance.AddAttribute(statName , days + " days", false);
                    }
                    else if (hours > 0)
                    {
                        UGUITooltip.Instance.AddAttribute(statName,  hours + " hour", false);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAttribute(statName,  minutes + " minutes", false);
                    }
                }

            }
            if (vip)
                UGUITooltip.Instance.AddAttributeSeperator();


            if (itemReqTypes.Count > 0)


                for (int r = 0; r < itemReqTypes.Count; r++)
                {
                    if (itemReqTypes[r].Equals("Level"))
                    {
                        if ((int)ClientAPI.GetPlayerObject().GetProperty("level") < int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel"),itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAttribute("Required Level ", itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel"),  itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAttribute("Required Level ", itemReqValues[r], true);
#endif
                    }

                    if (itemReqTypes[r].Equals("Class"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("aspect")) == int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r] ), true);
#else
                            UGUITooltip.Instance.AddAttribute("Required Class ", itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]) , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAttribute("Required Class", itemReqNames[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif

                    }
                    if (itemReqTypes[r].Equals("Race"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("race")) == int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r] ), true);
#else
                            UGUITooltip.Instance.AddAttribute("Required Race ", itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]) , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAttribute("Required Race ", itemReqNames[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif


                    }

                    if (itemReqTypes[r].Equals("Skill Level"))
                    {


                        if (Skills.Instance.GetPlayerSkillLevel(itemReqNames[r]) < int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]),  itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAttribute("Required " + itemReqNames[r], itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]),  itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAttribute("Required " + itemReqNames[r], itemReqValues[r], true);
#endif
                    }

                    if (itemReqTypes[r].Equals("Stat"))
                    {
                        int val = 0;
                        if (ClientAPI.GetPlayerObject().PropertyExists(itemReqNames[r]))
                        {
                            val = (int)ClientAPI.GetPlayerObject().GetProperty(itemReqNames[r]);
                        }

                        string statName = itemReqNames[r];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (val < int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ statName  ,  itemReqValues[r], true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAttribute("Required " + statName, itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+statName ,  itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAttribute("Required " + statName, itemReqValues[r], true);
#endif
                    }
                }

            if (Unique)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Unique"),"",true);
#else
                UGUITooltip.Instance.AddAttribute("Unique", "", true);
#endif
            }

            if (isBound)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Soulbound"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                UGUITooltip.Instance.AddAttribute("Soulbound", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
            }
            else if (binding > 0)
            {
                if (binding == 1)
                {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnEquip"), "", true);
#else
                    UGUITooltip.Instance.AddAttribute("Soulbound On Equip", "", true);
#endif
                }
                else if (binding == 2)
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnPickup"), "", true);
#else
                    UGUITooltip.Instance.AddAttribute("Soulbound On Pickup", "", true);
#endif
            }

            if (sellable)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Sellable"), "", true);
#else
                UGUITooltip.Instance.AddAttribute("Sellable", "", true);
#endif
            }
            else
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Sellable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                UGUITooltip.Instance.AddAttribute("Not Sellable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif

            }
            if ((itemType == "Weapon" || itemType == "Armor"))
                if (enchantId > 0)
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Enchantable"), "", true);
#else
                    UGUITooltip.Instance.AddAttribute("Enchantable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Enchantable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                    UGUITooltip.Instance.AddAttribute("Not Enchantable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif

                }

            if (maxDurability > 0)
            {
#if AT_I2LOC_PRESET
             UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Durability")+" ", durability + "/" + maxDurability, true, UGUITooltip.Instance.itemTypeColour);
#else
                UGUITooltip.Instance.AddAttribute(" Durability", durability + "/" + maxDurability, true, UGUITooltip.Instance.itemTypeColour);
#endif

                if (repairable)
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Repairable"), "", true);
#else
                    UGUITooltip.Instance.AddAttribute("Repairable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Repairable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                    UGUITooltip.Instance.AddAttribute("Not Repairable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                }
            }




            if (autoattack > 0)
            {
                AtavismAbility aa = Abilities.Instance.GetAbility(autoattack);
                if (aa != null)
                {
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Auto Attack")+" ",  aa.name, true, UGUITooltip.Instance.itemTypeColour);
#else
                    UGUITooltip.Instance.AddAttribute("Auto Attack", aa.name, true, UGUITooltip.Instance.itemTypeColour);
#endif
                }
            }

            if (parry)
            {
#if AT_I2LOC_PRESET
             UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Parry effect")+" ", "", true, UGUITooltip.Instance.itemTypeColour);
#else
                UGUITooltip.Instance.AddAttribute("Parry effect","", true, UGUITooltip.Instance.itemTypeColour);
#endif
            }


            if (!sockettype.Equals("")&& !sockettype.Equals("~ none ~"))
            {
#if AT_I2LOC_PRESET
             UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Socketing type")+" ",sockettype, true, UGUITooltip.Instance.itemTypeColour);
#else
                UGUITooltip.Instance.AddAttribute("Socketing type", sockettype, true, UGUITooltip.Instance.itemTypeColour);
#endif
            }


            /*   if (ammoType > 0)
               {
   #if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Ammo type")+" ", "", true, UGUITooltip.Instance.itemTypeColour);
   #else
                   UGUITooltip.Instance.AddAttribute("Ammo type", "", true, UGUITooltip.Instance.itemTypeColour);
   #endif
               }*/

            if (deathLoss > 0)
            {
#if AT_I2LOC_PRESET
             UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Death Loss chance")+" ",  deathLoss.ToString(), true, UGUITooltip.Instance.itemTypeColour);
#else
                UGUITooltip.Instance.AddAttribute("Death Loss chance", deathLoss.ToString(), true, UGUITooltip.Instance.itemTypeColour);
#endif
            }

            if (GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                UGUITooltip.Instance.AddAttributeSeperator();
#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + tooltip);
#else
                string tooltipDescription = tooltip;
#endif
                int templateId = int.Parse(itemEffectValues[GetEffectPositionsOfTypes("ClaimObject")[0]]);
                AtavismBuildObjectTemplate abot = WorldBuilder.Instance.GetBuildObjectTemplate(templateId);
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim Object")+" : " + I2.Loc.LocalizationManager.GetTranslation(abot.buildObjectName));
 string vClaimtype = "";
                foreach (var vct in abot.validClaimTypes)
                {
                    foreach (var ct in WorldBuilder.Instance.ClaimTypes.Values)
                    {
                        if (ct.id == vct)
                        {

                            vClaimtype += I2.Loc.LocalizationManager.GetTranslation(ct.name)+", ";
                        }
                    }
                }

                if (vClaimtype.Length > 2)
                {
                    vClaimtype = vClaimtype.Remove(vClaimtype.Length - 2);
                }
            UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim type") + " : " + vClaimtype);
            UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int i = 0; i < abot.itemsReq.Count; i++)
            {
                AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                UGUITooltip.Instance.AddAttributeResource(I2.Loc.LocalizationManager.GetTranslation(item.name), abot.itemsReqCount[i].ToString(),item.Icon,false);
            }
            UGUITooltip.Instance.AddAttributeSeperator();
            if (abot.skill > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                    {
                        UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation("Skill") + " " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname), abot.skillLevelReq.ToString(),true);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+" " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname) ,  abot.skillLevelReq.ToString() ,true,UGUITooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                }
            }
           if (!abot.reqWeapon.Equals("~ none ~") && !abot.reqWeapon.Equals(""))
            {
                if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"), I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true);
                else
                    UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type") ,  I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true,UGUITooltip.Instance.itemStatLowerColour);
            }
#else
                UGUITooltip.Instance.AddAttributeTitle("Claim Object : " + abot.buildObjectName);
                string vClaimtype = "";
                foreach (var vct in abot.validClaimTypes)
                {
                    foreach (var ct in WorldBuilder.Instance.ClaimTypes.Values)
                    {
                        if (ct.id == vct)
                        {
                            vClaimtype += ct.name+", ";
                        }
                    }
                }

                if (vClaimtype.Length > 2)
                {
                    vClaimtype = vClaimtype.Remove(vClaimtype.Length - 2);
                }
                
                UGUITooltip.Instance.AddAttributeTitle("Claim type : " + vClaimtype);
                UGUITooltip.Instance.AddAttributeTitle("Resources : ");
                for (int i = 0; i < abot.itemsReq.Count; i++)
                {
                    AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                    UGUITooltip.Instance.AddAttributeResource(item.name, abot.itemsReqCount[i].ToString(), item.Icon, false);
                }
                UGUITooltip.Instance.AddAttributeSeperator();
                if (abot.skill > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                        {
                            UGUITooltip.Instance.AddAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UGUITooltip.Instance.AddAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true, UGUITooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                    }
                }

                if (!abot.reqWeapon.Equals("~ none ~") && !abot.reqWeapon.Equals(""))
                {
                    if (((string) ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                        UGUITooltip.Instance.AddAttribute("Required equiped weapon type: ", abot.reqWeapon, true);
                    else
                        UGUITooltip.Instance.AddAttribute("Required equiped weapon type: ", abot.reqWeapon, true, UGUITooltip.Instance.itemStatLowerColour);
                }
#endif
                UGUITooltip.Instance.SetDescription(tooltipDescription);
            }
            else if (GetEffectPositionsOfTypes("CraftsItem").Count > 0)
            {
                UGUITooltip.Instance.AddAttributeSeperator();

#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + tooltip);
#else
                string tooltipDescription = tooltip;
#endif
                int craftingRecipeID = int.Parse(itemEffectValues[GetEffectPositionsOfTypes("CraftsItem")[0]]);
                AtavismCraftingRecipe recipe = Inventory.Instance.GetCraftingRecipe(craftingRecipeID);
                // Crafts <item>
                AtavismInventoryItem itemCrafted = Inventory.Instance.GetItemByTemplateID(recipe.createsItems[0]);
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Crafts"), itemCrafted.name, true);
            UGUITooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int r = 0; r < recipe.itemsReq.Count; r++)
            { 
                AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                UGUITooltip.Instance.AddAttributeResource(I2.Loc.LocalizationManager.GetTranslation("Items/" + it.name), recipe.itemsReqCounts[r].ToString(),it.Icon, false);
            }
            UGUITooltip.Instance.AddAttributeSeperator();
            UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Station"), recipe.stationReq, true);
            if (recipe.skillID > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                    {
                        UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required")+" "+ I2.Loc.LocalizationManager.GetTranslation("Skill")+" "+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname), recipe.skillLevelReq.ToString(), true);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+""+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname) ,  recipe.skillLevelReq.ToString(), true,UGUITooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                }
            }
          
#else
                UGUITooltip.Instance.AddAttribute("Crafts", itemCrafted.name, true);
                UGUITooltip.Instance.AddAttributeTitle("Resources : ");
                for (int r = 0; r < recipe.itemsReq.Count; r++)
                {
                    AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                    UGUITooltip.Instance.AddAttributeResource(it.name, recipe.itemsReqCounts[r].ToString(), it.Icon, false);
                }
                UGUITooltip.Instance.AddAttributeSeperator();
                UGUITooltip.Instance.AddAttribute("Required Station", recipe.stationReq, true);
                if (recipe.skillID > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                        {
                            UGUITooltip.Instance.AddAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UGUITooltip.Instance.AddAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true, UGUITooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                    }
                }
#endif

                UGUITooltip.Instance.AddAttributeSeperator();
                UGUITooltip.Instance.SetDescription(tooltipDescription);
                showAdditionalTooltip(recipe.createsItems[0]);
            }
            else
            {
                UGUITooltip.Instance.AddAttributeSeperator();

#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetDescription(I2.Loc.LocalizationManager.GetTranslation("Items/" + tooltip));
#else
                UGUITooltip.Instance.SetDescription(tooltip);
#endif
            }
            //check ability ie learned
            if (GetEffectPositionsOfTypes("UseAbility").Count > 0)
            {
                if (name.IndexOf("TeachAbility") > -1)
                {
                    int abilityID = int.Parse(itemEffectNames[GetEffectPositionsOfTypes("UseAbility")[0]]);
                    AtavismAbility aa = Abilities.Instance.GetAbility(abilityID);
                    AtavismAbility paa = Abilities.Instance.GetPlayerAbility(abilityID);
                    if (paa != null)
                    {

#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("taught") , "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                        UGUITooltip.Instance.AddAttribute("Taught", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                    }
                    aa.ShowAdditionalTooltip();
                }
            }



            UGUITooltip.Instance.Show(target);
        }






        /// <summary>
        /// Show Additional tooltip for UGUI implementation.
        /// </summary>
        /// <param name="Id"></param>
        void showAdditionalTooltip(int Id)
        {
            AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(Id);
            showAdditionalTooltip(item);
        }
        
        /// <summary>
        /// Show Additional tooltip for UGUI implementation.
        /// </summary>
        /// <param name="item"></param>

        public void showAdditionalTooltip(AtavismInventoryItem item)
        {
            //  Debug.LogError("showAdditionalTooltip");
            //   string defaultColor = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(UGUITooltip.Instance.defaultTextColour.r), ToByte(UGUITooltip.Instance.defaultTextColour.g), ToByte(UGUITooltip.Instance.defaultTextColour.b));


#if AT_I2LOC_PRESET
        UGUITooltip.Instance.SetAdditionalTitle((item.enchantLeval > 0?" +"+ item.enchantLeval : "")+" "+I2.Loc.LocalizationManager.GetTranslation("Items/"+item.name));
#else
            UGUITooltip.Instance.SetAdditionalTitle((item.enchantLeval > 0 ? " +" + item.enchantLeval : "") + " " + item.name);
#endif
            if (item.Icon != null)
            {
                UGUITooltip.Instance.SetAdditionalIcon(item.Icon);
            }
            UGUITooltip.Instance.SetAdditionalQuality(item.quality);
            UGUITooltip.Instance.SetAdditionalTitleColour(AtavismSettings.Instance.ItemQualityColor(item.quality));
            string slotName = Inventory.Instance.GetItemByTemplateID(item.TemplateId).slot;
         
            if (item.itemType == "Tool")
            {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
      		    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute(slotName, "", true);
                UGUITooltip.Instance.SetAdditionalType(item.itemType);
              
#endif

            }
            else if (item.itemType == "Armor")
            {

#if AT_I2LOC_PRESET
      		UGUITooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation("Slot") + ": "+I2.Loc.LocalizationManager.GetTranslation(slotName));
                    if(item.gear_score>0)
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UGUITooltip.Instance.SetAdditionalType(slotName);
                if (item.gear_score > 0)
                    UGUITooltip.Instance.AddAdditionalAttribute("Gear Score", item.gear_score.ToString(), true);
#endif
                                
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation(slotName));
#else
                UGUITooltip.Instance.SetAdditionalType(slotName);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    string mark = "";
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                if (gear_score > item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (gear_score < item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (gear_score == item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score")+" "+mark, textDamage, true);
#else
                   
                        UGUITooltip.Instance.AddAdditionalAttribute("Gear Score " + mark, textDamage, true);
#endif


                }

            }
            else if (item.itemType == "Weapon")
            {
                                
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UGUITooltip.Instance.SetAdditionalType(" " + item.subType);
                UGUITooltip.Instance.AddAdditionalAttribute(slotName, "", true);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    string mark = "";
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                    if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                    if (gear_score > item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (gear_score < item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (gear_score == item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score")+" "+mark, textDamage, true);
#else
                   
                        UGUITooltip.Instance.AddAdditionalAttribute("Gear Score " + mark, textDamage, true);
#endif


                }
/*
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
                 if(item.gear_score>0)
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UGUITooltip.Instance.SetAdditionalType(" " + item.subType);
                UGUITooltip.Instance.AddAdditionalAttribute(slotName, "", true);
                if (item.gear_score > 0)
                    UGUITooltip.Instance.AddAdditionalAttribute("Gear Score", item.gear_score.ToString(), true);
#endif*/
            }
            else
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
#else
                UGUITooltip.Instance.SetAdditionalType(item.itemType);
#endif
            }
            UGUITooltip.Instance.SetAdditionalTypeColour(UGUITooltip.Instance.itemTypeColour);
            if (item.Weight > 0)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalWeight(I2.Loc.LocalizationManager.GetTranslation("Weight")+": " + item.Weight + "(" + (item.Weight * item.count) + ")");
#else
                UGUITooltip.Instance.SetAdditionalWeight("Weight: " + item.Weight + " (" + (item.Weight * item.count) + ")");
#endif
            }
            else
            {
                UGUITooltip.Instance.SetAdditionalWeight("");
            }
            if (item.itemType == "Weapon" || item.itemEffectTypes.Contains("Stat"))
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
#if AT_I2LOC_PRESET
        UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Stats"), UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Stats", UGUITooltip.Instance.itemSectionTitleColour);
#endif
            }
            // Color colour = UGUITooltip.Instance.defaultTextColour;
            //string defaultColourText = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(colour.r), ToByte(colour.g), ToByte(colour.b));
            if (item.itemType == "Weapon")
            {
                // string colourText = "";
                //colour = UGUITooltip.Instance.defaultTextColour;
                string textDamage = item.damageValue.ToString();
                string mark = "";
                if (item.damageMaxValue - item.damageValue > 0)
                    textDamage += " - " + item.damageMaxValue.ToString();


                if (item.enchantStats.ContainsKey("dmg-base"))
                    if ((item.damageMaxValue + item.damageValue) / 2 - (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 != 0)
                        textDamage += " (" + ((item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 - (item.damageMaxValue + item.damageValue) / 2) + ")";
                if (item.itemType == "Weapon" || item.itemType == "Armor")
                   
                    if (enchantStats.ContainsKey("dmg-base"))
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                        else
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                    }
                    else
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                        else
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                    }
                //}

                //colour = UGUITooltip.Instance.defaultTextColour;
                string textSpeed = ((float)item.weaponSpeed / 1000).ToString();
                string mark2 = "";

                if (item.itemType == "Weapon" || item.itemType == "Armor")
                    //foreach (AtavismInventoryItem item in items)
                    //{
                    if (item.weaponSpeed < weaponSpeed)
                        mark2 += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                if (item.weaponSpeed > weaponSpeed)
                    mark2 += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                if (item.weaponSpeed == weaponSpeed)
                    mark2 += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                //}
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage")) + " "+mark,  textDamage, true);
            UGUITooltip.Instance.AddAdditionalAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("attack_speed")) + " "+mark2,  textSpeed, true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute("Damage " + mark, textDamage, false, UGUITooltip.Instance.itemTypeColour);
                UGUITooltip.Instance.AddAdditionalAttribute("Speed " + mark2, textSpeed, false, UGUITooltip.Instance.itemTypeColour);
#endif
            }

            List<string> additonalStats = new List<string>();

            foreach (string st in item.enchantStats.Keys)
            {
                if (!item.itemEffectNames.Contains(st) && !additonalStats.Contains(st))
                {
                    // Debug.LogError("Stat " + st);
                    additonalStats.Add(st);
                }
            }
            foreach (int statPos in item.GetEffectPositionsOfTypes("Stat"))
            {

                string statName = item.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                string[] statNames = statName.Split('_');
                if (statNames.Length > 1)
                {
                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                }
                else
                {
                    statName = FirstCharToUpper(statNames[0]);
                }
#endif
                // colour = UGUITooltip.Instance.defaultTextColour;
                string textParam = "";
                if (int.Parse(item.itemEffectValues[statPos]) != 0)
                    textParam = item.itemEffectValues[statPos] + " ";
                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) - item.enchantStats[item.itemEffectNames[statPos]] != 0)
                        textParam += "(" + (item.enchantStats[item.itemEffectNames[statPos]]) + ")";
                string mark = "";

                bool printStat = false;
                if (textParam.Length > 0)
                    printStat = true;
                if ((item.itemType == "Weapon" || item.itemType == "Armor") && (itemType == item.itemType))
                {
                    
                    if (itemEffectNames.Contains(item.itemEffectNames[statPos]))
                    {

                        int itemStatIndex = itemEffectNames.IndexOf(item.itemEffectNames[statPos]);
                        
                        if (enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                        {
                            if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]))
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]))
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]))
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]))
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]))
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]))
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                      
                    }
                    else
                    {
                        mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        ;
                    }

                }
                if (!string.IsNullOrEmpty(item.itemEffectValues[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) > 0)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute(statName + "  " + mark, textParam, false);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) < 0)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute(statName + "  " + mark, textParam, false);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) == 0 && printStat)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute(statName + "  " + mark, textParam, false);
                    }

            }
            //<sprite=1>
            //add stats from equiped items thats not in check item
            foreach (string addStatName in additonalStats)
            {
                bool printStat = false;
                string textParam = "";
                string mark = "";
                if (!addStatName.Equals("dmg-base") && !addStatName.Equals("dmg-max") && !addStatName.Equals("gearScore"))
                {
                    printStat = true;
                    textParam = "(" + item.enchantStats[addStatName] + ")";
                  
                    if (item.itemEffectNames.Contains(addStatName))
                    {
                        int itemStatIndex = item.itemEffectNames.IndexOf(addStatName);

                        if (item.enchantStats.ContainsKey(addStatName))
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] < enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] > enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] == enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";

                        }
                        else
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) < enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) > enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) == enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                    }
                    else
                    {
                        mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        ;
                    }
                    // }
                }
                if (printStat)
                {
#if AT_I2LOC_PRESET
                string _addStatName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(addStatName));
#else
                    string[] statNames = addStatName.Split('_');
                    string _addStatName = FirstCharToUpper(statNames[0]);
                    if (statNames.Length > 1)
                    {
                        _addStatName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                    }
#endif
                    UGUITooltip.Instance.AddAdditionalAttribute(_addStatName + mark, textParam, false);
                }
            }

            //Add Effects and Abilities for Enchants
            if (item.enchantLeval > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Enchant Effects", UGUITooltip.Instance.itemSectionTitleColour);

                foreach (KeyValuePair<int, int> effects in item.enchantEffects)
                {
                    AtavismEffect effect = Abilities.Instance.GetEffect(effects.Key);   
                    if (effects.Value > 1)
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(effect.name + " x " + effects.Value + "\n" + effect.tooltip, effect.Icon, false);
                    else
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                }
                foreach (KeyValuePair<int, int> abilities in item.enchantAbilities)
                {
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilities.Key);
                    if (abilities.Value > 1)
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(ability.name + " x " + abilities.Value + "\n" + ability.tooltip, ability.Icon, false);
                    else
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketEffect").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Effects ", UGUITooltip.Instance.itemSectionTitleColour);

                //Add Effects and Abilities for socket items
                foreach (int effectPos in item.GetEffectPositionsOfTypes("SocketEffect"))
                {
                    int effectID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                    if (effect != null)
                    {
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                    }
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketAbility").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Abilities ", UGUITooltip.Instance.itemSectionTitleColour);

                foreach (int effectPos in item.GetEffectPositionsOfTypes("SocketAbility"))
                {
                    int abilityID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                    if (ability != null)
                    {
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                    }
                }
            }


            if (item.socketSlots.Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
                foreach (string key in item.socketSlots.Keys)
                {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Sockets of")+" " + I2.Loc.LocalizationManager.GetTranslation(key), UGUITooltip.Instance.itemSectionTitleColour);
#else
                    UGUITooltip.Instance.AddAdditionalAttributeTitle("Sockets of " + key, UGUITooltip.Instance.itemSectionTitleColour);
#endif
                    foreach (int it in item.socketSlots[key].Keys)
                    {
                        //  Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]);
                        if (item.socketSlots[key][it] > 0)
                        {
                            AtavismInventoryItem aii = Inventory.Instance.GetItemByTemplateID(item.socketSlots[key][it]);
                            if (aii == null)
                            {
#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                                UGUITooltip.Instance.AddAdditionalAttributeSocket("Empty", null, false);
#endif
                                continue;
                            }
                            string socketStat = "";
                            foreach (int statPos in aii.GetEffectPositionsOfTypes("Stat"))
                            {
                                //Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]+" Stat pos:"+ statPos+ " count:"+itemEffectNames.Count);

                                string statName = aii.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                                string[] statNames = statName.Split('_');
                                if (statNames.Length > 1)
                                {
                                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                                }
                                else
                                {
                                    statName = FirstCharToUpper(statNames[0]);
                                }
#endif
                                socketStat += statName + " " + (int.Parse(aii.itemEffectValues[statPos]) > 0 ? "+" + aii.itemEffectValues[statPos] : int.Parse(aii.itemEffectValues[statPos]) < 0 ? "-" + aii.itemEffectValues[statPos] : "0") + "\n";
                            }

                            //Add Effects and Abilities for sockets
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketEffect"))
                            {
                                int effectID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                                if (effect != null)
                                {
                                    //UGUITooltip.Instance.AddAttributeSocket(effect.name, effect.icon, false);
                                    socketStat += effect.name + "\n" + effect.tooltip;
                                }
                            }
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketAbility"))
                            {
                                int abilityID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                                if (ability != null)
                                {
                                    //UGUITooltip.Instance.AddAttributeSocket(ability.name, ability.icon, false);
                                    socketStat += ability.name + "\n" + ability.tooltip;
                                }
                            }
                            UGUITooltip.Instance.AddAdditionalAttributeSocket(socketStat, aii.Icon, false);

                        }
                        else
                        {
#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAdditionalAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                            UGUITooltip.Instance.AddAdditionalAttributeSocket("Empty", null, false);
#endif
                        }
                    }
                }
            }
            if (item.setId > 0)
            {
                AtavismInventoryItemSet aiis = Inventory.Instance.GetItemBySetID(item.setId);
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set Effects")+" "+I2.Loc.LocalizationManager.GetTranslation(aiis.Name),UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Set Effects " + aiis.Name, UGUITooltip.Instance.itemSectionTitleColour);
#endif

                foreach (AtavismInventoryItemSetLevel level in aiis.levelList)
                {
                    Color setColor = UGUITooltip.Instance.itemSetColour;
                    Color setTitleColor = UGUITooltip.Instance.itemSectionTitleColour;
                    if (item.setCount < level.NumerOfParts)
                    {
                        setColor = UGUITooltip.Instance.itemInactiveSetColour;
                        setTitleColor = UGUITooltip.Instance.itemInactiveSetColour;

                    }
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set")+" "+level.NumerOfParts+" "+I2.Loc.LocalizationManager.GetTranslation("parts"), setTitleColor);
#else
                    UGUITooltip.Instance.AddAdditionalAttributeTitle("Set " + level.NumerOfParts + " parts", setTitleColor);
#endif
                    if (level.DamageValue != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValue > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "+" + level.DamageValue.ToString(), false, setColor);
                        if (level.DamageValue < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "-" + level.DamageValue.ToString(), false, setColor);
                    }
                    if (level.DamageValuePercentage != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValuePercentage > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "+" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                        if (level.DamageValuePercentage < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "-" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                    }

                    for (int k = 0; k < level.itemStatName.Count; k++)
                    {
                        string statName = level.itemStatName[k];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (level.itemStatValues[k] > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "+" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValues[k] < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "-" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValuesPercentage[k] > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "+" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                        if (level.itemStatValuesPercentage[k] < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute(statName, "-" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                    }
                    
                    //Add Effects and Abilities
                    if (level.itemEffects != null)
                    {
                        foreach (int ef in level.itemEffects)
                        {
                            AtavismEffect effect = Abilities.Instance.GetEffect(ef);
                            if (effect != null)
                            {
                                UGUITooltip.Instance.AddAdditionalAttribute(effect.name, effect.tooltip, true, setColor);
                            }
                        }
                    }

                    if (level.itemAbilities != null)
                    {
                        foreach (int ab in level.itemAbilities)
                        {
                            AtavismAbility ability = Abilities.Instance.GetAbility(ab);
                            if (ability != null)
                            {
                                UGUITooltip.Instance.AddAdditionalAttribute(ability.name, ability.tooltip, true, setColor);
                            }
                        }
                    }
                }
            }


            UGUITooltip.Instance.AddAdditionalAttributeSeperator();
            if (item.itemReqTypes.Count > 0)


                for (int r = 0; r < item.itemReqTypes.Count; r++)
                {
                    if (item.itemReqTypes[r].Equals("Level"))
                    {
                        if ((int)ClientAPI.GetPlayerObject().GetProperty("level") < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") ,  item.itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Level ", item.itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") + " ",  item.itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Level ", item.itemReqValues[r], true);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Class"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("aspect")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") + " ", I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Class ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Class", item.itemReqNames[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif

                    }
                    if (item.itemReqTypes[r].Equals("Race"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("race")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Race ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Race ", item.itemReqNames[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Skill Level"))
                    {


                        if (Skills.Instance.GetPlayerSkillLevel(item.itemReqNames[r]) < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]), item.itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required " + item.itemReqNames[r], item.itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]),  item.itemReqValues[r], true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required " + item.itemReqNames[r], item.itemReqValues[r], true);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Stat"))
                    {
                        int val = 0;
                        if (ClientAPI.GetPlayerObject().PropertyExists(item.itemReqNames[r]))
                        {
                            //   Debug.LogError("Stat: r:" + r + " itemReqNames:" + itemReqNames[r] + " player prop:" + ClientAPI.GetPlayerObject().GetProperty(itemReqNames[r]));
                            val = (int)ClientAPI.GetPlayerObject().GetProperty(item.itemReqNames[r]);
                        }

                        string statName = item.itemReqNames[r];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (val < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ statName  ,  item.itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required " + statName, item.itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+statName , item.itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute("Required " + statName, item.itemReqValues[r], true);
#endif
                    }
                }

            if (item.Unique)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Unique"),"",true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute("Unique", "", true);
#endif
            }

            if (item.isBound)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Soulbound"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                UGUITooltip.Instance.AddAdditionalAttribute("Soulbound", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
            }
            else if (item.binding > 0)
            {
                if (item.binding == 1)
                {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnEquip"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute("Soulbound On Equip", "", true);
#endif
                }
                else if (item.binding == 2)
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnPickup"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute("Soulbound On Pickup", "", true);
#endif
            }
            if (item.sellable)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Sellable"), "", true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute("Sellable", "", true);
#endif
            }
            else
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Sellable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                UGUITooltip.Instance.AddAdditionalAttribute("Not Sellable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif

            }
            if ((item.itemType == "Weapon" || item.itemType == "Armor"))

                if (item.enchantId > 0)
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Enchantable"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute("Enchantable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Enchantable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute("Not Enchantable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif

                }
            if (item.maxDurability > 0)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("Durability")+" ", item.durability + "/" + item.maxDurability, true, UGUITooltip.Instance.itemTypeColour);
#else
                UGUITooltip.Instance.AddAdditionalAttribute(" Durability", item.durability + "/" + item.maxDurability, true, UGUITooltip.Instance.itemTypeColour);
#endif
                if (item.repairable)
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Repairable"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute("Repairable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Repairable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute("Not Repairable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                }
            }
            if (item.GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int templateId = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("ClaimObject")[0]]);
                AtavismBuildObjectTemplate abot = WorldBuilder.Instance.GetBuildObjectTemplate(templateId);
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim Object")+" : " + I2.Loc.LocalizationManager.GetTranslation(abot.buildObjectName));
            UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim type") + " : " + I2.Loc.LocalizationManager.GetTranslation(abot.validClaimTypes.ToString()));
            UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int i = 0; i < abot.itemsReq.Count; i++)
            {
                AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                UGUITooltip.Instance.AddAdditionalAttributeResource(I2.Loc.LocalizationManager.GetTranslation(itemc.name), abot.itemsReqCount[i].ToString(),itemc.Icon,false);
            }
            UGUITooltip.Instance.AddAdditionalAttributeSeperator();
            if (abot.skill > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation("Skill") + " " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname), abot.skillLevelReq.ToString(),true);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+" " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname) ,  abot.skillLevelReq.ToString() ,true,UGUITooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                }
            }
            if (!abot.reqWeapon.Equals("~ none ~"))
            {
                if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                    UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"), I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true);
                else
                    UGUITooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type") , I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon) ,true,UGUITooltip.Instance.itemStatLowerColour);
            }
#else
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Claim Object : " + abot.buildObjectName, UGUITooltip.Instance.itemSectionTitleColour);
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Claim type : " + abot.validClaimTypes);
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Resources : ");
                for (int i = 0; i < abot.itemsReq.Count; i++)
                {
                    AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                    UGUITooltip.Instance.AddAdditionalAttributeResource(itemc.name, abot.itemsReqCount[i].ToString(), itemc.Icon, false);
                }
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
                if (abot.skill > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true, UGUITooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                    }
                }
                if (!abot.reqWeapon.Equals("~ none ~"))
                {
                    if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                        UGUITooltip.Instance.AddAdditionalAttribute("Required equiped weapon type: ", abot.reqWeapon, true);
                    else
                        UGUITooltip.Instance.AddAdditionalAttribute("Required equiped weapon type:", abot.reqWeapon, true, UGUITooltip.Instance.itemStatLowerColour);
                }
#endif
                UGUITooltip.Instance.SetAdditionalDescription(tooltipDescription);
            }
            else if (item.GetEffectPositionsOfTypes("CraftsItem").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();

#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int craftingRecipeID = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("CraftsItem")[0]]);
                AtavismCraftingRecipe recipe = Inventory.Instance.GetCraftingRecipe(craftingRecipeID);
                // Crafts <item>
                AtavismInventoryItem itemCrafted = Inventory.Instance.GetItemByTemplateID(recipe.createsItems[0]);
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Crafts"), itemCrafted.name, true);
            UGUITooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int r = 0; r < recipe.itemsReq.Count; r++)
            {
                 AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
               UGUITooltip.Instance.AddAdditionalAttributeResource(I2.Loc.LocalizationManager.GetTranslation("Items/" + it.name), recipe.itemsReqCounts[r].ToString(),it.Icon, false);
            }
            UGUITooltip.Instance.AddAdditionalAttributeSeperator();
            UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Station"), recipe.stationReq, true);
            if (recipe.skillID > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required")+" "+ I2.Loc.LocalizationManager.GetTranslation("Skill")+" "+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname), recipe.skillLevelReq.ToString(), true);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+""+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname) ,  recipe.skillLevelReq.ToString() , true, UGUITooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                }
            }
          
#else
                UGUITooltip.Instance.AddAdditionalAttribute("Crafts", itemCrafted.name, true);
                UGUITooltip.Instance.AddAdditionalAttributeTitle("Resources : ");
                for (int r = 0; r < recipe.itemsReq.Count; r++)
                {
                    AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                    UGUITooltip.Instance.AddAdditionalAttributeResource(it.name, recipe.itemsReqCounts[r].ToString(), it.Icon, false);
                }
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
                UGUITooltip.Instance.AddAdditionalAttribute("Required Station", recipe.stationReq, true);
                if (recipe.skillID > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true, UGUITooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                    }
                }
#endif

                UGUITooltip.Instance.AddAdditionalAttributeSeperator();
                UGUITooltip.Instance.SetAdditionalDescription(tooltipDescription);
                showAdditionalTooltip2(recipe.createsItems[0]);
            }
            else
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator();

#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalDescription(I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip));
#else
                UGUITooltip.Instance.SetAdditionalDescription(item.tooltip);
#endif
            }
            //check ability ie learned
            if (item.GetEffectPositionsOfTypes("UseAbility").Count > 0)
            {
                if (item.name.IndexOf("TeachAbility") > -1)
                {
                    int abilityID = int.Parse(item.itemEffectNames[item.GetEffectPositionsOfTypes("UseAbility")[0]]);
                    AtavismAbility aa = Abilities.Instance.GetAbility(abilityID);
                    AtavismAbility paa = Abilities.Instance.GetPlayerAbility(abilityID);
                    if (paa != null)
                    {

#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("taught") , "", true);
#else
                        UGUITooltip.Instance.AddAdditionalAttribute("Taught", "", true);
#endif
                    }
                    aa.ShowAdditionalTooltip2();
                }
            }
            UGUITooltip.Instance.ShowAdditionalTooltip();
        }


        /// <summary>
        /// Show secound additional tooltip for UGUI implementation.
        /// </summary>
        /// <param name="Id"></param>
        void showAdditionalTooltip2(int Id)
        {

            AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(Id);
            showAdditionalTooltip2(item);
        }

        /// <summary>
        /// Show secound additional tooltip for UGUI implementation.
        /// </summary>
        /// <param name="item"></param>
        void showAdditionalTooltip2(AtavismInventoryItem item)
        {
            // Debug.LogError("showAdditionalTooltip2");

            // string defaultColor = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(UGUITooltip.Instance.defaultTextColour.r), ToByte(UGUITooltip.Instance.defaultTextColour.g), ToByte(UGUITooltip.Instance.defaultTextColour.b));


#if AT_I2LOC_PRESET
        UGUITooltip.Instance.SetAdditionalTitle2((item.enchantLeval > 0?" +"+ item.enchantLeval : "")+" "+I2.Loc.LocalizationManager.GetTranslation("Items/"+item.name));
#else
            UGUITooltip.Instance.SetAdditionalTitle2((item.enchantLeval > 0 ? " +" + item.enchantLeval : "") + " " + item.name);
#endif
            if (item.Icon != null)
            {
                UGUITooltip.Instance.SetAdditionalIcon2(item.Icon);
            }
            UGUITooltip.Instance.SetAdditionalQuality2(item.quality);
            UGUITooltip.Instance.SetAdditionalTitleColour2(AtavismSettings.Instance.ItemQualityColor(item.quality));
            string slotName = Inventory.Instance.GetItemByTemplateID(item.TemplateId).slot;
           
            if (item.itemType == "Tool")
            {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
      		    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2(slotName, "", true);
                UGUITooltip.Instance.SetAdditionalType2(item.itemType);
              
#endif
            }
            else  if (item.itemType == "Armor")
            {/*
#if AT_I2LOC_PRESET
      		UGUITooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation("Slot") + ": "+I2.Loc.LocalizationManager.GetTranslation(slotName));
                    if(item.gear_score>0)
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UGUITooltip.Instance.SetAdditionalType2(slotName);
                if (item.gear_score > 0)
                    UGUITooltip.Instance.AddAdditionalAttribute2("Gear Score", item.gear_score.ToString(), true);
#endif
                */
                                           
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation(slotName));
#else
                UGUITooltip.Instance.SetAdditionalType2(slotName);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    string mark = "";
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                    if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                if (gear_score > item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                if (gear_score < item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                if (gear_score == item.enchantStats["gearScore"])
                                    mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score")+" "+mark, textDamage, true);
#else
                   
                        UGUITooltip.Instance.AddAdditionalAttribute2("Gear Score " + mark, textDamage, true);
#endif


                }
            }
            else if (item.itemType == "Weapon")
            {
                                           
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType2(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UGUITooltip.Instance.SetAdditionalType2(" " + item.subType);
                UGUITooltip.Instance.AddAdditionalAttribute2(slotName, "", true);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    string mark = "";
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                    if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                            else
                            {
                                    if (gear_score > item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (gear_score < item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (gear_score == item.enchantStats["gearScore"])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                            }
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score")+" "+mark, textDamage, true);
#else
                   
                        UGUITooltip.Instance.AddAdditionalAttribute2("Gear Score " + mark, textDamage, true);
#endif


                }
                /*
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType2(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
                 if(item.gear_score>0)
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UGUITooltip.Instance.SetAdditionalType2(" " + item.subType);
                UGUITooltip.Instance.AddAdditionalAttribute2(slotName, "", true);
                if (item.gear_score > 0)
                    UGUITooltip.Instance.AddAdditionalAttribute2("Gear Score", item.gear_score.ToString(), true);
#endif*/
            }
            else
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
#else
                UGUITooltip.Instance.SetAdditionalType2(item.itemType);
#endif
            }
            UGUITooltip.Instance.SetAdditionalTypeColour2(UGUITooltip.Instance.itemTypeColour);
            if (item.Weight > 0)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalWeight2(I2.Loc.LocalizationManager.GetTranslation("Weight")+": " + item.Weight + "(" + (item.Weight * item.count) + ")");
#else
                UGUITooltip.Instance.SetAdditionalWeight2("Weight: " + item.Weight + " (" + (item.Weight * item.count) + ")");
#endif
            }
            else
            {
                UGUITooltip.Instance.SetAdditionalWeight2("");
            }
            if (item.itemType == "Weapon" || item.itemEffectTypes.Contains("Stat"))
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
#if AT_I2LOC_PRESET
        UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Stats"), UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Stats", UGUITooltip.Instance.itemSectionTitleColour);
#endif
            }
         
            if (item.itemType == "Weapon")
            {
               
                string textDamage = item.damageValue.ToString();
                string mark = "";
                if (item.damageMaxValue - item.damageValue > 0)
                    textDamage += " - " + item.damageMaxValue.ToString();


                if (item.enchantStats.ContainsKey("dmg-base"))
                    if ((item.damageMaxValue + item.damageValue) / 2 - (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 != 0)
                        textDamage += " (" + ((item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 - (item.damageMaxValue + item.damageValue) / 2) + ")";
                if (item.itemType == "Weapon" || item.itemType == "Armor")
                   
                    if (enchantStats.ContainsKey("dmg-base"))
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                        else
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                    }
                    else
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                        else
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if ((damageMaxValue + damageValue) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                    }
               
                string textSpeed = ((float)item.weaponSpeed / 1000).ToString();
                string mark2 = "";

                if (item.itemType == "Weapon" || item.itemType == "Armor")
                   
                    if (item.weaponSpeed < weaponSpeed)
                        mark2 += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                if (item.weaponSpeed > weaponSpeed)
                    mark2 += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                if (item.weaponSpeed == weaponSpeed)
                    mark2 += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
               
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage")) + " "+mark,  textDamage, true);
            UGUITooltip.Instance.AddAdditionalAttribute2(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("attack_speed")) + " "+mark2,  textSpeed, true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2("Damage " + mark, textDamage, false, UGUITooltip.Instance.itemTypeColour);
                UGUITooltip.Instance.AddAdditionalAttribute2("Speed " + mark2, textSpeed, false, UGUITooltip.Instance.itemTypeColour);
#endif
            }

            List<string> additonalStats = new List<string>();

            foreach (string st in item.enchantStats.Keys)
            {
                if (!item.itemEffectNames.Contains(st) && !additonalStats.Contains(st))
                {
                    // Debug.LogError("Stat " + st);
                    additonalStats.Add(st);
                }
            }
            foreach (int statPos in item.GetEffectPositionsOfTypes("Stat"))
            {

                string statName = item.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                string[] statNames = statName.Split('_');
                if (statNames.Length > 1)
                {
                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                }
                else
                {
                    statName = FirstCharToUpper(statNames[0]);
                }
#endif
                //    colour = UGUITooltip.Instance.defaultTextColour;
                string textParam = "";
                if (int.Parse(item.itemEffectValues[statPos]) != 0)
                    textParam = item.itemEffectValues[statPos] + " ";
                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) - item.enchantStats[item.itemEffectNames[statPos]] != 0)
                        textParam += "(" + (item.enchantStats[item.itemEffectNames[statPos]]) + ")";
                string mark = "";

                bool printStat = false;
                if (textParam.Length > 0)
                    printStat = true;
                if ((item.itemType == "Weapon" || item.itemType == "Armor") && (itemType == item.itemType))
                {
                 
                    if (itemEffectNames.Contains(item.itemEffectNames[statPos]))
                        if (itemEffectNames.Contains(item.itemEffectNames[statPos]))
                        {

                            int itemStatIndex = itemEffectNames.IndexOf(item.itemEffectNames[statPos]);
                        
                            if (enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                            {
                                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                            else
                            {
                                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]))
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]))
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]))
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]))
                                        mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]))
                                        mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                                    if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]))
                                        mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                                }
                            }
                           
                        }
                        else
                        {
                            mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                            ;
                        }

                }
                if (!string.IsNullOrEmpty(item.itemEffectValues[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) > 0)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2(statName + "  " + mark, textParam, false);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) < 0)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2(statName + "  " + mark, textParam, false);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) == 0 && printStat)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2(statName + "  " + mark, textParam, false);
                    }

            }
            //<sprite=1>
            //add stats from equiped items thats not in check item
            foreach (string addStatName in additonalStats)
            {
                bool printStat = false;
                string textParam = "";
                string mark = "";
                if (!addStatName.Equals("dmg-base") && !addStatName.Equals("dmg-max") && !addStatName.Equals("gearScore"))
                {
                    printStat = true;
                    textParam = "(" + item.enchantStats[addStatName] + ")";
                   
                    if (item.itemEffectNames.Contains(addStatName))
                    {
                        int itemStatIndex = item.itemEffectNames.IndexOf(addStatName);
   
                        if (item.enchantStats.ContainsKey(addStatName))
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] < enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] > enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] == enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";

                        }
                        else
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) < enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.lowerSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) > enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.greaterSpriteId + ">";
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) == enchantStats[addStatName])
                                mark += "<sprite=" + UGUITooltip.Instance.equalSpriteId + ">";
                        }
                    }
                    else
                    {
                        mark += "<sprite=" + UGUITooltip.Instance.newSpriteId + ">";
                        ;
                    }
                  
                }
                if (printStat)
                {
#if AT_I2LOC_PRESET
                string _addStatName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(addStatName));
#else
                    string[] statNames = addStatName.Split('_');
                    string _addStatName = FirstCharToUpper(statNames[0]);
                    if (statNames.Length > 1)
                    {
                        _addStatName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                    }
#endif
                    UGUITooltip.Instance.AddAdditionalAttribute2(_addStatName + mark, textParam, false);
                }
            }

            //Add Effects and Abilities for Enchants
            if (item.enchantLeval > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Enchant Effects", UGUITooltip.Instance.itemSectionTitleColour);

                foreach (KeyValuePair<int, int> effects in item.enchantEffects)
                {
                    AtavismEffect effect = Abilities.Instance.GetEffect(effects.Key);
                    if (effects.Value > 1)
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(effect.name + " x " + effects.Value + "\n" + effect.tooltip, effect.Icon, false);
                    else
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                }
                foreach (KeyValuePair<int, int> abilities in item.enchantAbilities)
                {
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilities.Key);
                    if (abilities.Value > 1)
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(ability.name + " x " + abilities.Value + "\n" + ability.tooltip, ability.Icon, false);
                    else
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketEffect").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Effects ", UGUITooltip.Instance.itemSectionTitleColour);

                //Add Effects and Abilities for socket items
                foreach (int effectPos in item.GetEffectPositionsOfTypes("SocketEffect"))
                {
                    int effectID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                    if (effect != null)
                    {
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                    }
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketAbility").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Abilities ", UGUITooltip.Instance.itemSectionTitleColour);

                foreach (int effectPos in GetEffectPositionsOfTypes("SocketAbility"))
                {
                    int abilityID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                    if (ability != null)
                    {
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                    }
                }
            }

            if (item.socketSlots.Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
                foreach (string key in item.socketSlots.Keys)
                {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Sockets of")+" " + I2.Loc.LocalizationManager.GetTranslation(key), UGUITooltip.Instance.itemSectionTitleColour);
#else
                    UGUITooltip.Instance.AddAdditionalAttributeTitle2("Sockets of " + key, UGUITooltip.Instance.itemSectionTitleColour);
#endif
                    foreach (int it in item.socketSlots[key].Keys)
                    {
                        //  Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]);
                        if (item.socketSlots[key][it] > 0)
                        {
                            AtavismInventoryItem aii = Inventory.Instance.GetItemByTemplateID(item.socketSlots[key][it]);
                            if (aii == null)
                            {
#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                                UGUITooltip.Instance.AddAdditionalAttributeSocket2("Empty", null, false);
#endif
                                continue;
                            }
                            string socketStat = "";
                            foreach (int statPos in aii.GetEffectPositionsOfTypes("Stat"))
                            {
                                //Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]+" Stat pos:"+ statPos+ " count:"+itemEffectNames.Count);

                                string statName = aii.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                                string[] statNames = statName.Split('_');
                                if (statNames.Length > 1)
                                {
                                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                                }
                                else
                                {
                                    statName = FirstCharToUpper(statNames[0]);
                                }
#endif
                                socketStat += statName + " " + (int.Parse(aii.itemEffectValues[statPos]) > 0 ? "+" + aii.itemEffectValues[statPos] : int.Parse(aii.itemEffectValues[statPos]) < 0 ? "-" + aii.itemEffectValues[statPos] : "0") + "\n";
                            }

                            //Add Effects and Abilities for sockets
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketEffect"))
                            {
                                int effectID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                                if (effect != null)
                                {
                                    //UGUITooltip.Instance.AddAttributeSocket(effect.name, effect.icon, false);
                                    socketStat += effect.name + "\n" + effect.tooltip;
                                }
                            }
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketAbility"))
                            {
                                int abilityID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                                if (ability != null)
                                {
                                    //UGUITooltip.Instance.AddAttributeSocket(ability.name, ability.icon, false);
                                    socketStat += ability.name + "\n" + ability.tooltip;
                                }
                            }
                            UGUITooltip.Instance.AddAdditionalAttributeSocket2(socketStat, aii.Icon, false);

                        }
                        else
                        {
#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAdditionalAttributeSocket2(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                            UGUITooltip.Instance.AddAdditionalAttributeSocket2("Empty", null, false);
#endif
                        }
                    }
                }
            }
            if (item.setId > 0)
            {
                AtavismInventoryItemSet aiis = Inventory.Instance.GetItemBySetID(item.setId);
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Set Effects")+" "+I2.Loc.LocalizationManager.GetTranslation(aiis.Name),UGUITooltip.Instance.itemSectionTitleColour);
#else
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Set Effects " + aiis.Name, UGUITooltip.Instance.itemSectionTitleColour);
#endif

                foreach (AtavismInventoryItemSetLevel level in aiis.levelList)
                {
                    Color setColor = UGUITooltip.Instance.itemSetColour;
                    Color setTitleColor = UGUITooltip.Instance.itemSectionTitleColour;
                    if (item.setCount < level.NumerOfParts)
                    {
                        setColor = UGUITooltip.Instance.itemInactiveSetColour;
                        setTitleColor = UGUITooltip.Instance.itemInactiveSetColour;

                    }
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Set")+" "+level.NumerOfParts+" "+I2.Loc.LocalizationManager.GetTranslation("parts"),setTitleColor);
#else
                    UGUITooltip.Instance.AddAdditionalAttributeTitle2("Set " + level.NumerOfParts + " parts", setTitleColor);
#endif
                    if (level.DamageValue != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
                    statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValue > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.DamageValue.ToString(), false, setColor);
                        if (level.DamageValue < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.DamageValue.ToString(), false, setColor);
                    }

                    if (level.DamageValuePercentage != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
                    statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValuePercentage > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                        if (level.DamageValuePercentage < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                    }


                    for (int k = 0; k < level.itemStatName.Count; k++)
                    {
                        string statName = level.itemStatName[k];
#if AT_I2LOC_PRESET
                    statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (level.itemStatValues[k] > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValues[k] < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValuesPercentage[k] > 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                        if (level.itemStatValuesPercentage[k] < 0)
                            UGUITooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                    }

                    //Add Effects and Abilities
                    if (level.itemEffects != null)
                    {
                        foreach (int ef in level.itemEffects)
                        {
                            AtavismEffect effect = Abilities.Instance.GetEffect(ef);
                            if (effect != null)
                            {
                                UGUITooltip.Instance.AddAdditionalAttribute2(effect.name, effect.tooltip, true, setColor);
                            }
                        }
                    }

                    if (level.itemAbilities != null)
                    {
                        foreach (int ab in level.itemAbilities)
                        {
                            AtavismAbility ability = Abilities.Instance.GetAbility(ab);
                            if (ability != null)
                            {
                                UGUITooltip.Instance.AddAdditionalAttribute2(ability.name, ability.tooltip, true, setColor);
                            }
                        }
                    }

                }
            }


            UGUITooltip.Instance.AddAdditionalAttributeSeperator2();

            if (item.itemReqTypes.Count > 0)

                for (int r = 0; r < item.itemReqTypes.Count; r++)
                {
                    if (item.itemReqTypes[r].Equals("Level"))
                    {
                        if ((int)ClientAPI.GetPlayerObject().GetProperty("level") < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") + " ",  item.itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Level ", itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") + " ",  item.itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Level ", item.itemReqValues[r], true);
#endif
                    }


                    if (item.itemReqTypes[r].Equals("Class"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("aspect")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredClass"), I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]), true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Class ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredClass"), I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r] ), true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Class", item.itemReqNames[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif

                    }
                    if (item.itemReqTypes[r].Equals("Race"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("race")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredRace"), I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r] ), true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Race ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Race ", item.itemReqNames[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Skill Level"))
                    {


                        if (Skills.Instance.GetPlayerSkillLevel(item.itemReqNames[r]) < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]),  item.itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required " + item.itemReqNames[r], item.itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]), item.itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required " + item.itemReqNames[r], item.itemReqValues[r], true);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Stat"))
                    {
                        int val = 0;
                        if (ClientAPI.GetPlayerObject().PropertyExists(item.itemReqNames[r]))
                        {
                            val = (int)ClientAPI.GetPlayerObject().GetProperty(item.itemReqNames[r]);
                        }

                        string statName = item.itemReqNames[r];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (val < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ statName ,  item.itemReqValues[r] , true,UGUITooltip.Instance.itemStatLowerColour);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required " + statName, item.itemReqValues[r], true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+statName ,  item.itemReqValues[r] , true);
#else
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required " + statName, item.itemReqValues[r], true);
#endif
                    }
                }

            if (item.Unique)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Unique"),"",true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2("Unique", "", true);
#endif
            }


            if (item.isBound)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Soulbound"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2("Soulbound", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
            }
            else if (item.binding > 0)
            {
                if (item.binding == 1)
                {
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnEquip"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute2("Soulbound On Equip", "", true);
#endif
                }
                else if (item.binding == 2)
#if AT_I2LOC_PRESET
                UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnPickup"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute2("Soulbound On Pickup", "", true);
#endif
            }
            if (item.sellable)
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Sellable"), "", true);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2("Sellable", "", true);
#endif
            }
            else
            {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Not Sellable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2("Not Sellable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif

            }
            if ((item.itemType == "Weapon" || item.itemType == "Armor"))
                if (item.enchantId > 0)
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Enchantable"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute2("Enchantable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Not Enchantable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute2("Not Enchantable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif

                }
            if (item.maxDurability > 0)
            {
#if AT_I2LOC_PRESET
             UGUITooltip.Instance.AddAdditionalAttribute2( I2.Loc.LocalizationManager.GetTranslation("Durability")+" ", item.durability + "/" + item.maxDurability, true, UGUITooltip.Instance.itemTypeColour);
#else
                UGUITooltip.Instance.AddAdditionalAttribute2(" Durability", item.durability + "/" + item.maxDurability, true, UGUITooltip.Instance.itemTypeColour);
#endif
                if (item.repairable)
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Repairable"), "", true);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute2("Repairable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Not Repairable"), "", true,UGUITooltip.Instance.itemStatLowerColour);
#else
                    UGUITooltip.Instance.AddAdditionalAttribute2("Not Repairable", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                }
            }
            if (item.GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int templateId = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("ClaimObject")[0]]);
                AtavismBuildObjectTemplate abot = WorldBuilder.Instance.GetBuildObjectTemplate(templateId);
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Claim Object")+" : " + I2.Loc.LocalizationManager.GetTranslation(abot.buildObjectName));
            UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Claim type") + " : " + I2.Loc.LocalizationManager.GetTranslation(abot.validClaimTypes.ToString()));
            UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int i = 0; i < abot.itemsReq.Count; i++)
            {
                AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                UGUITooltip.Instance.AddAdditionalAttributeResource2(I2.Loc.LocalizationManager.GetTranslation(itemc.name), abot.itemsReqCount[i].ToString(),itemc.Icon,false);
            }
            UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
            if (abot.skill > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation("Skill") + " " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname), abot.skillLevelReq.ToString(),true);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+" " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname),  abot.skillLevelReq.ToString() ,true, UGUITooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                }
            }
            if (!abot.reqWeapon.Equals("~ none ~"))
            {
                if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"), I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true);
                else
                    UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"),  I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon) ,true, UGUITooltip.Instance.itemStatLowerColour);
            }
#else
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Claim Object : " + abot.buildObjectName);
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Claim type : " + abot.validClaimTypes);
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Resources : ");
                for (int i = 0; i < abot.itemsReq.Count; i++)
                {
                    AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                    UGUITooltip.Instance.AddAdditionalAttributeResource2(itemc.name, abot.itemsReqCount[i].ToString(), itemc.Icon, false);
                }
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
                if (abot.skill > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true, UGUITooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                    }
                }
                if (!abot.reqWeapon.Equals("~ none ~"))
                {
                    if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                        UGUITooltip.Instance.AddAdditionalAttribute2("Required equiped weapon type: ", abot.reqWeapon, true);
                    else
                        UGUITooltip.Instance.AddAdditionalAttribute2("Required equiped weapon type:", abot.reqWeapon, true, UGUITooltip.Instance.itemStatLowerColour);
                }
#endif
                UGUITooltip.Instance.SetAdditionalDescription2(tooltipDescription);
            }
            else if (item.GetEffectPositionsOfTypes("CraftsItem").Count > 0)
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();

#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int craftingRecipeID = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("CraftsItem")[0]]);
                AtavismCraftingRecipe recipe = Inventory.Instance.GetCraftingRecipe(craftingRecipeID);
                // Crafts <item>
                AtavismInventoryItem itemCrafted = Inventory.Instance.GetItemByTemplateID(recipe.createsItems[0]);
#if AT_I2LOC_PRESET
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Crafts"), itemCrafted.name, true);
            UGUITooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int r = 0; r < recipe.itemsReq.Count; r++)
            {
                 AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
               UGUITooltip.Instance.AddAdditionalAttributeResource2(I2.Loc.LocalizationManager.GetTranslation("Items/" + it.name), recipe.itemsReqCounts[r].ToString(),it.Icon, false);
            }
            UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
            UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Station"), recipe.stationReq, true);
            if (recipe.skillID > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required")+" "+ I2.Loc.LocalizationManager.GetTranslation("Skill")+" "+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname), recipe.skillLevelReq.ToString(), true);
                    }
                    else
                    {
                        UGUITooltip.Instance.AddAdditionalAttribute2( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+""+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname) ,  recipe.skillLevelReq.ToString() , true, UGUITooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                }
            }
          
#else
                UGUITooltip.Instance.AddAdditionalAttribute2("Crafts", itemCrafted.name, true);
                UGUITooltip.Instance.AddAdditionalAttributeTitle2("Resources : ");
                for (int r = 0; r < recipe.itemsReq.Count; r++)
                {
                    AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                    UGUITooltip.Instance.AddAdditionalAttributeResource2(it.name, recipe.itemsReqCounts[r].ToString(), it.Icon, false);

                }
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
                UGUITooltip.Instance.AddAdditionalAttribute2("Required Station", recipe.stationReq, true);
                if (recipe.skillID > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UGUITooltip.Instance.AddAdditionalAttribute2("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true, UGUITooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                    }
                }
#endif

                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();
                UGUITooltip.Instance.SetAdditionalDescription2(tooltipDescription);
            //    showAdditionalTooltip2(recipe.createsItems[0]);
            }
            else
            {
                UGUITooltip.Instance.AddAdditionalAttributeSeperator2();

#if AT_I2LOC_PRESET
            UGUITooltip.Instance.SetAdditionalDescription2(I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip));
#else
                UGUITooltip.Instance.SetAdditionalDescription2(item.tooltip);
#endif
            }
            //check ability ie learned
            if (item.GetEffectPositionsOfTypes("UseAbility").Count > 0)
            {
                if (item.name.IndexOf("TeachAbility") > -1)
                {
                    int abilityID = int.Parse(item.itemEffectNames[item.GetEffectPositionsOfTypes("UseAbility")[0]]);
                    AtavismAbility aa = Abilities.Instance.GetAbility(abilityID);
                    AtavismAbility paa = Abilities.Instance.GetPlayerAbility(abilityID);
                    if (paa != null)
                    {

#if AT_I2LOC_PRESET
                        UGUITooltip.Instance.AddAdditionalAttribute2( I2.Loc.LocalizationManager.GetTranslation("taught") , "", true, UGUITooltip.Instance.itemStatLowerColour);
#else
                        UGUITooltip.Instance.AddAdditionalAttribute2("Taught", "", true, UGUITooltip.Instance.itemStatLowerColour);
#endif
                    }
                    aa.ShowAdditionalTooltip2();
                }
            }
            UGUITooltip.Instance.ShowAdditionalTooltip2();
        }


        /// <summary>
        /// Shows the tooltip for UI Elements implementation.
        /// </summary>
        /// <param name="target">Target.</param>
        public void ShowUITooltip(VisualElement target)
        {
            //  string defaultColor = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(UIAtavismTooltip.Instance.defaultTextColour.r), ToByte(UIAtavismTooltip.Instance.defaultTextColour.g), ToByte(UIAtavismTooltip.Instance.defaultTextColour.b));
            List<AtavismInventoryItem> items = new List<AtavismInventoryItem>();
            string slotName = Inventory.Instance.GetItemByTemplateID(TemplateId).slot;
           // Debug.LogError("Tooltip "+slotName);
            foreach (AtavismInventoryItem item in Inventory.Instance.EquippedItems.Values)
            {
                if (item.itemId != itemId)
                {
                    if (Inventory.Instance.itemGroupSlots.ContainsKey(slotName))
                    {
                       // Debug.LogError(" found Group "+slotName+" GS:"+Inventory.Instance.itemGroupSlots[slotName]);
                        foreach (var s in Inventory.Instance.itemGroupSlots[slotName].slots)
                        {
                           // Debug.LogError(" Group Slot "+s.name+" | "+slotName);

                            if (s.name.ToLower() == item.slot.ToLower())
                            {// Debug.LogError(" add items "+item.itemId);
                                items.Add(item);
                            }
                        }

                      /*  if (item.slot.ToLower() == slotName.ToLower())
                        { //Debug.LogError(" add items "+item.itemId);
                            items.Add(item);
                        }*/
                    }
                    else
                    {
                        if (item.slot.ToLower() == slotName.ToLower())
                        {
                            //Debug.LogError(" add items "+item.itemId);
                            items.Add(item);
                        }
                    }
                }

            }

#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.SetTitle((enchantLeval > 0?" +"+ enchantLeval : "")+" "+I2.Loc.LocalizationManager.GetTranslation("Items/"+name));
#else
            UIAtavismTooltip.Instance.SetTitle((enchantLeval > 0 ? " +" + enchantLeval : "") + " " + name);
#endif
            if (Icon != null)
            {
                UIAtavismTooltip.Instance.SetIcon(Icon);
            }
            //UIAtavismTooltip.Instance.SetQuality(quality);
            UIAtavismTooltip.Instance.SetQualityColor(AtavismSettings.Instance.ItemQualityColor(quality));
            UIAtavismTooltip.Instance.SetTitleColour(AtavismSettings.Instance.ItemQualityColor(quality));
           
          //  Debug.LogError("Tooltip "+name+" "+slotName+" "+itemType);
            if (itemType == "Tool")
            {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.SetType(I2.Loc.LocalizationManager.GetTranslation(itemType));
      		    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UIAtavismTooltip.Instance.AddAttribute(slotName, "", true);
                UIAtavismTooltip.Instance.SetType(itemType);
              
#endif
            }
            else if (itemType == "Armor")
            {
#if AT_I2LOC_PRESET
      		UIAtavismTooltip.Instance.SetType(I2.Loc.LocalizationManager.GetTranslation("Slot") + ": "+I2.Loc.LocalizationManager.GetTranslation(slotName));
#else
                UIAtavismTooltip.Instance.SetType(slotName);
#endif

                if (gear_score > 0)
                {
                    string textDamage = gear_score.ToString();
                    int mark1 = 99;
                    int mark2 = 99;
                    if (enchantStats.ContainsKey("gearScore"))
                    {
                        if (gear_score - enchantStats["gearScore"] != 0)
                            textDamage += " (" + (enchantStats["gearScore"] - gear_score) + ")";

                    }

                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.gear_score > 0)
                        {
                            if (item.enchantStats.ContainsKey("gearScore"))
                            {
                                if (enchantStats.ContainsKey("gearScore"))
                                {
                                    if (item.enchantStats["gearScore"] > enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (item.enchantStats["gearScore"] < enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (item.enchantStats["gearScore"] == enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                            }
                            else
                            {
                                if (enchantStats.ContainsKey("gearScore"))
                                {
                                    if (gear_score > enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (gear_score < enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (gear_score == enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
#if AT_I2LOC_PRESET
                 if(gear_score>0)
                    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), textDamage, true, mark1, mark2);
#else
                    if (gear_score > 0)
                        UIAtavismTooltip.Instance.AddAttribute("Gear Score" , textDamage, true, mark1, mark2);
#endif


                }

            }
            else if (itemType == "Weapon")
            {

#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetType(" "+I2.Loc.LocalizationManager.GetTranslation(subType));
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UIAtavismTooltip.Instance.SetType(" " + subType);
                UIAtavismTooltip.Instance.AddAttribute(slotName, "", true);
#endif

                if (gear_score > 0)
                {
                    string textDamage = gear_score.ToString();
                    int mark1 = 99;
                    int mark2 = 99;
                    if (enchantStats.ContainsKey("gearScore"))
                    {
                        if (gear_score - enchantStats["gearScore"] != 0)
                            textDamage += " (" + (enchantStats["gearScore"] - gear_score) + ")";

                    }

                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.gear_score > 0)
                        {
                            if (item.enchantStats.ContainsKey("gearScore")){
                            
                                if(enchantStats.ContainsKey("gearScore")){
                                if (item.enchantStats["gearScore"] > enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (item.enchantStats["gearScore"] < enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (item.enchantStats["gearScore"] == enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                                }
                            }
                            else
                            {
                                if (enchantStats.ContainsKey("gearScore"))
                                {
                                    if (gear_score > enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (gear_score < enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (gear_score == enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;                                }
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
#if AT_I2LOC_PRESET
                 if(gear_score>0)
                    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), textDamage, true, mark1, mark2);
#else
                    if (gear_score > 0)
                        UIAtavismTooltip.Instance.AddAttribute("Gear Score" , textDamage, true, mark1, mark2);
#endif


                }



            }
            else
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetType(I2.Loc.LocalizationManager.GetTranslation(itemType));
#else
                UIAtavismTooltip.Instance.SetType(itemType);
#endif
            }
            if (itemType == "Bag")
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Number of Slots"),stackLimit.ToString(),true);
#else
                UIAtavismTooltip.Instance.AddAttribute("Number of Slots", stackLimit.ToString(), true);
#endif
            }
            UIAtavismTooltip.Instance.SetTypeColour(UIAtavismTooltip.Instance.itemTypeColour);
            if (Weight > 0)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetWeight(I2.Loc.LocalizationManager.GetTranslation("Weight")+": " + Weight + "(" + (Weight*count) + ")");
#else
                UIAtavismTooltip.Instance.SetWeight("Weight: " + Weight + " (" + (Weight * count) + ")");
#endif
            }
            else
            {
                UIAtavismTooltip.Instance.SetWeight("");
            }
            if (itemType == "Weapon" || itemEffectTypes.Contains("Stat"))
            {
                UIAtavismTooltip.Instance.AddAttributeSeperator();
#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Stats"), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAttributeTitle("Stats", UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
            }
            //Color colour = UIAtavismTooltip.Instance.defaultTextColour;
            // string defaultColourText = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(colour.r), ToByte(colour.g), ToByte(colour.b));
            if (itemType == "Weapon")
            {
                // string colourText = "";
                //  colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textDamage = damageValue.ToString();
                int mark1 = 99;
                int mark2 = 99;
                if (damageMaxValue - damageValue > 0)
                    textDamage += " - " + damageMaxValue.ToString();


                if (enchantStats.ContainsKey("dmg-base"))
                    if ((damageMaxValue + damageValue) / 2 - (enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 != 0)
                        textDamage += " (" + ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 - (damageMaxValue + damageValue) / 2) + ")";
                if (itemType == "Weapon" || itemType == "Armor")
                {
                    foreach (AtavismInventoryItem item in items)
                    {
                        if (enchantStats.ContainsKey("dmg-base"))
                        {
                            if (item.enchantStats.ContainsKey("dmg-base"))
                            {
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                            else
                            {
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                        }
                        else
                        {
                            if (item.enchantStats.ContainsKey("dmg-base"))
                            {
                                if ((damageMaxValue + damageValue) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if ((damageMaxValue + damageValue) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if ((damageMaxValue + damageValue) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                            else
                            {
                                if ((damageMaxValue + damageValue) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if ((damageMaxValue + damageValue) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if ((damageMaxValue + damageValue) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                        }
                    }
                }
                //  colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textSpeed = ((float)weaponSpeed / 1000).ToString();
                int mark21 = 99;
                int mark22 = 99;
                if (itemType == "Weapon" || itemType == "Armor")
                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.weaponSpeed > weaponSpeed)
                            if (mark21 == 99) mark22 = -1;
                            else mark21 = -1;
                        if (item.weaponSpeed < weaponSpeed)
                            if (mark21 == 99) mark22 = 1;
                            else mark21 = 1;
                        if (item.weaponSpeed == weaponSpeed)
                            if (mark21 == 99) mark22 = 0;
                            else mark21 = 0;
                    }
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage")),  textDamage, true, mark1, mark2);
            UIAtavismTooltip.Instance.AddAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("attack_speed")),  textSpeed, true, mark21, mark22);
#else
                UIAtavismTooltip.Instance.AddAttribute("Damage", textDamage, true, UIAtavismTooltip.Instance.itemTypeColour, mark1, mark2);
                UIAtavismTooltip.Instance.AddAttribute("Speed", textSpeed, true, UIAtavismTooltip.Instance.itemTypeColour, mark21, mark22);
#endif
            }

            List<string> additonalStats = new List<string>();

            foreach (string st in enchantStats.Keys)
            {
                if (!itemEffectNames.Contains(st) && !additonalStats.Contains(st))
                {
                    // Debug.LogError("Stat " + st);
                    additonalStats.Add(st);
                }
            }
            int ite = 0;
            if (itemType == "Weapon" || itemType == "Armor")
            {
                foreach (AtavismInventoryItem item in items)
                {
                    if (ite == 0)
                        showUIAdditionalTooltip(item);
                    else
                        showUIAdditionalTooltip2(item);
                    ite++;
                }
            }
            foreach (int statPos in GetEffectPositionsOfTypes("Stat"))
            {

                string statName = itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                string[] statNames = statName.Split('_');
                if (statNames.Length > 1)
                {
                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                }
                else
                {
                    statName = FirstCharToUpper(statNames[0]);
                }
#endif
                //   colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textParam = "";
                if (int.Parse(itemEffectValues[statPos]) != 0)
                    textParam = itemEffectValues[statPos] + " ";
                if (enchantStats.ContainsKey(itemEffectNames[statPos]))
                    if (int.Parse(itemEffectValues[statPos]) - enchantStats[itemEffectNames[statPos]] != 0)
                        textParam += "(" + (enchantStats[itemEffectNames[statPos]]) + ")";
                int mark1 = 99;
                int mark2 = 99;

                bool printStat = false;
                if (textParam.Length > 0)
                    printStat = true;
                if (itemType == "Weapon" || itemType == "Armor")
                {

                    foreach (AtavismInventoryItem item in items)
                    {

                        if (item.itemEffectNames.Contains(itemEffectNames[statPos]))
                        {

                            int itemStatIndex = item.itemEffectNames.IndexOf(itemEffectNames[statPos]);
                            if (enchantStats.ContainsKey(itemEffectNames[statPos]))
                            {
                                if (item.enchantStats.ContainsKey(itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] > int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] < int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] == int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) > int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) < int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) == int.Parse(itemEffectValues[statPos]) + enchantStats[itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                            }
                            else
                            {
                                if (item.enchantStats.ContainsKey(itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] > int.Parse(itemEffectValues[statPos]))
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] < int.Parse(itemEffectValues[statPos]))
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[itemEffectNames[statPos]] == int.Parse(itemEffectValues[statPos]))
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) > int.Parse(itemEffectValues[statPos]))
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) < int.Parse(itemEffectValues[statPos]))
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[itemStatIndex]) == int.Parse(itemEffectValues[statPos]))
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                            }

                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }

                    }
                }
                if (!string.IsNullOrEmpty(itemEffectValues[statPos]))
                    if (int.Parse(itemEffectValues[statPos]) > 0)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(statName , textParam, false, mark1, mark2);
                    }
                    else if (int.Parse(itemEffectValues[statPos]) < 0)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(statName , textParam, false, mark1, mark2);
                    }
                    else if (int.Parse(itemEffectValues[statPos]) == 0 && printStat)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(statName , textParam, false, mark1, mark2);
                    }

            }

            //add stats from equiped items thats not in check item
            foreach (string addStatName in additonalStats)
            {
                bool printStat = false;
                string textParam = "";
                int mark1 = 99;
                int mark2 = 99;
                if (!addStatName.Equals("dmg-base") && !addStatName.Equals("dmg-max") && !addStatName.Equals("gearScore"))
                {
                    printStat = true;
                    textParam = "(" + enchantStats[addStatName] + ")";
                    foreach (AtavismInventoryItem item in items)
                    {
                        if (item.itemEffectNames.Contains(addStatName))
                        {
                            int itemStatIndex = item.itemEffectNames.IndexOf(addStatName);
                            if (item.enchantStats.ContainsKey(addStatName))
                            {
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] > enchantStats[addStatName])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] < enchantStats[addStatName])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] == enchantStats[addStatName])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;

                            }
                            else
                            {
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) > enchantStats[addStatName])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) < enchantStats[addStatName])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (int.Parse(item.itemEffectValues[itemStatIndex]) == enchantStats[addStatName])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
                }
                if (printStat)
                {
#if AT_I2LOC_PRESET
                string _addStatName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(addStatName));
#else
                    string[] statNames = addStatName.Split('_');
                    string _addStatName = FirstCharToUpper(statNames[0]);
                    if (statNames.Length > 1)
                    {
                        _addStatName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                    }
#endif
                    UIAtavismTooltip.Instance.AddAttribute(_addStatName , textParam, false, mark1, mark2);
                }
            }

            //Add Effects and Abilities for Enchants
            if (enchantLeval > 0) 
            {
                UIAtavismTooltip.Instance.AddAttributeTitle("Enchant Effects", UIAtavismTooltip.Instance.itemSectionTitleColour);

                foreach (KeyValuePair<int,int> effects in enchantEffects) 
                {
                    AtavismEffect effect = Abilities.Instance.GetEffect(effects.Key);
                    if (effects.Value > 1)
                        UIAtavismTooltip.Instance.AddAttributeSocket(effect.name + " x " + effects.Value + "\n" + effect.tooltip , effect.Icon, false);
                    else
                        UIAtavismTooltip.Instance.AddAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                }
                foreach (KeyValuePair<int, int> abilities in enchantAbilities)
                {
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilities.Key);
                    if (abilities.Value > 1)
                        UIAtavismTooltip.Instance.AddAttributeSocket(ability.name + " x " + abilities.Value + "\n" + ability.tooltip, ability.Icon, false);
                    else
                        UIAtavismTooltip.Instance.AddAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                }
            }

            if (GetEffectPositionsOfTypes("SocketEffect").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAttributeTitle("Effects ", UIAtavismTooltip.Instance.itemSectionTitleColour);

                //Add Effects and Abilities for socket items
                foreach (int effectPos in GetEffectPositionsOfTypes("SocketEffect"))
                {
                    int effectID = int.Parse(itemEffectValues[effectPos]);
                    AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                    if (effect != null)
                    {
                        UIAtavismTooltip.Instance.AddAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                    }
                }
            }

            if (GetEffectPositionsOfTypes("SocketAbility").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAttributeTitle("Abilities ", UIAtavismTooltip.Instance.itemSectionTitleColour);

                foreach (int effectPos in GetEffectPositionsOfTypes("SocketAbility"))
                {
                    int abilityID = int.Parse(itemEffectValues[effectPos]);
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                    if (ability != null)
                    {
                        UIAtavismTooltip.Instance.AddAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                    }
                }
            }       

            if (socketSlots.Count > 0)
            {
                UIAtavismTooltip.Instance.AddAttributeSeperator();
                foreach (string key in socketSlots.Keys)
                {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Sockets of")+" " + I2.Loc.LocalizationManager.GetTranslation(key), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                    UIAtavismTooltip.Instance.AddAttributeTitle("Sockets of " + key, UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
                    foreach (int it in socketSlots[key].Keys)
                    {
                        //  Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]);
                        if (socketSlots[key][it] > 0)
                        {
                            AtavismInventoryItem aii = Inventory.Instance.GetItemByTemplateID(socketSlots[key][it]);
                            if (aii == null)
                            {
#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                                UIAtavismTooltip.Instance.AddAttributeSocket("Empty", null, false);
#endif
                                continue;
                            }
                            string socketStat = "";
                            foreach (int statPos in aii.GetEffectPositionsOfTypes("Stat"))
                            {
                                //Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]+" Stat pos:"+ statPos+ " count:"+itemEffectNames.Count);

                                string statName = aii.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                                string[] statNames = statName.Split('_');
                                if (statNames.Length > 1)
                                {
                                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                                }
                                else
                                {
                                    statName = FirstCharToUpper(statNames[0]);
                                }
#endif
                                socketStat += statName + " " + (int.Parse(aii.itemEffectValues[statPos]) > 0 ? "+" + aii.itemEffectValues[statPos] : int.Parse(aii.itemEffectValues[statPos]) < 0 ? "-" + aii.itemEffectValues[statPos] : "0") + "\n";
                            }

                            //Add Effects and Abilities for sockets
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketEffect")) 
                            {
                                int effectID = int.Parse(aii.itemEffectValues[effectPos]);                                
                                AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                                if (effect != null) {
                                    //UIAtavismTooltip.Instance.AddAttributeSocket(effect.name, effect.icon, false);
                                    socketStat += effect.name + "\n" + effect.tooltip;
                                }
                            }
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketAbility"))
                            {
                                int abilityID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                                if (ability != null) {
                                    //UIAtavismTooltip.Instance.AddAttributeSocket(ability.name, ability.icon, false);
                                    socketStat += ability.name + "\n" + ability.tooltip;
                                }
                            }
                            UIAtavismTooltip.Instance.AddAttributeSocket(socketStat, aii.Icon, false);
                        }
                        else
                        {
#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                            UIAtavismTooltip.Instance.AddAttributeSocket("Empty", null, false);
#endif
                        }
                    }
                }
            }
            if (setId > 0)
            {
                AtavismInventoryItemSet aiis = Inventory.Instance.GetItemBySetID(setId);
                UIAtavismTooltip.Instance.AddAttributeSeperator();
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set Effects")+" "+I2.Loc.LocalizationManager.GetTranslation(aiis.Name),UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAttributeTitle("Set Effects " + aiis.Name, UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif

                foreach (AtavismInventoryItemSetLevel level in aiis.levelList)
                {
                    Color setColor = UIAtavismTooltip.Instance.itemSetColour;
                    Color setTitleColor = UIAtavismTooltip.Instance.itemSectionTitleColour;
                    if (setCount < level.NumerOfParts)
                    {
                        setColor = UIAtavismTooltip.Instance.itemInactiveSetColour;
                        setTitleColor = UIAtavismTooltip.Instance.itemInactiveSetColour;

                    }
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set")+" "+level.NumerOfParts+" "+I2.Loc.LocalizationManager.GetTranslation("parts"),setTitleColor);
#else
                    UIAtavismTooltip.Instance.AddAttributeTitle("Set " + level.NumerOfParts + " parts", setTitleColor);
#endif
                    if (level.DamageValue != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValue > 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "+" + level.DamageValue.ToString(), false, setColor);
                        if (level.DamageValue < 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "-" + level.DamageValue.ToString(), false, setColor);
                    }
                    if (level.DamageValuePercentage != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValuePercentage > 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "+" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                        if (level.DamageValuePercentage < 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "-" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                    }

                    for (int k = 0; k < level.itemStatName.Count; k++)
                    {
                        string statName = level.itemStatName[k];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (level.itemStatValues[k] > 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "+" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValues[k] < 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "-" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValuesPercentage[k] > 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "+" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                        if (level.itemStatValuesPercentage[k] < 0)
                            UIAtavismTooltip.Instance.AddAttribute(statName, "-" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                    }

                    //Add Effects and Abilities
                    if (level.itemEffects != null)
                    {
                        foreach (int ef in level.itemEffects)
                        {
                            AtavismEffect effect = Abilities.Instance.GetEffect(ef);
                            if (effect != null)
                            {
                                UIAtavismTooltip.Instance.AddAttribute(effect.name, effect.tooltip, true, setColor);
                            }
                        }
                    }

                    if (level.itemAbilities != null)
                    {
                        foreach (int ab in level.itemAbilities)
                        {
                            AtavismAbility ability = Abilities.Instance.GetAbility(ab);
                            if (ability != null)
                            {
                                UIAtavismTooltip.Instance.AddAttribute(ability.name, ability.tooltip, true, setColor);
                            }
                        }
                    }
                }
            }
            foreach (int statPos in GetEffectPositionsOfTypes("TalentPoints"))
            {
                string statValue = itemEffectValues[statPos];
                string statName = "Talent Points";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));

#else
                //statName += ((int.Parse(vals[0])!=0)?" "+vals[0]:"")+ ((float.Parse(vals[1]) != 0) ? " " + vals[1]+"%" : "");
#endif
                if (int.Parse(statValue) != 0)
                    UIAtavismTooltip.Instance.AddAttribute(statName, statValue, false);
            }
            foreach (int statPos in GetEffectPositionsOfTypes("SkillPoints"))
            {
                string statValue = itemEffectValues[statPos];
                string statName = "Skill Points";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));

#else
                //statName += ((int.Parse(vals[0])!=0)?" "+vals[0]:"")+ ((float.Parse(vals[1]) != 0) ? " " + vals[1]+"%" : "");
#endif
                if (int.Parse(statValue) != 0)
                    UIAtavismTooltip.Instance.AddAttribute(statName, statValue, false);
            }

            UIAtavismTooltip.Instance.AddAttributeSeperator();
            bool bonus = false;
            if (GetEffectPositionsOfTypes("Bonus").Count>0)
            {
#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Bonuses"), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAttributeTitle("Bonuses", UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
            }

            foreach (int statPos in GetEffectPositionsOfTypes("Bonus"))
            {
                bonus = true;
                string statName = itemEffectNames[statPos];
                string statValue = itemEffectValues[statPos];
             //   Debug.LogError(statName+" "+ statValue);
                string[] vals = statValue.Split('|');
            //    Debug.LogError(statName + " " + vals[0]+" : "+vals[1]+" : "+vals[2]);
                if(vals.Length>2)
                statName = vals[2];

#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));

#else
                //statName += ((int.Parse(vals[0])!=0)?" "+vals[0]:"")+ ((float.Parse(vals[1]) != 0) ? " " + vals[1]+"%" : "");
#endif
                if (int.Parse(vals[0]) != 0)
                    UIAtavismTooltip.Instance.AddAttribute(statName, vals[0], false);
                if (float.Parse(vals[1]) != 0)
                    UIAtavismTooltip.Instance.AddAttribute(statName, vals[1]+"%", false);

            }
            if (bonus)
                UIAtavismTooltip.Instance.AddAttributeSeperator();


            bool vip = false;
            if (GetEffectPositionsOfTypes("VipPoints").Count > 0 || GetEffectPositionsOfTypes("VipTime").Count > 0)
            {
#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Vip"), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAttributeTitle("Vip", UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
            }

            foreach (int statPos in GetEffectPositionsOfTypes("VipPoints"))
            {
                vip = true;
                string statName = itemEffectNames[statPos];
                string statValue = itemEffectValues[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("VipPoints"));
#else
                statName = "Vip Points";
#endif
                if (int.Parse(statValue) != 0)
                    UIAtavismTooltip.Instance.AddAttribute(statName, statValue, false);
             

            }
         
            foreach (int statPos in GetEffectPositionsOfTypes("VipTime"))
            {
                vip = true;
                string statName = itemEffectNames[statPos];
                string statValue = itemEffectValues[statPos];

#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("VipTime"));
#else
                statName = "Vip Time";
#endif
                if (int.Parse(statValue) != 0)
                {
                    int time = int.Parse(statValue)*60;
                    int days = 0;
                    int hours = 0;
                    int minutes = 0;
                    if (time > 86400)
                    {
                        days = (int)time / 86400;
                        time -= days * 86400;
                    }
                    if (time > 3600)
                    {
                        hours = (int)time / 3600;
                        time -= hours * 3600;
                    }
                    if (time > 60)
                    {
                        minutes = (int)time / 60;
                        time = minutes * 60;
                    }
                    if (days > 0)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(statName , days + " days", false);
                    }
                    else if (hours > 0)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(statName,  hours + " hour", false);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAttribute(statName,  minutes + " minutes", false);
                    }
                }

            }
            if (vip)
                UIAtavismTooltip.Instance.AddAttributeSeperator();


            if (itemReqTypes.Count > 0)


                for (int r = 0; r < itemReqTypes.Count; r++)
                {
                    if (itemReqTypes[r].Equals("Level"))
                    {
                        if ((int)ClientAPI.GetPlayerObject().GetProperty("level") < int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel"),itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required Level ", itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel"),  itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required Level ", itemReqValues[r], true);
#endif
                    }

                    if (itemReqTypes[r].Equals("Class"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("aspect")) == int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r] ), true);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required Class ", itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]) , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required Class", itemReqNames[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

                    }
                    if (itemReqTypes[r].Equals("Race"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("race")) == int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r] ), true);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required Race ", itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]) , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required Race ", itemReqNames[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif


                    }

                    if (itemReqTypes[r].Equals("Skill Level"))
                    {


                        if (Skills.Instance.GetPlayerSkillLevel(itemReqNames[r]) < int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]),  itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required " + itemReqNames[r], itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(itemReqNames[r]),  itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required " + itemReqNames[r], itemReqValues[r], true);
#endif
                    }

                    if (itemReqTypes[r].Equals("Stat"))
                    {
                        int val = 0;
                        if (ClientAPI.GetPlayerObject().PropertyExists(itemReqNames[r]))
                        {
                            val = (int)ClientAPI.GetPlayerObject().GetProperty(itemReqNames[r]);
                        }

                        string statName = itemReqNames[r];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (val < int.Parse(itemReqValues[r]))
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ statName  ,  itemReqValues[r], true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required " + statName, itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+statName ,  itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAttribute("Required " + statName, itemReqValues[r], true);
#endif
                    }
                }

            if (Unique)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Unique"),"",true);
#else
                UIAtavismTooltip.Instance.AddAttribute("Unique", "", true);
#endif
            }

            if (isBound)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Soulbound"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                UIAtavismTooltip.Instance.AddAttribute("Soulbound", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
            }
            else if (binding > 0)
            {
                if (binding == 1)
                {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnEquip"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Soulbound On Equip", "", true);
#endif
                }
                else if (binding == 2)
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnPickup"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Soulbound On Pickup", "", true);
#endif
            }

            if (sellable)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Sellable"), "", true);
#else
                UIAtavismTooltip.Instance.AddAttribute("Sellable", "", true);
#endif
            }
            else
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Sellable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                UIAtavismTooltip.Instance.AddAttribute("Not Sellable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

            }
            if ((itemType == "Weapon" || itemType == "Armor"))
                if (enchantId > 0)
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Enchantable"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Enchantable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Enchantable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Not Enchantable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

                }

            if (maxDurability > 0)
            {
#if AT_I2LOC_PRESET
             UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Durability")+" ", durability + "/" + maxDurability, true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                UIAtavismTooltip.Instance.AddAttribute(" Durability", durability + "/" + maxDurability, true, UIAtavismTooltip.Instance.itemTypeColour);
#endif

                if (repairable)
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Repairable"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Repairable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Repairable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Not Repairable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                }
            }




            if (autoattack > 0)
            {
                AtavismAbility aa = Abilities.Instance.GetAbility(autoattack);
                if (aa != null)
                {
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Auto Attack")+" ",  aa.name, true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                    UIAtavismTooltip.Instance.AddAttribute("Auto Attack", aa.name, true, UIAtavismTooltip.Instance.itemTypeColour);
#endif
                }
            }

            if (parry)
            {
#if AT_I2LOC_PRESET
             UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Parry effect")+" ", "", true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                UIAtavismTooltip.Instance.AddAttribute("Parry effect","", true, UIAtavismTooltip.Instance.itemTypeColour);
#endif
            }


            if (!sockettype.Equals("")&& !sockettype.Equals("~ none ~"))
            {
#if AT_I2LOC_PRESET
             UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Socketing type")+" ",sockettype, true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                UIAtavismTooltip.Instance.AddAttribute("Socketing type", sockettype, true, UIAtavismTooltip.Instance.itemTypeColour);
#endif
            }


            /*   if (ammoType > 0)
               {
   #if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Ammo type")+" ", "", true, UIAtavismTooltip.Instance.itemTypeColour);
   #else
                   UIAtavismTooltip.Instance.AddAttribute("Ammo type", "", true, UIAtavismTooltip.Instance.itemTypeColour);
   #endif
               }*/

            if (deathLoss > 0)
            {
#if AT_I2LOC_PRESET
             UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Death Loss chance")+" ",  deathLoss.ToString(), true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                UIAtavismTooltip.Instance.AddAttribute("Death Loss chance", deathLoss.ToString(), true, UIAtavismTooltip.Instance.itemTypeColour);
#endif
            }

            if (GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAttributeSeperator();
#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + tooltip);
#else
                string tooltipDescription = tooltip;
#endif
                int templateId = int.Parse(itemEffectValues[GetEffectPositionsOfTypes("ClaimObject")[0]]);
                AtavismBuildObjectTemplate abot = WorldBuilder.Instance.GetBuildObjectTemplate(templateId);
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim Object")+" : " + I2.Loc.LocalizationManager.GetTranslation(abot.buildObjectName));
 string vClaimtype = "";
                foreach (var vct in abot.validClaimTypes)
                {
                    foreach (var ct in WorldBuilder.Instance.ClaimTypes.Values)
                    {
                        if (ct.id == vct)
                        {

                            vClaimtype += I2.Loc.LocalizationManager.GetTranslation(ct.name)+", ";
                        }
                    }
                }

                if (vClaimtype.Length > 2)
                {
                    vClaimtype = vClaimtype.Remove(vClaimtype.Length - 2);
                }
            UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim type") + " : " + vClaimtype);
            UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int i = 0; i < abot.itemsReq.Count; i++)
            {
                AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                UIAtavismTooltip.Instance.AddAttributeResource(I2.Loc.LocalizationManager.GetTranslation(item.name), abot.itemsReqCount[i].ToString(),item.Icon,false);
            }
            UIAtavismTooltip.Instance.AddAttributeSeperator();
            if (abot.skill > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation("Skill") + " " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname), abot.skillLevelReq.ToString(),true);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+" " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname) ,  abot.skillLevelReq.ToString() ,true,UIAtavismTooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                }
            }
           if (!abot.reqWeapon.Equals("~ none ~") && !abot.reqWeapon.Equals(""))
            {
                if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"), I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true);
                else
                    UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type") ,  I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true,UIAtavismTooltip.Instance.itemStatLowerColour);
            }
#else
                UIAtavismTooltip.Instance.AddAttributeTitle("Claim Object : " + abot.buildObjectName);
                string vClaimtype = "";
                foreach (var vct in abot.validClaimTypes)
                {
                    foreach (var ct in WorldBuilder.Instance.ClaimTypes.Values)
                    {
                        if (ct.id == vct)
                        {
                            vClaimtype += ct.name+", ";
                        }
                    }
                }

                if (vClaimtype.Length > 2)
                {
                    vClaimtype = vClaimtype.Remove(vClaimtype.Length - 2);
                }
                
                UIAtavismTooltip.Instance.AddAttributeTitle("Claim type : " + vClaimtype);
                UIAtavismTooltip.Instance.AddAttributeTitle("Resources : ");
                for (int i = 0; i < abot.itemsReq.Count; i++)
                {
                    AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                    UIAtavismTooltip.Instance.AddAttributeResource(item.name, abot.itemsReqCount[i].ToString(), item.Icon, false);
                }
                UIAtavismTooltip.Instance.AddAttributeSeperator();
                if (abot.skill > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                        {
                            UIAtavismTooltip.Instance.AddAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UIAtavismTooltip.Instance.AddAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true, UIAtavismTooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                    }
                }

                if (!abot.reqWeapon.Equals("~ none ~") && !abot.reqWeapon.Equals(""))
                {
                    if (((string) ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                        UIAtavismTooltip.Instance.AddAttribute("Required equiped weapon type: ", abot.reqWeapon, true);
                    else
                        UIAtavismTooltip.Instance.AddAttribute("Required equiped weapon type: ", abot.reqWeapon, true, UIAtavismTooltip.Instance.itemStatLowerColour);
                }
#endif
                UIAtavismTooltip.Instance.SetDescription(tooltipDescription);
            }
            else if (GetEffectPositionsOfTypes("CraftsItem").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAttributeSeperator();

#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + tooltip);
#else
                string tooltipDescription = tooltip;
#endif
                int craftingRecipeID = int.Parse(itemEffectValues[GetEffectPositionsOfTypes("CraftsItem")[0]]);
                AtavismCraftingRecipe recipe = Inventory.Instance.GetCraftingRecipe(craftingRecipeID);
                // Crafts <item>
                AtavismInventoryItem itemCrafted = Inventory.Instance.GetItemByTemplateID(recipe.createsItems[0]);
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Crafts"), itemCrafted.name, true);
            UIAtavismTooltip.Instance.AddAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int r = 0; r < recipe.itemsReq.Count; r++)
            { 
                AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                UIAtavismTooltip.Instance.AddAttributeResource(I2.Loc.LocalizationManager.GetTranslation("Items/" + it.name), recipe.itemsReqCounts[r].ToString(),it.Icon, false);
            }
            UIAtavismTooltip.Instance.AddAttributeSeperator();
            UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Station"), recipe.stationReq, true);
            if (recipe.skillID > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                    {
                        UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("Required")+" "+ I2.Loc.LocalizationManager.GetTranslation("Skill")+" "+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname), recipe.skillLevelReq.ToString(), true);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAttribute( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+""+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname) ,  recipe.skillLevelReq.ToString(), true,UIAtavismTooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                }
            }
          
#else
                UIAtavismTooltip.Instance.AddAttribute("Crafts", itemCrafted.name, true);
                UIAtavismTooltip.Instance.AddAttributeTitle("Resources : ");
                for (int r = 0; r < recipe.itemsReq.Count; r++)
                {
                    AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                    UIAtavismTooltip.Instance.AddAttributeResource(it.name, recipe.itemsReqCounts[r].ToString(), it.Icon, false);
                }
                UIAtavismTooltip.Instance.AddAttributeSeperator();
                UIAtavismTooltip.Instance.AddAttribute("Required Station", recipe.stationReq, true);
                if (recipe.skillID > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                        {
                            UIAtavismTooltip.Instance.AddAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UIAtavismTooltip.Instance.AddAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true, UIAtavismTooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                    }
                }
#endif

                UIAtavismTooltip.Instance.AddAttributeSeperator();
                UIAtavismTooltip.Instance.SetDescription(tooltipDescription);
                showUIAdditionalTooltip(recipe.createsItems[0]);
            }
            else
            {
                UIAtavismTooltip.Instance.AddAttributeSeperator();

#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetDescription(I2.Loc.LocalizationManager.GetTranslation("Items/" + tooltip));
#else
                UIAtavismTooltip.Instance.SetDescription(tooltip);
#endif
            }
            //check ability ie learned
            if (GetEffectPositionsOfTypes("UseAbility").Count > 0)
            {
                if (name.IndexOf("TeachAbility") > -1)
                {
                    int abilityID = int.Parse(itemEffectNames[GetEffectPositionsOfTypes("UseAbility")[0]]);
                    AtavismAbility aa = Abilities.Instance.GetAbility(abilityID);
                    AtavismAbility paa = Abilities.Instance.GetPlayerAbility(abilityID);
                    if (paa != null)
                    {

#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAttribute(I2.Loc.LocalizationManager.GetTranslation("taught") , "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                        UIAtavismTooltip.Instance.AddAttribute("Taught", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                    }
                    aa.ShowUIAdditionalTooltip();
                }
            }



            UIAtavismTooltip.Instance.Show(target);
        }

        /// <summary>
        /// Show Additional tooltip for UI Elements implementation.
        /// </summary>
        /// <param name="Id"></param>
        void showUIAdditionalTooltip(int Id)
        {
#if AT_MOBILE
            return;
#endif            
            AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(Id);
            showUIAdditionalTooltip(item);
        }
        /// <summary>
        /// Show Additional tooltip for UI Elements implementation.
        /// </summary>
        /// <param name="item"></param>
        public void showUIAdditionalTooltip(AtavismInventoryItem item)
        {
#if AT_MOBILE
            return;
#endif            
            //  Debug.LogError("showAdditionalTooltip");
            //   string defaultColor = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(UIAtavismTooltip.Instance.defaultTextColour.r), ToByte(UIAtavismTooltip.Instance.defaultTextColour.g), ToByte(UIAtavismTooltip.Instance.defaultTextColour.b));


#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.SetAdditionalTitle((item.enchantLeval > 0?" +"+ item.enchantLeval : "")+" "+I2.Loc.LocalizationManager.GetTranslation("Items/"+item.name));
#else
            UIAtavismTooltip.Instance.SetAdditionalTitle((item.enchantLeval > 0 ? " +" + item.enchantLeval : "") + " " + item.name);
#endif
            if (item.Icon != null)
            {
                UIAtavismTooltip.Instance.SetAdditionalIcon(item.Icon);
            }
            UIAtavismTooltip.Instance.SetAdditionalQuality(item.quality);
            UIAtavismTooltip.Instance.SetAdditionalTitleColour(AtavismSettings.Instance.ItemQualityColor(item.quality));
            string slotName = Inventory.Instance.GetItemByTemplateID(item.TemplateId).slot;
         
            if (item.itemType == "Tool")
            {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
      		    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute(slotName, "", true);
                UIAtavismTooltip.Instance.SetAdditionalType(item.itemType);
              
#endif

            }
            else if (item.itemType == "Armor")
            {

#if AT_I2LOC_PRESET
      		UIAtavismTooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation("Slot") + ": "+I2.Loc.LocalizationManager.GetTranslation(slotName));
                    if(item.gear_score>0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UIAtavismTooltip.Instance.SetAdditionalType(slotName);
                if (item.gear_score > 0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Gear Score", item.gear_score.ToString(), true);
#endif
                                
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation(slotName));
#else
                UIAtavismTooltip.Instance.SetAdditionalType(slotName);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    int mark1 = 99;
                    int mark2 = 99;
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                            else
                            {
                                if (gear_score > item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (gear_score < item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (gear_score == item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), textDamage, true, mark1, mark2);
#else
                   
                        UIAtavismTooltip.Instance.AddAdditionalAttribute("Gear Score", textDamage, true, mark1, mark2);
#endif


                }

            }
            else if (item.itemType == "Weapon")
            {
                                
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UIAtavismTooltip.Instance.SetAdditionalType(" " + item.subType);
                UIAtavismTooltip.Instance.AddAdditionalAttribute(slotName, "", true);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    int mark1 = 99;
                    int mark2 = 99;
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                    if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                            }
                            else
                            {
                                    if (gear_score > item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (gear_score < item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (gear_score == item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), textDamage, true, mark1 ,mark2);
#else
                   
                        UIAtavismTooltip.Instance.AddAdditionalAttribute("Gear Score", textDamage, true, mark1, mark2);
#endif


                }
/*
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
                 if(item.gear_score>0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UIAtavismTooltip.Instance.SetAdditionalType(" " + item.subType);
                UIAtavismTooltip.Instance.AddAdditionalAttribute(slotName, "", true);
                if (item.gear_score > 0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Gear Score", item.gear_score.ToString(), true);
#endif*/
            }
            else
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
#else
                UIAtavismTooltip.Instance.SetAdditionalType(item.itemType);
#endif
            }
            UIAtavismTooltip.Instance.SetAdditionalTypeColour(UIAtavismTooltip.Instance.itemTypeColour);
            if (item.Weight > 0)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalWeight(I2.Loc.LocalizationManager.GetTranslation("Weight")+": " + item.Weight + "(" + (item.Weight * item.count) + ")");
#else
                UIAtavismTooltip.Instance.SetAdditionalWeight("Weight: " + item.Weight + " (" + (item.Weight * item.count) + ")");
#endif
            }
            else
            {
                UIAtavismTooltip.Instance.SetAdditionalWeight("");
            }
            if (item.itemType == "Weapon" || item.itemEffectTypes.Contains("Stat"))
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Stats"), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Stats", UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
            }
            // Color colour = UIAtavismTooltip.Instance.defaultTextColour;
            //string defaultColourText = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(colour.r), ToByte(colour.g), ToByte(colour.b));
            if (item.itemType == "Weapon")
            {
                // string colourText = "";
                //colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textDamage = item.damageValue.ToString();
                int mark1 = 99;
                int mark2 = 99;
                if (item.damageMaxValue - item.damageValue > 0)
                    textDamage += " - " + item.damageMaxValue.ToString();


                if (item.enchantStats.ContainsKey("dmg-base"))
                    if ((item.damageMaxValue + item.damageValue) / 2 - (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 != 0)
                        textDamage += " (" + ((item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 - (item.damageMaxValue + item.damageValue) / 2) + ")";
                if (item.itemType == "Weapon" || item.itemType == "Armor")
                   
                    if (enchantStats.ContainsKey("dmg-base"))
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                        else
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                    }
                    else
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((damageMaxValue + damageValue) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((damageMaxValue + damageValue) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                        else
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((damageMaxValue + damageValue) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((damageMaxValue + damageValue) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                    }
                //}

                //colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textSpeed = ((float)item.weaponSpeed / 1000).ToString();
                int mark21 = 99;
                int mark22 = 99;
                if (item.itemType == "Weapon" || item.itemType == "Armor")
                    //foreach (AtavismInventoryItem item in items)
                    //{
                    if (item.weaponSpeed < weaponSpeed)
                        if (mark21 == 99) mark22 = -1;
                        else mark21 = -1;
                if (item.weaponSpeed > weaponSpeed)
                    if (mark21 == 99) mark22 = 1;
                    else mark21 = 1;
                if (item.weaponSpeed == weaponSpeed)
                    if (mark21 == 99) mark22 = 0;
                    else mark21 = 0;
                //}
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage")),  textDamage, true, mark1, mark2);
            UIAtavismTooltip.Instance.AddAdditionalAttribute(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("attack_speed")),  textSpeed, true, mark21, mark22);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Damage", textDamage, true, UIAtavismTooltip.Instance.itemTypeColour, mark1, mark2);
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Speed", textSpeed, true, UIAtavismTooltip.Instance.itemTypeColour, mark21, mark22);
#endif
            }

            List<string> additonalStats = new List<string>();

            foreach (string st in item.enchantStats.Keys)
            {
                if (!item.itemEffectNames.Contains(st) && !additonalStats.Contains(st))
                {
                    // Debug.LogError("Stat " + st);
                    additonalStats.Add(st);
                }
            }
            foreach (int statPos in item.GetEffectPositionsOfTypes("Stat"))
            {

                string statName = item.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                string[] statNames = statName.Split('_');
                if (statNames.Length > 1)
                {
                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                }
                else
                {
                    statName = FirstCharToUpper(statNames[0]);
                }
#endif
                // colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textParam = "";
                if (int.Parse(item.itemEffectValues[statPos]) != 0)
                    textParam = item.itemEffectValues[statPos] + " ";
                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) - item.enchantStats[item.itemEffectNames[statPos]] != 0)
                        textParam += "(" + (item.enchantStats[item.itemEffectNames[statPos]]) + ")";
                int mark1 = 99;
                int mark2 = 99;

                bool printStat = false;
                if (textParam.Length > 0)
                    printStat = true;
                if ((item.itemType == "Weapon" || item.itemType == "Armor") && (itemType == item.itemType))
                {
                    
                    if (itemEffectNames.Contains(item.itemEffectNames[statPos]))
                    {

                        int itemStatIndex = itemEffectNames.IndexOf(item.itemEffectNames[statPos]);
                        
                        if (enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                        {
                            if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                            else
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                            }
                        }
                        else
                        {
                            if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]))
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]))
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]))
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                            else
                            {
                                if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]))
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]))
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]))
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                        }
                      
                    }
                    else
                    {
                        if (mark1 == 99) mark2 = 10;
                        else mark1 = 10;
                    }

                }
                if (!string.IsNullOrEmpty(item.itemEffectValues[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) > 0)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, textParam, false, mark1, mark2);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) < 0)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, textParam, false, mark1, mark2);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) == 0 && printStat)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, textParam, false, mark1, mark2);
                    }

            }
            //<sprite=1>
            //add stats from equiped items thats not in check item
            foreach (string addStatName in additonalStats)
            {
                bool printStat = false;
                string textParam = "";
                int mark1 = 99;
                int mark2 = 99;
                if (!addStatName.Equals("dmg-base") && !addStatName.Equals("dmg-max") && !addStatName.Equals("gearScore"))
                {
                    printStat = true;
                    textParam = "(" + item.enchantStats[addStatName] + ")";
                  
                    if (item.itemEffectNames.Contains(addStatName))
                    {
                        int itemStatIndex = item.itemEffectNames.IndexOf(addStatName);

                        if (item.enchantStats.ContainsKey(addStatName))
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] < enchantStats[addStatName])
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] > enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] == enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;

                        }
                        else
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) < enchantStats[addStatName])
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) > enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) == enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                    }
                    else
                    {
                        if (mark1 == 99) mark2 = 10;
                        else mark1 = 10;
                    }
                    // }
                }
                if (printStat)
                {
#if AT_I2LOC_PRESET
                string _addStatName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(addStatName));
#else
                    string[] statNames = addStatName.Split('_');
                    string _addStatName = FirstCharToUpper(statNames[0]);
                    if (statNames.Length > 1)
                    {
                        _addStatName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                    }
#endif
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(_addStatName, textParam, false, mark1, mark2);
                }
            }

            //Add Effects and Abilities for Enchants
            if (item.enchantLeval > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Enchant Effects", UIAtavismTooltip.Instance.itemSectionTitleColour);

                foreach (KeyValuePair<int, int> effects in item.enchantEffects)
                {
                    AtavismEffect effect = Abilities.Instance.GetEffect(effects.Key);   
                    if (effects.Value > 1)
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(effect.name + " x " + effects.Value + "\n" + effect.tooltip, effect.Icon, false);
                    else
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                }
                foreach (KeyValuePair<int, int> abilities in item.enchantAbilities)
                {
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilities.Key);
                    if (abilities.Value > 1)
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(ability.name + " x " + abilities.Value + "\n" + ability.tooltip, ability.Icon, false);
                    else
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketEffect").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Effects ", UIAtavismTooltip.Instance.itemSectionTitleColour);

                //Add Effects and Abilities for socket items
                foreach (int effectPos in item.GetEffectPositionsOfTypes("SocketEffect"))
                {
                    int effectID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                    if (effect != null)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                    }
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketAbility").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Abilities ", UIAtavismTooltip.Instance.itemSectionTitleColour);

                foreach (int effectPos in item.GetEffectPositionsOfTypes("SocketAbility"))
                {
                    int abilityID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                    if (ability != null)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                    }
                }
            }


            if (item.socketSlots.Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
                foreach (string key in item.socketSlots.Keys)
                {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Sockets of")+" " + I2.Loc.LocalizationManager.GetTranslation(key), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Sockets of " + key, UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
                    foreach (int it in item.socketSlots[key].Keys)
                    {
                        //  Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]);
                        if (item.socketSlots[key][it] > 0)
                        {
                            AtavismInventoryItem aii = Inventory.Instance.GetItemByTemplateID(item.socketSlots[key][it]);
                            if (aii == null)
                            {
#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                                UIAtavismTooltip.Instance.AddAdditionalAttributeSocket("Empty", null, false);
#endif
                                continue;
                            }
                            string socketStat = "";
                            foreach (int statPos in aii.GetEffectPositionsOfTypes("Stat"))
                            {
                                //Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]+" Stat pos:"+ statPos+ " count:"+itemEffectNames.Count);

                                string statName = aii.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                                string[] statNames = statName.Split('_');
                                if (statNames.Length > 1)
                                {
                                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                                }
                                else
                                {
                                    statName = FirstCharToUpper(statNames[0]);
                                }
#endif
                                socketStat += statName + " " + (int.Parse(aii.itemEffectValues[statPos]) > 0 ? "+" + aii.itemEffectValues[statPos] : int.Parse(aii.itemEffectValues[statPos]) < 0 ? "-" + aii.itemEffectValues[statPos] : "0") + "\n";
                            }

                            //Add Effects and Abilities for sockets
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketEffect"))
                            {
                                int effectID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                                if (effect != null)
                                {
                                    //UIAtavismTooltip.Instance.AddAttributeSocket(effect.name, effect.icon, false);
                                    socketStat += effect.name + "\n" + effect.tooltip;
                                }
                            }
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketAbility"))
                            {
                                int abilityID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                                if (ability != null)
                                {
                                    //UIAtavismTooltip.Instance.AddAttributeSocket(ability.name, ability.icon, false);
                                    socketStat += ability.name + "\n" + ability.tooltip;
                                }
                            }
                            UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(socketStat, aii.Icon, false);

                        }
                        else
                        {
#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttributeSocket("Empty", null, false);
#endif
                        }
                    }
                }
            }
            if (item.setId > 0)
            {
                AtavismInventoryItemSet aiis = Inventory.Instance.GetItemBySetID(item.setId);
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set Effects")+" "+I2.Loc.LocalizationManager.GetTranslation(aiis.Name),UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Set Effects " + aiis.Name, UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif

                foreach (AtavismInventoryItemSetLevel level in aiis.levelList)
                {
                    Color setColor = UIAtavismTooltip.Instance.itemSetColour;
                    Color setTitleColor = UIAtavismTooltip.Instance.itemSectionTitleColour;
                    if (item.setCount < level.NumerOfParts)
                    {
                        setColor = UIAtavismTooltip.Instance.itemInactiveSetColour;
                        setTitleColor = UIAtavismTooltip.Instance.itemInactiveSetColour;

                    }
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Set")+" "+level.NumerOfParts+" "+I2.Loc.LocalizationManager.GetTranslation("parts"), setTitleColor);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Set " + level.NumerOfParts + " parts", setTitleColor);
#endif
                    if (level.DamageValue != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValue > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "+" + level.DamageValue.ToString(), false, setColor);
                        if (level.DamageValue < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "-" + level.DamageValue.ToString(), false, setColor);
                    }
                    if (level.DamageValuePercentage != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValuePercentage > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "+" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                        if (level.DamageValuePercentage < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "-" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                    }

                    for (int k = 0; k < level.itemStatName.Count; k++)
                    {
                        string statName = level.itemStatName[k];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (level.itemStatValues[k] > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "+" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValues[k] < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "-" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValuesPercentage[k] > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "+" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                        if (level.itemStatValuesPercentage[k] < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute(statName, "-" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                    }
                    
                    //Add Effects and Abilities
                    if (level.itemEffects != null)
                    {
                        foreach (int ef in level.itemEffects)
                        {
                            AtavismEffect effect = Abilities.Instance.GetEffect(ef);
                            if (effect != null)
                            {
                                UIAtavismTooltip.Instance.AddAdditionalAttribute(effect.name, effect.tooltip, true, setColor);
                            }
                        }
                    }

                    if (level.itemAbilities != null)
                    {
                        foreach (int ab in level.itemAbilities)
                        {
                            AtavismAbility ability = Abilities.Instance.GetAbility(ab);
                            if (ability != null)
                            {
                                UIAtavismTooltip.Instance.AddAdditionalAttribute(ability.name, ability.tooltip, true, setColor);
                            }
                        }
                    }
                }
            }


            UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
            if (item.itemReqTypes.Count > 0)


                for (int r = 0; r < item.itemReqTypes.Count; r++)
                {
                    if (item.itemReqTypes[r].Equals("Level"))
                    {
                        if ((int)ClientAPI.GetPlayerObject().GetProperty("level") < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") ,  item.itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Level ", item.itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") + " ",  item.itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Level ", item.itemReqValues[r], true);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Class"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("aspect")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") + " ", I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Class ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredClass") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Class", item.itemReqNames[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

                    }
                    if (item.itemReqTypes[r].Equals("Race"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("race")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Race ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Race ", item.itemReqNames[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Skill Level"))
                    {


                        if (Skills.Instance.GetPlayerSkillLevel(item.itemReqNames[r]) < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]), item.itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required " + item.itemReqNames[r], item.itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]),  item.itemReqValues[r], true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required " + item.itemReqNames[r], item.itemReqValues[r], true);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Stat"))
                    {
                        int val = 0;
                        if (ClientAPI.GetPlayerObject().PropertyExists(item.itemReqNames[r]))
                        {
                            //   Debug.LogError("Stat: r:" + r + " itemReqNames:" + itemReqNames[r] + " player prop:" + ClientAPI.GetPlayerObject().GetProperty(itemReqNames[r]));
                            val = (int)ClientAPI.GetPlayerObject().GetProperty(item.itemReqNames[r]);
                        }

                        string statName = item.itemReqNames[r];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (val < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ statName  ,  item.itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required " + statName, item.itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+statName , item.itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required " + statName, item.itemReqValues[r], true);
#endif
                    }
                }

            if (item.Unique)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Unique"),"",true);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Unique", "", true);
#endif
            }

            if (item.isBound)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Soulbound"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Soulbound", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
            }
            else if (item.binding > 0)
            {
                if (item.binding == 1)
                {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnEquip"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Soulbound On Equip", "", true);
#endif
                }
                else if (item.binding == 2)
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnPickup"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Soulbound On Pickup", "", true);
#endif
            }
            if (item.sellable)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Sellable"), "", true);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Sellable", "", true);
#endif
            }
            else
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Sellable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Not Sellable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

            }
            if ((item.itemType == "Weapon" || item.itemType == "Armor"))

                if (item.enchantId > 0)
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Enchantable"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Enchantable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Enchantable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Not Enchantable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

                }
            if (item.maxDurability > 0)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("Durability")+" ", item.durability + "/" + item.maxDurability, true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute(" Durability", item.durability + "/" + item.maxDurability, true, UIAtavismTooltip.Instance.itemTypeColour);
#endif
                if (item.repairable)
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Repairable"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Repairable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Not Repairable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute("Not Repairable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                }
            }
            if (item.GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int templateId = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("ClaimObject")[0]]);
                AtavismBuildObjectTemplate abot = WorldBuilder.Instance.GetBuildObjectTemplate(templateId);
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim Object")+" : " + I2.Loc.LocalizationManager.GetTranslation(abot.buildObjectName));
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Claim type") + " : " + I2.Loc.LocalizationManager.GetTranslation(abot.validClaimTypes.ToString()));
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int i = 0; i < abot.itemsReq.Count; i++)
            {
                AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                UIAtavismTooltip.Instance.AddAdditionalAttributeResource(I2.Loc.LocalizationManager.GetTranslation(itemc.name), abot.itemsReqCount[i].ToString(),itemc.Icon,false);
            }
            UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
            if (abot.skill > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation("Skill") + " " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname), abot.skillLevelReq.ToString(),true);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+" " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname) ,  abot.skillLevelReq.ToString() ,true,UIAtavismTooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                }
            }
            if (!abot.reqWeapon.Equals("~ none ~"))
            {
                if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                    UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"), I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true);
                else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type") , I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon) ,true,UIAtavismTooltip.Instance.itemStatLowerColour);
            }
#else
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Claim Object : " + abot.buildObjectName, UIAtavismTooltip.Instance.itemSectionTitleColour);
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Claim type : " + abot.validClaimTypes);
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Resources : ");
                for (int i = 0; i < abot.itemsReq.Count; i++)
                {
                    AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                    UIAtavismTooltip.Instance.AddAdditionalAttributeResource(itemc.name, abot.itemsReqCount[i].ToString(), itemc.Icon, false);
                }
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
                if (abot.skill > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true, UIAtavismTooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                    }
                }
                if (!abot.reqWeapon.Equals("~ none ~"))
                {
                    if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                        UIAtavismTooltip.Instance.AddAdditionalAttribute("Required equiped weapon type: ", abot.reqWeapon, true);
                    else
                        UIAtavismTooltip.Instance.AddAdditionalAttribute("Required equiped weapon type:", abot.reqWeapon, true, UIAtavismTooltip.Instance.itemStatLowerColour);
                }
#endif
                UIAtavismTooltip.Instance.SetAdditionalDescription(tooltipDescription);
            }
            else if (item.GetEffectPositionsOfTypes("CraftsItem").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();

#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int craftingRecipeID = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("CraftsItem")[0]]);
                AtavismCraftingRecipe recipe = Inventory.Instance.GetCraftingRecipe(craftingRecipeID);
                // Crafts <item>
                AtavismInventoryItem itemCrafted = Inventory.Instance.GetItemByTemplateID(recipe.createsItems[0]);
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Crafts"), itemCrafted.name, true);
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int r = 0; r < recipe.itemsReq.Count; r++)
            {
                 AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
               UIAtavismTooltip.Instance.AddAdditionalAttributeResource(I2.Loc.LocalizationManager.GetTranslation("Items/" + it.name), recipe.itemsReqCounts[r].ToString(),it.Icon, false);
            }
            UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
            UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Station"), recipe.stationReq, true);
            if (recipe.skillID > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute(I2.Loc.LocalizationManager.GetTranslation("Required")+" "+ I2.Loc.LocalizationManager.GetTranslation("Skill")+" "+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname), recipe.skillLevelReq.ToString(), true);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+""+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname) ,  recipe.skillLevelReq.ToString() , true, UIAtavismTooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                }
            }
          
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Crafts", itemCrafted.name, true);
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle("Resources : ");
                for (int r = 0; r < recipe.itemsReq.Count; r++)
                {
                    AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                    UIAtavismTooltip.Instance.AddAdditionalAttributeResource(it.name, recipe.itemsReqCounts[r].ToString(), it.Icon, false);
                }
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
                UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Station", recipe.stationReq, true);
                if (recipe.skillID > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true, UIAtavismTooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                    }
                }
#endif

                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();
                UIAtavismTooltip.Instance.SetAdditionalDescription(tooltipDescription);
                showUIAdditionalTooltip2(recipe.createsItems[0]);
            }
            else
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator();

#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalDescription(I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip));
#else
                UIAtavismTooltip.Instance.SetAdditionalDescription(item.tooltip);
#endif
            }
            //check ability ie learned
            if (item.GetEffectPositionsOfTypes("UseAbility").Count > 0)
            {
                if (item.name.IndexOf("TeachAbility") > -1)
                {
                    int abilityID = int.Parse(item.itemEffectNames[item.GetEffectPositionsOfTypes("UseAbility")[0]]);
                    AtavismAbility aa = Abilities.Instance.GetAbility(abilityID);
                    AtavismAbility paa = Abilities.Instance.GetPlayerAbility(abilityID);
                    if (paa != null)
                    {

#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAdditionalAttribute( I2.Loc.LocalizationManager.GetTranslation("taught") , "", true);
#else
                        UIAtavismTooltip.Instance.AddAdditionalAttribute("Taught", "", true);
#endif
                    }
                    aa.ShowUIAdditionalTooltip2();
                }
            }
            UIAtavismTooltip.Instance.ShowAdditionalTooltip();
        }

        /// <summary>
        /// Show secound additional tooltip for UI Elements implementation.
        /// </summary>
        /// <param name="Id"></param>
        void showUIAdditionalTooltip2(int Id)
        {
#if AT_MOBILE
            return;
#endif            

            AtavismInventoryItem item = Inventory.Instance.GetItemByTemplateID(Id);
            showUIAdditionalTooltip2(item);
        }
        /// <summary>
        /// Show secound additional tooltip for UI Elements implementation.
        /// </summary>
        /// <param name="item"></param>
        void showUIAdditionalTooltip2(AtavismInventoryItem item)
        {
#if AT_MOBILE
            return;
#endif            

            // Debug.LogError("showAdditionalTooltip2");

            // string defaultColor = string.Format("#{0:X2}{1:X2}{2:X2}ff", ToByte(UIAtavismTooltip.Instance.defaultTextColour.r), ToByte(UIAtavismTooltip.Instance.defaultTextColour.g), ToByte(UIAtavismTooltip.Instance.defaultTextColour.b));


#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.SetAdditionalTitle2((item.enchantLeval > 0?" +"+ item.enchantLeval : "")+" "+I2.Loc.LocalizationManager.GetTranslation("Items/"+item.name));
#else
            UIAtavismTooltip.Instance.SetAdditionalTitle2((item.enchantLeval > 0 ? " +" + item.enchantLeval : "") + " " + item.name);
#endif
            if (item.Icon != null)
            {
                UIAtavismTooltip.Instance.SetAdditionalIcon2(item.Icon);
            }
            UIAtavismTooltip.Instance.SetAdditionalQuality2(item.quality);
            UIAtavismTooltip.Instance.SetAdditionalTitleColour2(AtavismSettings.Instance.ItemQualityColor(item.quality));
            string slotName = Inventory.Instance.GetItemByTemplateID(item.TemplateId).slot;
           
            if (item.itemType == "Tool")
            {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
      		    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(slotName, "", true);
                UIAtavismTooltip.Instance.SetAdditionalType2(item.itemType);
              
#endif
            }
            else  if (item.itemType == "Armor")
            {/*
#if AT_I2LOC_PRESET
      		UIAtavismTooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation("Slot") + ": "+I2.Loc.LocalizationManager.GetTranslation(slotName));
                    if(item.gear_score>0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UIAtavismTooltip.Instance.SetAdditionalType2(slotName);
                if (item.gear_score > 0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Gear Score", item.gear_score.ToString(), true);
#endif
                */
                                           
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation(slotName));
#else
                UIAtavismTooltip.Instance.SetAdditionalType2(slotName);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    int mark1 = 99;
                    int mark2 = 99;
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                    if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                            }
                            else
                            {
                                if (gear_score > item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = -1;
                                    else mark1 = -1;
                                if (gear_score < item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 1;
                                    else mark1 = 1;
                                if (gear_score == item.enchantStats["gearScore"])
                                    if (mark1 == 99) mark2 = 0;
                                    else mark1 = 0;
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), textDamage, true, mark1, mark2);
#else
                   
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2("Gear Score", textDamage, true, mark1, mark2);
#endif


                }
            }
            else if (item.itemType == "Weapon")
            {
                                           
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType2(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
#else
                UIAtavismTooltip.Instance.SetAdditionalType2(" " + item.subType);
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(slotName, "", true);
#endif

                if (item.gear_score > 0)
                {
                    string textDamage = item.gear_score.ToString();
                    int mark1 = 99;
                    int mark2 = 99;
                    if (item.enchantStats.ContainsKey("gearScore"))
                    {
                        if (item.gear_score - item.enchantStats["gearScore"] != 0)
                            textDamage += " (" + (item.enchantStats["gearScore"] - item.gear_score) + ")";

                        if (gear_score > 0)
                        {
                            if (enchantStats.ContainsKey("gearScore"))
                            {
                                    if (enchantStats["gearScore"] > item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (enchantStats["gearScore"] < item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (enchantStats["gearScore"] == item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                            }
                            else
                            {
                                    if (gear_score > item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (gear_score < item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (gear_score == item.enchantStats["gearScore"])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                            }
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }
                    }
#if AT_I2LOC_PRESET
                
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), textDamage, true, mark1, mark2);
#else
                   
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2("Gear Score", textDamage, true, mark1, mark2);
#endif


                }
                /*
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType2(" "+I2.Loc.LocalizationManager.GetTranslation(item.subType));
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation(slotName),"",true);
                 if(item.gear_score>0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Gear Score"), item.gear_score.ToString(), true);
#else
                UIAtavismTooltip.Instance.SetAdditionalType2(" " + item.subType);
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(slotName, "", true);
                if (item.gear_score > 0)
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Gear Score", item.gear_score.ToString(), true);
#endif*/
            }
            else
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalType2(I2.Loc.LocalizationManager.GetTranslation(item.itemType));
#else
                UIAtavismTooltip.Instance.SetAdditionalType2(item.itemType);
#endif
            }
            UIAtavismTooltip.Instance.SetAdditionalTypeColour2(UIAtavismTooltip.Instance.itemTypeColour);
            if (item.Weight > 0)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalWeight2(I2.Loc.LocalizationManager.GetTranslation("Weight")+": " + item.Weight + "(" + (item.Weight * item.count) + ")");
#else
                UIAtavismTooltip.Instance.SetAdditionalWeight2("Weight: " + item.Weight + " (" + (item.Weight * item.count) + ")");
#endif
            }
            else
            {
                UIAtavismTooltip.Instance.SetAdditionalWeight2("");
            }
            if (item.itemType == "Weapon" || item.itemEffectTypes.Contains("Stat"))
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
#if AT_I2LOC_PRESET
        UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Stats"), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Stats", UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
            }
         
            if (item.itemType == "Weapon")
            {
               
                string textDamage = item.damageValue.ToString();
                int mark1 = 99;
                int mark2 = 99;
                if (item.damageMaxValue - item.damageValue > 0)
                    textDamage += " - " + item.damageMaxValue.ToString();


                if (item.enchantStats.ContainsKey("dmg-base"))
                    if ((item.damageMaxValue + item.damageValue) / 2 - (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 != 0)
                        textDamage += " (" + ((item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2 - (item.damageMaxValue + item.damageValue) / 2) + ")";
                if (item.itemType == "Weapon" || item.itemType == "Armor")
                   
                    if (enchantStats.ContainsKey("dmg-base"))
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                        else
                        {
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((enchantStats["dmg-base"] + enchantStats["dmg-max"]) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                    }
                    else
                    {
                        if (item.enchantStats.ContainsKey("dmg-base"))
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((damageMaxValue + damageValue) / 2 < (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((damageMaxValue + damageValue) / 2 == (item.enchantStats["dmg-base"] + item.enchantStats["dmg-max"]) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                        else
                        {
                            if ((damageMaxValue + damageValue) / 2 > (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if ((damageMaxValue + damageValue) / 2 < (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if ((damageMaxValue + damageValue) / 2 == (item.damageMaxValue + item.damageValue) / 2)
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                    }
               
                string textSpeed = ((float)item.weaponSpeed / 1000).ToString();
                int mark21 = 99;
                int mark22 = 99;

                if (item.itemType == "Weapon" || item.itemType == "Armor")
                   
                    if (item.weaponSpeed < weaponSpeed)
                        if (mark21 == 99) mark22 = -1;
                        else mark21 = -1;
                if (item.weaponSpeed > weaponSpeed)
                    if (mark21 == 99) mark22 = 1;
                    else mark21 = 1;
                if (item.weaponSpeed == weaponSpeed)
                    if (mark21 == 99) mark22 = 0;
                    else mark21 = 0;
               
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage")),  textDamage, true, mark1, mark2);
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("attack_speed")),  textSpeed, true, mark21, mark22);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Damage", textDamage, true, UIAtavismTooltip.Instance.itemTypeColour, mark1, mark2);
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Speed", textSpeed, true, UIAtavismTooltip.Instance.itemTypeColour, mark21, mark22);
#endif
            }

            List<string> additonalStats = new List<string>();

            foreach (string st in item.enchantStats.Keys)
            {
                if (!item.itemEffectNames.Contains(st) && !additonalStats.Contains(st))
                {
                    // Debug.LogError("Stat " + st);
                    additonalStats.Add(st);
                }
            }
            foreach (int statPos in item.GetEffectPositionsOfTypes("Stat"))
            {

                string statName = item.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                string[] statNames = statName.Split('_');
                if (statNames.Length > 1)
                {
                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                }
                else
                {
                    statName = FirstCharToUpper(statNames[0]);
                }
#endif
                //    colour = UIAtavismTooltip.Instance.defaultTextColour;
                string textParam = "";
                if (int.Parse(item.itemEffectValues[statPos]) != 0)
                    textParam = item.itemEffectValues[statPos] + " ";
                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) - item.enchantStats[item.itemEffectNames[statPos]] != 0)
                        textParam += "(" + (item.enchantStats[item.itemEffectNames[statPos]]) + ")";
                int mark1 = 99;
                int mark2 = 99;
                bool printStat = false;
                if (textParam.Length > 0)
                    printStat = true;
                if ((item.itemType == "Weapon" || item.itemType == "Armor") && (itemType == item.itemType))
                {
                 
                    if (itemEffectNames.Contains(item.itemEffectNames[statPos]))
                        if (itemEffectNames.Contains(item.itemEffectNames[statPos]))
                        {

                            int itemStatIndex = itemEffectNames.IndexOf(item.itemEffectNames[statPos]);
                        
                            if (enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                            {
                                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]) + enchantStats[item.itemEffectNames[statPos]])
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                            }
                            else
                            {
                                if (item.enchantStats.ContainsKey(item.itemEffectNames[statPos]))
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] < int.Parse(itemEffectValues[itemStatIndex]))
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] > int.Parse(itemEffectValues[itemStatIndex]))
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[statPos]) + item.enchantStats[item.itemEffectNames[statPos]] == int.Parse(itemEffectValues[itemStatIndex]))
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                                else
                                {
                                    if (int.Parse(item.itemEffectValues[statPos]) < int.Parse(itemEffectValues[itemStatIndex]))
                                        if (mark1 == 99) mark2 = -1;
                                        else mark1 = -1;
                                    if (int.Parse(item.itemEffectValues[statPos]) > int.Parse(itemEffectValues[itemStatIndex]))
                                        if (mark1 == 99) mark2 = 1;
                                        else mark1 = 1;
                                    if (int.Parse(item.itemEffectValues[statPos]) == int.Parse(itemEffectValues[itemStatIndex]))
                                        if (mark1 == 99) mark2 = 0;
                                        else mark1 = 0;
                                }
                            }
                           
                        }
                        else
                        {
                            if (mark1 == 99) mark2 = 10;
                            else mark1 = 10;
                        }

                }
                if (!string.IsNullOrEmpty(item.itemEffectValues[statPos]))
                    if (int.Parse(item.itemEffectValues[statPos]) > 0)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, textParam, false, mark1, mark2);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) < 0)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, textParam, false, mark1, mark2);
                    }
                    else if (int.Parse(item.itemEffectValues[statPos]) == 0 && printStat)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, textParam, false, mark1, mark2);
                    }

            }
            //<sprite=1>
            //add stats from equiped items thats not in check item
            foreach (string addStatName in additonalStats)
            {
                bool printStat = false;
                string textParam = "";
                int mark1 = 99;
                int mark2 = 99;
                if (!addStatName.Equals("dmg-base") && !addStatName.Equals("dmg-max") && !addStatName.Equals("gearScore"))
                {
                    printStat = true;
                    textParam = "(" + item.enchantStats[addStatName] + ")";
                   
                    if (item.itemEffectNames.Contains(addStatName))
                    {
                        int itemStatIndex = item.itemEffectNames.IndexOf(addStatName);
   
                        if (item.enchantStats.ContainsKey(addStatName))
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] < enchantStats[addStatName])
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] > enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) + item.enchantStats[addStatName] == enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;

                        }
                        else
                        {
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) < enchantStats[addStatName])
                                if (mark1 == 99) mark2 = -1;
                                else mark1 = -1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) > enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 1;
                                else mark1 = 1;
                            if (int.Parse(item.itemEffectValues[itemStatIndex]) == enchantStats[addStatName])
                                if (mark1 == 99) mark2 = 0;
                                else mark1 = 0;
                        }
                    }
                    else
                    {
                        if (mark1 == 99) mark2 = 10;
                        else mark1 = 10;
                    }
                  
                }
                if (printStat)
                {
#if AT_I2LOC_PRESET
                string _addStatName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(addStatName));
#else
                    string[] statNames = addStatName.Split('_');
                    string _addStatName = FirstCharToUpper(statNames[0]);
                    if (statNames.Length > 1)
                    {
                        _addStatName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                    }
#endif
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(_addStatName, textParam, false, mark1, mark2);
                }
            }

            //Add Effects and Abilities for Enchants
            if (item.enchantLeval > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Enchant Effects", UIAtavismTooltip.Instance.itemSectionTitleColour);

                foreach (KeyValuePair<int, int> effects in item.enchantEffects)
                {
                    AtavismEffect effect = Abilities.Instance.GetEffect(effects.Key);
                    if (effects.Value > 1)
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(effect.name + " x " + effects.Value + "\n" + effect.tooltip, effect.Icon, false);
                    else
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                }
                foreach (KeyValuePair<int, int> abilities in item.enchantAbilities)
                {
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilities.Key);
                    if (abilities.Value > 1)
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(ability.name + " x " + abilities.Value + "\n" + ability.tooltip, ability.Icon, false);
                    else
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketEffect").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Effects ", UIAtavismTooltip.Instance.itemSectionTitleColour);

                //Add Effects and Abilities for socket items
                foreach (int effectPos in item.GetEffectPositionsOfTypes("SocketEffect"))
                {
                    int effectID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                    if (effect != null)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(effect.name + "\n" + effect.tooltip, effect.Icon, false);
                    }
                }
            }

            if (item.GetEffectPositionsOfTypes("SocketAbility").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Abilities ", UIAtavismTooltip.Instance.itemSectionTitleColour);

                foreach (int effectPos in GetEffectPositionsOfTypes("SocketAbility"))
                {
                    int abilityID = int.Parse(item.itemEffectValues[effectPos]);
                    AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                    if (ability != null)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(ability.name + "\n" + ability.tooltip, ability.Icon, false);
                    }
                }
            }

            if (item.socketSlots.Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
                foreach (string key in item.socketSlots.Keys)
                {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Sockets of")+" " + I2.Loc.LocalizationManager.GetTranslation(key), UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Sockets of " + key, UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif
                    foreach (int it in item.socketSlots[key].Keys)
                    {
                        //  Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]);
                        if (item.socketSlots[key][it] > 0)
                        {
                            AtavismInventoryItem aii = Inventory.Instance.GetItemByTemplateID(item.socketSlots[key][it]);
                            if (aii == null)
                            {
#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                                UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2("Empty", null, false);
#endif
                                continue;
                            }
                            string socketStat = "";
                            foreach (int statPos in aii.GetEffectPositionsOfTypes("Stat"))
                            {
                                //Debug.LogError("Socket " + key + " slot: " + it + " item:" + socketSlots[key][it]+" Stat pos:"+ statPos+ " count:"+itemEffectNames.Count);

                                string statName = aii.itemEffectNames[statPos];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                                string[] statNames = statName.Split('_');
                                if (statNames.Length > 1)
                                {
                                    statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                                }
                                else
                                {
                                    statName = FirstCharToUpper(statNames[0]);
                                }
#endif
                                socketStat += statName + " " + (int.Parse(aii.itemEffectValues[statPos]) > 0 ? "+" + aii.itemEffectValues[statPos] : int.Parse(aii.itemEffectValues[statPos]) < 0 ? "-" + aii.itemEffectValues[statPos] : "0") + "\n";
                            }

                            //Add Effects and Abilities for sockets
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketEffect"))
                            {
                                int effectID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismEffect effect = Abilities.Instance.GetEffect(effectID);
                                if (effect != null)
                                {
                                    //UIAtavismTooltip.Instance.AddAttributeSocket(effect.name, effect.icon, false);
                                    socketStat += effect.name + "\n" + effect.tooltip;
                                }
                            }
                            foreach (int effectPos in aii.GetEffectPositionsOfTypes("SocketAbility"))
                            {
                                int abilityID = int.Parse(aii.itemEffectValues[effectPos]);
                                AtavismAbility ability = Abilities.Instance.GetAbility(abilityID);
                                if (ability != null)
                                {
                                    //UIAtavismTooltip.Instance.AddAttributeSocket(ability.name, ability.icon, false);
                                    socketStat += ability.name + "\n" + ability.tooltip;
                                }
                            }
                            UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(socketStat, aii.Icon, false);

                        }
                        else
                        {
#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2(I2.Loc.LocalizationManager.GetTranslation("Empty"), null, false);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttributeSocket2("Empty", null, false);
#endif
                        }
                    }
                }
            }
            if (item.setId > 0)
            {
                AtavismInventoryItemSet aiis = Inventory.Instance.GetItemBySetID(item.setId);
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Set Effects")+" "+I2.Loc.LocalizationManager.GetTranslation(aiis.Name),UIAtavismTooltip.Instance.itemSectionTitleColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Set Effects " + aiis.Name, UIAtavismTooltip.Instance.itemSectionTitleColour);
#endif

                foreach (AtavismInventoryItemSetLevel level in aiis.levelList)
                {
                    Color setColor = UIAtavismTooltip.Instance.itemSetColour;
                    Color setTitleColor = UIAtavismTooltip.Instance.itemSectionTitleColour;
                    if (item.setCount < level.NumerOfParts)
                    {
                        setColor = UIAtavismTooltip.Instance.itemInactiveSetColour;
                        setTitleColor = UIAtavismTooltip.Instance.itemInactiveSetColour;

                    }
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Set")+" "+level.NumerOfParts+" "+I2.Loc.LocalizationManager.GetTranslation("parts"),setTitleColor);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Set " + level.NumerOfParts + " parts", setTitleColor);
#endif
                    if (level.DamageValue != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
                    statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValue > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.DamageValue.ToString(), false, setColor);
                        if (level.DamageValue < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.DamageValue.ToString(), false, setColor);
                    }

                    if (level.DamageValuePercentage != 0)
                    {
                        string statName = "Damage";
#if AT_I2LOC_PRESET
                    statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation("Damage"));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif

                        if (level.DamageValuePercentage > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                        if (level.DamageValuePercentage < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.DamageValuePercentage.ToString() + "%", false, setColor);
                    }


                    for (int k = 0; k < level.itemStatName.Count; k++)
                    {
                        string statName = level.itemStatName[k];
#if AT_I2LOC_PRESET
                    statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (level.itemStatValues[k] > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValues[k] < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.itemStatValues[k].ToString(), false, setColor);
                        if (level.itemStatValuesPercentage[k] > 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "+" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                        if (level.itemStatValuesPercentage[k] < 0)
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2(statName, "-" + level.itemStatValuesPercentage[k].ToString() + "%", false, setColor);
                    }

                    //Add Effects and Abilities
                    if (level.itemEffects != null)
                    {
                        foreach (int ef in level.itemEffects)
                        {
                            AtavismEffect effect = Abilities.Instance.GetEffect(ef);
                            if (effect != null)
                            {
                                UIAtavismTooltip.Instance.AddAdditionalAttribute2(effect.name, effect.tooltip, true, setColor);
                            }
                        }
                    }

                    if (level.itemAbilities != null)
                    {
                        foreach (int ab in level.itemAbilities)
                        {
                            AtavismAbility ability = Abilities.Instance.GetAbility(ab);
                            if (ability != null)
                            {
                                UIAtavismTooltip.Instance.AddAdditionalAttribute2(ability.name, ability.tooltip, true, setColor);
                            }
                        }
                    }

                }
            }


            UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();

            if (item.itemReqTypes.Count > 0)

                for (int r = 0; r < item.itemReqTypes.Count; r++)
                {
                    if (item.itemReqTypes[r].Equals("Level"))
                    {
                        if ((int)ClientAPI.GetPlayerObject().GetProperty("level") < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") + " ",  item.itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Level ", itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredLevel") + " ",  item.itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Level ", item.itemReqValues[r], true);
#endif
                    }


                    if (item.itemReqTypes[r].Equals("Class"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("aspect")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredClass"), I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]), true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Class ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredClass"), I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r] ), true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Class", item.itemReqNames[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

                    }
                    if (item.itemReqTypes[r].Equals("Race"))
                    {
                        if (((int)ClientAPI.GetPlayerObject().GetProperty("race")) == int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredRace"), I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r] ), true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Race ", item.itemReqNames[r], true);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("RequiredRace") , I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]) , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Race ", item.itemReqNames[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Skill Level"))
                    {


                        if (Skills.Instance.GetPlayerSkillLevel(item.itemReqNames[r]) < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]),  item.itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required " + item.itemReqNames[r], item.itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation(item.itemReqNames[r]), item.itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required " + item.itemReqNames[r], item.itemReqValues[r], true);
#endif
                    }

                    if (item.itemReqTypes[r].Equals("Stat"))
                    {
                        int val = 0;
                        if (ClientAPI.GetPlayerObject().PropertyExists(item.itemReqNames[r]))
                        {
                            val = (int)ClientAPI.GetPlayerObject().GetProperty(item.itemReqNames[r]);
                        }

                        string statName = item.itemReqNames[r];
#if AT_I2LOC_PRESET
            statName = FirstCharToUpper(I2.Loc.LocalizationManager.GetTranslation(statName));
#else
                        string[] statNames = statName.Split('_');
                        if (statNames.Length > 1)
                        {
                            statName = FirstCharToUpper(statNames[0]) + " " + FirstCharToUpper(statNames[1]);
                        }
                        else
                        {
                            statName = FirstCharToUpper(statNames[0]);
                        }
#endif
                        if (val < int.Parse(item.itemReqValues[r]))
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ statName ,  item.itemReqValues[r] , true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required " + statName, item.itemReqValues[r], true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                        else
#if AT_I2LOC_PRESET
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+statName ,  item.itemReqValues[r] , true);
#else
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required " + statName, item.itemReqValues[r], true);
#endif
                    }
                }

            if (item.Unique)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Unique"),"",true);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Unique", "", true);
#endif
            }


            if (item.isBound)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Soulbound"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Soulbound", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
            }
            else if (item.binding > 0)
            {
                if (item.binding == 1)
                {
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnEquip"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Soulbound On Equip", "", true);
#endif
                }
                else if (item.binding == 2)
#if AT_I2LOC_PRESET
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("SoulboundOnPickup"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Soulbound On Pickup", "", true);
#endif
            }
            if (item.sellable)
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Sellable"), "", true);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Sellable", "", true);
#endif
            }
            else
            {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Not Sellable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Not Sellable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

            }
            if ((item.itemType == "Weapon" || item.itemType == "Armor"))
                if (item.enchantId > 0)
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Enchantable"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Enchantable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Not Enchantable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Not Enchantable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif

                }
            if (item.maxDurability > 0)
            {
#if AT_I2LOC_PRESET
             UIAtavismTooltip.Instance.AddAdditionalAttribute2( I2.Loc.LocalizationManager.GetTranslation("Durability")+" ", item.durability + "/" + item.maxDurability, true, UIAtavismTooltip.Instance.itemTypeColour);
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2(" Durability", item.durability + "/" + item.maxDurability, true, UIAtavismTooltip.Instance.itemTypeColour);
#endif
                if (item.repairable)
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Repairable"), "", true);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Repairable", "", true);
#endif
                }
                else
                {
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Not Repairable"), "", true,UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2("Not Repairable", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                }
            }
            if (item.GetEffectPositionsOfTypes("ClaimObject").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int templateId = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("ClaimObject")[0]]);
                AtavismBuildObjectTemplate abot = WorldBuilder.Instance.GetBuildObjectTemplate(templateId);
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Claim Object")+" : " + I2.Loc.LocalizationManager.GetTranslation(abot.buildObjectName));
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Claim type") + " : " + I2.Loc.LocalizationManager.GetTranslation(abot.validClaimTypes.ToString()));
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int i = 0; i < abot.itemsReq.Count; i++)
            {
                AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                UIAtavismTooltip.Instance.AddAdditionalAttributeResource2(I2.Loc.LocalizationManager.GetTranslation(itemc.name), abot.itemsReqCount[i].ToString(),itemc.Icon,false);
            }
            UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
            if (abot.skill > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " "+ I2.Loc.LocalizationManager.GetTranslation("Skill") + " " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname), abot.skillLevelReq.ToString(),true);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+" " + I2.Loc.LocalizationManager.GetTranslation(skill.skillname),  abot.skillLevelReq.ToString() ,true, UIAtavismTooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                }
            }
            if (!abot.reqWeapon.Equals("~ none ~"))
            {
                if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"), I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon),true);
                else
                    UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("equiped weapon type"),  I2.Loc.LocalizationManager.GetTranslation(abot.reqWeapon) ,true, UIAtavismTooltip.Instance.itemStatLowerColour);
            }
#else
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Claim Object : " + abot.buildObjectName);
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Claim type : " + abot.validClaimTypes);
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Resources : ");
                for (int i = 0; i < abot.itemsReq.Count; i++)
                {
                    AtavismInventoryItem itemc = Inventory.Instance.GetItemByTemplateID(abot.itemsReq[i]);
                    UIAtavismTooltip.Instance.AddAdditionalAttributeResource2(itemc.name, abot.itemsReqCount[i].ToString(), itemc.Icon, false);
                }
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
                if (abot.skill > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(abot.skill);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(abot.skill) >= abot.skillLevelReq)
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Skill " + skill.skillname, abot.skillLevelReq.ToString(), true, UIAtavismTooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Building Object Skill " + abot.skill + " can't be found");
                    }
                }
                if (!abot.reqWeapon.Equals("~ none ~"))
                {
                    if (((string)ClientAPI.GetPlayerObject().GetProperty("weaponType")).Equals(abot.reqWeapon))
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required equiped weapon type: ", abot.reqWeapon, true);
                    else
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required equiped weapon type:", abot.reqWeapon, true, UIAtavismTooltip.Instance.itemStatLowerColour);
                }
#endif
                UIAtavismTooltip.Instance.SetAdditionalDescription2(tooltipDescription);
            }
            else if (item.GetEffectPositionsOfTypes("CraftsItem").Count > 0)
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();

#if AT_I2LOC_PRESET
            string tooltipDescription = I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip);
#else
                string tooltipDescription = item.tooltip;
#endif
                int craftingRecipeID = int.Parse(item.itemEffectValues[item.GetEffectPositionsOfTypes("CraftsItem")[0]]);
                AtavismCraftingRecipe recipe = Inventory.Instance.GetCraftingRecipe(craftingRecipeID);
                // Crafts <item>
                AtavismInventoryItem itemCrafted = Inventory.Instance.GetItemByTemplateID(recipe.createsItems[0]);
#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Crafts"), itemCrafted.name, true);
            UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2(I2.Loc.LocalizationManager.GetTranslation("Resources")+" : ");
            for (int r = 0; r < recipe.itemsReq.Count; r++)
            {
                 AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
               UIAtavismTooltip.Instance.AddAdditionalAttributeResource2(I2.Loc.LocalizationManager.GetTranslation("Items/" + it.name), recipe.itemsReqCounts[r].ToString(),it.Icon, false);
            }
            UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
            UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Station"), recipe.stationReq, true);
            if (recipe.skillID > 0)
            {
                Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                if (skill != null)
                {
                    if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2(I2.Loc.LocalizationManager.GetTranslation("Required")+" "+ I2.Loc.LocalizationManager.GetTranslation("Skill")+" "+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname), recipe.skillLevelReq.ToString(), true);
                    }
                    else
                    {
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2( I2.Loc.LocalizationManager.GetTranslation("Required") + " " + I2.Loc.LocalizationManager.GetTranslation("Skill")+""+ I2.Loc.LocalizationManager.GetTranslation(Skills.Instance.GetSkillByID(recipe.skillID).skillname) ,  recipe.skillLevelReq.ToString() , true, UIAtavismTooltip.Instance.itemStatLowerColour);
                    }
                }
                else
                {
                    Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                }
            }
          
#else
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Crafts", itemCrafted.name, true);
                UIAtavismTooltip.Instance.AddAdditionalAttributeTitle2("Resources : ");
                for (int r = 0; r < recipe.itemsReq.Count; r++)
                {
                    AtavismInventoryItem it = Inventory.Instance.GetItemByTemplateID(recipe.itemsReq[r]);
                    UIAtavismTooltip.Instance.AddAdditionalAttributeResource2(it.name, recipe.itemsReqCounts[r].ToString(), it.Icon, false);

                }
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
                UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Station", recipe.stationReq, true);
                if (recipe.skillID > 0)
                {
                    Skill skill = Skills.Instance.GetSkillByID(recipe.skillID);
                    if (skill != null)
                    {
                        if (Skills.Instance.GetPlayerSkillLevel(recipe.skillID) >= recipe.skillLevelReq)
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true);
                        }
                        else
                        {
                            UIAtavismTooltip.Instance.AddAdditionalAttribute2("Required Skill " + Skills.Instance.GetSkillByID(recipe.skillID).skillname, recipe.skillLevelReq.ToString(), true, UIAtavismTooltip.Instance.itemStatLowerColour);
                        }
                    }
                    else
                    {
                        Debug.LogError("Craft Skill " + recipe.skillID + " can't be found");
                    }
                }
#endif

                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();
                UIAtavismTooltip.Instance.SetAdditionalDescription2(tooltipDescription);
            //    showAdditionalTooltip2(recipe.createsItems[0]);
            }
            else
            {
                UIAtavismTooltip.Instance.AddAdditionalAttributeSeperator2();

#if AT_I2LOC_PRESET
            UIAtavismTooltip.Instance.SetAdditionalDescription2(I2.Loc.LocalizationManager.GetTranslation("Items/" + item.tooltip));
#else
                UIAtavismTooltip.Instance.SetAdditionalDescription2(item.tooltip);
#endif
            }
            //check ability ie learned
            if (item.GetEffectPositionsOfTypes("UseAbility").Count > 0)
            {
                if (item.name.IndexOf("TeachAbility") > -1)
                {
                    int abilityID = int.Parse(item.itemEffectNames[item.GetEffectPositionsOfTypes("UseAbility")[0]]);
                    AtavismAbility aa = Abilities.Instance.GetAbility(abilityID);
                    AtavismAbility paa = Abilities.Instance.GetPlayerAbility(abilityID);
                    if (paa != null)
                    {

#if AT_I2LOC_PRESET
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2( I2.Loc.LocalizationManager.GetTranslation("taught") , "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#else
                        UIAtavismTooltip.Instance.AddAdditionalAttribute2("Taught", "", true, UIAtavismTooltip.Instance.itemStatLowerColour);
#endif
                    }
                    aa.ShowUIAdditionalTooltip2();
                }
            }
            UIAtavismTooltip.Instance.ShowAdditionalTooltip2();
        }

        public void HideUITooltip()
        {
            UIAtavismTooltip.Instance.Hide();
            
        }




        public static string FirstCharToUpper(string input)
        {
            if (string.IsNullOrEmpty(input))
                return "";
            var arr = input.ToCharArray();
            arr[0] = char.ToUpperInvariant(arr[0]);
            return new string(arr);
        }

        public override Cooldown GetLongestActiveCooldown()
        {
            // Go through each item effect and see if it is an ability
            List<int> effectTypes = GetEffectPositionsOfTypes("UseAbility");
            foreach (int effectPos in effectTypes)
            {
                AtavismAbility ab = Abilities.Instance.GetAbility(int.Parse(itemEffectValues[effectPos]));
                if (ab != null)
                    return ab.GetLongestActiveCooldown();
            }

            return null;
        }

        private static byte ToByte(float f)
        {
            f = Mathf.Clamp01(f);
            return (byte)(f * 255);
        }

        /// <summary>
        /// Gets or sets the name of the base.
        /// </summary>
        /// <value>The name of the base.</value>

        #region Properties

        public Sprite Icon
        {
            get
            {
                Sprite icon = AtavismPrefabManager.Instance.GetItemIconByID(templateId);
                if (icon == null)
                {
                    return AtavismSettings.Instance.defaultItemIcon;
                }
                return icon;
            }
        }
        
        public string BaseName
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        public OID ItemId
        {
            get
            {
                return itemId;
            }
            set
            {
                itemId = value;
            }
        }

        public int TemplateId
        {
            get
            {
                return templateId;
            }
            set
            {
                templateId = value;
            }
        }

        public string Category
        {
            get
            {
                return category;
            }
            set
            {
                category = value;
            }
        }

        public string Subcategory
        {
            get
            {
                return subcategory;
            }
            set
            {
                subcategory = value;
            }
        }

        public int Count
        {
            get
            {
                return count /*- usedCount*/;
            }
            set
            {
                count = value;
            }
        }

        public int Quality
        {
            get
            {
                return quality;
            }
            set
            {
                quality = value;
            }
        }

        public int Binding
        {
            get
            {
                return binding;
            }
            set
            {
                binding = value;
            }
        }

        public bool IsBound
        {
            get
            {
                return isBound;
            }
            set
            {
                isBound = value;
            }
        }

        public bool Unique
        {
            get
            {
                return unique;
            }
            set
            {
                unique = value;
            }
        }

        public int StackLimit
        {
            get
            {
                return stackLimit;
            }
            set
            {
                stackLimit = value;
            }
        }

        public int CurrencyType
        {
            get
            {
                return currencyType;
            }
            set
            {
                currencyType = value;
            }
        }

        public long Cost
        {
            get
            {
                return cost;
            }
            set
            {
                cost = value;
            }
        }

        public bool Sellable
        {
            get
            {
                return sellable;
            }
            set
            {
                sellable = value;
            }
        }

        public int EnergyCost
        {
            get
            {
                return energyCost;
            }
            set
            {
                energyCost = value;
            }
        }

        public int Encumberance
        {
            get
            {
                return encumberance;
            }
            set
            {
                encumberance = value;
            }
        }

        public Dictionary<string, int> Resistances
        {
            get
            {
                return resistances;
            }
            set
            {
                resistances = value;
            }
        }

        public Dictionary<string, int> Stats
        {
            get
            {
                return stats;
            }
            set
            {
                stats = value;
            }
        }
        public Dictionary<string, int> EnchantStats
        {
            get
            {
                return enchantStats;
            }
            set
            {
                enchantStats = value;
            }
        }
        public Dictionary<string, Dictionary<int, int>> SocketSlots
        {
            get
            {
                return socketSlots;
            }
            set
            {
                socketSlots = value;
            }
        }
        public Dictionary<string, Dictionary<int, long>> SocketSlotsOid
        {
            get
            {
                return socketSlotsOid;
            }
            set
            {
                socketSlotsOid = value;
            }
        }

        public int DamageValue
        {
            get
            {
                return damageValue;
            }
            set
            {
                damageValue = value;
            }
        }
        public int DamageMaxValue
        {
            get
            {
                return damageMaxValue;
            }
            set
            {
                damageMaxValue = value;
            }
        }

        public string DamageType
        {
            get
            {
                return damageType;
            }
            set
            {
                damageType = value;
            }
        }

        public int WeaponSpeed
        {
            get
            {
                return weaponSpeed;
            }
            set
            {
                weaponSpeed = value;
            }
        }

        public int Durability
        {
            get
            {
                return durability;
            }
            set
            {
                durability = value;
            }
        }

        public int MaxDurability
        {
            get
            {
                return maxDurability;
            }
            set
            {
                maxDurability = value;
            }
        }

        public int Weight
        {
            get
            {
                 return weight;
            }
        }

        public int ReqLeval
        {
            get
            {
                return reqLevel;
            }
            set
            {
                reqLevel = value;
            }
        }
        public int SetId
        {
            get
            {
                return setId;
            }
            set
            {
                setId = value;
            }
        }
        public int EnchantId
        {
            get
            {
                return enchantId;
            }
            set
            {
                enchantId = value;
            }
        }
        #endregion Properties
    }
}

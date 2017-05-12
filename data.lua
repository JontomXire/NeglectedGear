-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear


NG_SlotID = {
    ["INVTYPE_HEAD"] = 1,
    ["INVTYPE_NECK"] = 2,
    ["INVTYPE_SHOULDER"] = 3,
    ["INVTYPE_BODY"] = 4,
    ["INVTYPE_CHEST"] = 5,
    ["INVTYPE_ROBE"] = 5,
    ["INVTYPE_WAIST"] = 6,
    ["INVTYPE_LEGS"] = 7,
    ["INVTYPE_FEET"] = 8,
    ["INVTYPE_WRIST"] = 9,
    ["INVTYPE_HAND"] = 10,
    ["INVTYPE_FINGER"] = 11,
    ["INVTYPE_TRINKET"] = 13,
    ["INVTYPE_CLOAK"] = 15,
    ["INVTYPE_WEAPON"] = 16,
    ["INVTYPE_2HWEAPON"] = 16,
    ["INVTYPE_WEAPONMAINHAND"] = 16,
    ["INVTYPE_WEAPONOFFHAND"] = 17,
    ["INVTYPE_HOLDABLE"] = 17,
    ["INVTYPE_SHIELD"] = 17,
    ["INVTYPE_RELIC"] = 18,
    ["INVTYPE_RANGED"] = 18,
    ["INVTYPE_THROWN"] = 18,
    ["INVTYPE_RANGEDRIGHT"] = 18
}


NG_Weightings = {
    ["Warrior"] = {
        ["ITEM_MOD_STRENGTH_SHORT"] = 10
    },
    ["Paladin"] = {
        ["ITEM_MOD_STRENGTH_SHORT"] = 10
    },
    ["Hunter"] = {
        ["ITEM_MOD_AGILITY_SHORT"] = 10
    },
    ["Rogue"] = {
        ["ITEM_MOD_AGILITY_SHORT"] = 10
    },
    ["Priest"] = {
        ["ITEM_MOD_INTELLECT_SHORT"] = 10
    },
    ["Death Knight"] = {
        ["ITEM_MOD_STRENGTH_SHORT"] = 10
    },
    ["Shaman"] = {
        ["ITEM_MOD_INTELLECT_SHORT"] = 10
    },
    ["Mage"] = {
        ["ITEM_MOD_INTELLECT_SHORT"] = 10
    },
    ["Warlock"] = {
        ["ITEM_MOD_INTELLECT_SHORT"] = 10
    },
    ["Druid"] = {
        ["ITEM_MOD_AGILITY_SHORT"] = 10
    }
}


-- Resistances
-- RESISTANCE0_NAME -- Armour
-- RESISTANCE1_NAME
-- RESISTANCE2_NAME -- Fire Resistance


-- Main stats
-- ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT
-- ITEM_MOD_STRENGTH_SHORT
-- ITEM_MOD_CRIT_RATING_SHORT
-- ITEM_MOD_STAMINA_SHORT
-- ITEM_MOD_AGILITY_SHORT
-- ITEM_MOD_INTELLECT_SHORT
-- ITEM_MOD_HIT_RATING_SHORT
-- ITEM_MOD_SPIRIT_SHORT
-- ITEM_MOD_SPELL_POWER_SHORT


-- Other stats on items, not currently used.
-- ITEM_MOD_DAMAGE_PER_SECOND_SHORT
-- EMPTY_SOCKET_RED
-- EMPTY_SOCKET_BLUE
-- EMPTY_SOCKET_YELLOW



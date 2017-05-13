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


-- See https://docs.google.com/spreadsheets/d/15YHsDfAZal5jUzaUE6rG8dMGsbqkeuTiY7MQbg2Awf8/edit#gid=1379405445
NG_Weightings = {
    ["Warrior"] = {
        ["Arms"] = {
        },
        ["Fury"] = {
        },
        ["Protection"] = {
        }
    },
    ["Paladin"] = {
        ["Holy"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 100,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 46,
            ["ITEM_MOD_HASTE_SHORT"] = 35,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 58,
            ["ITEM_MOD_MANA_REGEN_SHORT"] = 88,
            ["EMPTY_SOCKET_RED"] = 4,
            ["EMPTY_SOCKET_BLUE"] = 3.5,
            ["EMPTY_SOCKET_YELLOW"] = 6.4,
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Protection"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 16,
            ["ITEM_MOD_AGILITY_SHORT"] = 60,
            ["ITEM_MOD_STAMINA_SHORT"] = 100,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 80,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 59,
            ["RESISTANCE0_NAME"] = 8,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT"] = 45,
            ["ITEM_MOD_DODGE_RATING_SHORT"] = 55,
            ["ITEM_MOD_PARRY_RATING_SHORT"] = 30,
            ["EMPTY_SOCKET_RED"] = 4.4,
            ["EMPTY_SOCKET_BLUE"] = 4,
            ["EMPTY_SOCKET_YELLOW"] = 6.2,
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Retribution"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 80,
            ["ITEM_MOD_AGILITY_SHORT"] = 32,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 100,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 40,
            ["Haste"] = 30,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 34,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 66,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 22,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 9,
            ["EMPTY_SOCKET_RED"] = 1.6,
            ["EMPTY_SOCKET_BLUE"] = 1.8,
            ["EMPTY_SOCKET_YELLOW"] = 0.9,
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Hunter"] = {
    },
    ["Rogue"] = {
    },
    ["Priest"] = {
    },
    ["Death Knight"] = {
    },
    ["Shaman"] = {
    },
    ["Mage"] = {
    },
    ["Warlock"] = {
    },
    ["Druid"] = {
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
-- ITEM_MOD_ATTACK_POWER_SHORT
-- ITEM_MOD_SPELL_POWER_SHORT
-- ITEM_MOD_DEFENSE_SKILL_SHORT
-- ITEM_MOD_BLOCK_VALUE_SHORT
-- ITEM_MOD_EXPERTISE_RATING_SHORT
-- ITEM_MOD_DODGE_RATING_SHORT
-- ITEM_MOD_PARRY_RATING_SHORT
-- Mana regen??
-- Haste??


-- Other stats on items, not currently used.
-- ITEM_MOD_DAMAGE_PER_SECOND_SHORT
-- EMPTY_SOCKET_RED
-- EMPTY_SOCKET_BLUE
-- EMPTY_SOCKET_YELLOW
-- EMPTY_SOCKET_META



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
            ["ITEM_MOD_INTELLECT_SHORT"] = 10,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.6,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3.5,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 5.8,
            ["ITEM_MOD_MANA_REGEN_SHORT"] = 8.8,
            ["EMPTY_SOCKET_RED"] = 200,
            ["EMPTY_SOCKET_BLUE"] = 200,
            ["EMPTY_SOCKET_YELLOW"] = 200,
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Protection"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 1.6,
            ["ITEM_MOD_AGILITY_SHORT"] = 6,
            ["ITEM_MOD_STAMINA_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 8,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 5.9,
            ["RESISTANCE0_NAME"] = 0.8,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT"] = 7,
            ["ITEM_MOD_DODGE_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_PARRY_RATING_SHORT"] = 3,
            ["ITEM_MOD_BLOCK_VALUE_SHORT"] = 6,
            ["ITEM_MOD_BLOCK_RATING_SHORT"] = 7,
            ["EMPTY_SOCKET_RED"] = 210,
            ["EMPTY_SOCKET_BLUE"] = 170,
            ["EMPTY_SOCKET_YELLOW"] = 300,
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Retribution"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 8,
            ["ITEM_MOD_AGILITY_SHORT"] = 3.2,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.4,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 6.6,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 2.2,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 0.9,
            ["EMPTY_SOCKET_RED"] = 160,
            ["EMPTY_SOCKET_BLUE"] = 160,
            ["EMPTY_SOCKET_YELLOW"] = 120,
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
        ["Restoration"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 3.5,
            ["ITEM_MOD_SPIRIT_SHORT"] = 1,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 6.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 8.5,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 10,
            ["ITEM_MOD_POWER_REGEN0_SHORT"] = 7.7,
            ["EMPTY_SOCKET_RED"] = 205,
            ["EMPTY_SOCKET_BLUE"] = 170,
            ["EMPTY_SOCKET_YELLOW"] = 123.5,
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Elemental"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 8,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.6,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 6,
            ["EMPTY_SOCKET_RED"] = 138,
            ["EMPTY_SOCKET_BLUE"] = 73.5,
            ["EMPTY_SOCKET_YELLOW"] = 128,
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Enhancement"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 3.5,
            ["ITEM_MOD_AGILITY_SHORT"] = 5.5,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 5.5,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.2,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 8.4,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 2.6,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 2.9,
            ["EMPTY_SOCKET_RED"] = 110,
            ["EMPTY_SOCKET_BLUE"] = 110,
            ["EMPTY_SOCKET_YELLOW"] = 110,
            ["EMPTY_SOCKET_META"] = 0
        }
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
-- RESISTANCE3_NAME
-- RESISTANCE4_NAME
-- RESISTANCE5_NAME -- Shadow Resistance


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
-- ITEM_MOD_DEFENSE_SKILL_RATING_SHORT
-- ITEM_MOD_BLOCK_VALUE_SHORT
-- ITEM_MOD_HASTE_RATING_SHORT
-- ITEM_MOD_EXPERTISE_RATING_SHORT
-- ITEM_MOD_DODGE_RATING_SHORT
-- ITEM_MOD_PARRY_RATING_SHORT
-- ITEM_MOD_BLOCK_RATING_SHORT
-- ITEM_MOD_POWER_REGEN0_SHORT


-- Other stats on items, not currently used.
-- ITEM_MOD_DAMAGE_PER_SECOND_SHORT
-- EMPTY_SOCKET_RED
-- EMPTY_SOCKET_BLUE
-- EMPTY_SOCKET_YELLOW
-- EMPTY_SOCKET_META



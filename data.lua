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
        ["ITEM_MOD_STRENGTH_SHORT"] = 10,
        ["Arms"] = {
            ["ITEM_MOD_HIT_RATING_SHORT"] = 6,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_EXPERTISE_SHORT"] = 5,
            ["ITEM_MOD_EXPERTISE_SHORT_CAP"] = 26,
            ["ITEM_MOD_STRENGTH_SHORT"] = 4,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3,
            ["ITEM_MOD_AGILITY_SHORT"] = 2,
            ["ITEM_MOD_HASTE_SHORT"] = 1
        },
        ["Fury"] = {
            ["ITEM_MOD_HIT_RATING_SHORT"] = 6,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 131,
            ["ITEM_MOD_EXPERTISE_SHORT"] = 5,
            ["ITEM_MOD_EXPERTISE_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 4,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT_CAP"] = 1400,
            ["ITEM_MOD_STRENGTH_SHORT"] = 3,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 2,
            ["ITEM_MOD_HASTE_SHORT"] = 1
        },
        ["Protection"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 6,
            ["Defence"] = 5,
            ["Defence_CAP"] = 565,
            ["ITEM_MOD_Dodge_SHORT"] = 4,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 3,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 236,
            ["ITEM_MOD_EXPERTISE_SHORT"] = 2,
            ["ITEM_MOD_EXPERTISE_SHORT_CAP"] = 26,
            ["ITEM_MOD_PARRY_SHORT"] = 1,
        }
    },
    ["Paladin"] = {
        ["ITEM_MOD_STRENGTH_SHORT"] = 10,
        ["Holy"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 6,
            ["ITEM_MOD_HASTE_SHORT"] = 5,
            ["ITEM_MOD_MANA_REGEN_SHORT"] = 4,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 3,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 2,
        },
        ["Protection"] = {
        },
        ["Retribution"] = {
        }
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
-- ITEM_MOD_ATTACK_POWER_SHORT
-- ITEM_MOD_SPELL_POWER_SHORT
-- ITEM_MOD_DEFENSE_SKILL_SHORT
-- ITEM_MOD_BLOCK_VALUE_SHORT
-- Expertise?
-- ITEM_MOD_DODGE_RATING_SHORT
-- ITEM_MOD_PARRY_RATING_SHORT
-- Mana regen??


-- Other stats on items, not currently used.
-- ITEM_MOD_DAMAGE_PER_SECOND_SHORT
-- EMPTY_SOCKET_RED
-- EMPTY_SOCKET_BLUE
-- EMPTY_SOCKET_YELLOW



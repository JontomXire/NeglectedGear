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


NG_HitType = {
    ["Warrior"] = {
        ["Arms"] = CR_HIT_MELEE,
        ["Fury"] = CR_HIT_MELEE,
        ["Protection"] = CR_HIT_MELEE
    },
    ["Paladin"] = {
        ["Holy"] = CR_HIT_SPELL,
        ["Protection"] = CR_HIT_MELEE,
        ["Retribution"] = CR_HIT_MELEE
    },
    ["Hunter"] = {
        ["Beast Mastery"] = CR_HIT_RANGED,
        ["Marksmanship"] = CR_HIT_RANGED,
        ["Survival"] = CR_HIT_RANGED
    },
    ["Rogue"] = {
        ["Assassination"] = CR_HIT_MELEE,
        ["Combat"] = CR_HIT_MELEE,
        ["Subtlety"] = CR_HIT_MELEE
    },
    ["Priest"] = {
        ["Discipline"] = CR_HIT_SPELL,
        ["Holy"] = CR_HIT_SPELL,
        ["Shadow"] = CR_HIT_SPELL
    },
    ["Death Knight"] = {
        ["Blood_DPS"] = CR_HIT_MELEE,
        ["Blood_TANK"] = CR_HIT_MELEE,
        ["Frost"] = CR_HIT_MELEE,
        ["Unholy"] = CR_HIT_MELEE
    },
    ["Shaman"] = {
        ["Elemental"] = CR_HIT_SPELL,
        ["Enhancement"] = CR_HIT_MELEE,
        ["Restoration"] = CR_HIT_SPELL
    },
    ["Mage"] = {
        ["Arcane"] = CR_HIT_SPELL,
        ["Fire"] = CR_HIT_SPELL,
        ["Frost"] = CR_HIT_SPELL
    },
    ["Warlock"] = {
        ["Affliction"] = CR_HIT_SPELL,
        ["Demonology"] = CR_HIT_SPELL,
        ["Destruction"] = CR_HIT_SPELL
    },
    ["Druid"] = {
        ["Balance"] = CR_HIT_SPELL,
        ["Feral_TANK"] = CR_HIT_MELEE,
        ["Feral_DPS"] = CR_HIT_MELEE,
        ["Restoration"] = CR_HIT_SPELL
    }
}


-- See https://docs.google.com/spreadsheets/d/15YHsDfAZal5jUzaUE6rG8dMGsbqkeuTiY7MQbg2Awf8/edit#gid=1379405445
NG_Weightings = {
    ["Warrior"] = {
        ["Arms"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 9,
            ["ITEM_MOD_AGILITY_SHORT"] = 6.5,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 8,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 4.5,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 9.5,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 6,
            ["RESISTANCE0_NAME"] = 0.1,
            ["EMPTY_SOCKET_RED"] = 180, -- Strength Gem
            ["EMPTY_SOCKET_BLUE"] = 180, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 170, -- Strength / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Fury"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 8.2,
            ["ITEM_MOD_AGILITY_SHORT"] = 5.3,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 4,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 131,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 5.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3.6,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.1,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 10,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 8.5,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT_CAP"] = 1400,
            ["RESISTANCE0_NAME"] = 0.5,
            ["EMPTY_SOCKET_RED"] = 170, -- Armor Penetration Gem
            ["EMPTY_SOCKET_BLUE"] = 170, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 134, -- Strength / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Protection"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 4.8,
            ["ITEM_MOD_AGILITY_SHORT"] = 6.7,
            ["ITEM_MOD_STAMINA_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 236,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 0.7,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 1,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 0.1,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 9.2,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 1,
            ["RESISTANCE0_NAME"] = 0.6,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT"] = 9,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT_CAP"] = 565,
            ["ITEM_MOD_DODGE_RATING_SHORT"] = 8.6,
            ["ITEM_MOD_PARRY_RATING_SHORT"] = 6.7,
            ["ITEM_MOD_BLOCK_VALUE_SHORT"] = 8.1,
            ["ITEM_MOD_BLOCK_RATING_SHORT"] = 4.8,
            ["EMPTY_SOCKET_RED"] = 217, -- Parry / Stamina Gem
            ["EMPTY_SOCKET_BLUE"] = 240, -- Defense / Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 240, -- Defense / Stamina Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Paladin"] = {
        ["Holy"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 10,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.6,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3.5,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 5.8,
            ["ITEM_MOD_POWER_REGEN0_SHORT"] = 8.8,
            ["EMPTY_SOCKET_RED"] = 200, -- Intellect Gem
            ["EMPTY_SOCKET_BLUE"] = 200, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 200, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Protection"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 1.6,
            ["ITEM_MOD_AGILITY_SHORT"] = 6,
            ["ITEM_MOD_STAMINA_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 8,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 263,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 5.9,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["RESISTANCE0_NAME"] = 0.8,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT"] = 7,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT_CAP"] = 664,
            ["ITEM_MOD_DODGE_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_PARRY_RATING_SHORT"] = 3,
            ["ITEM_MOD_BLOCK_VALUE_SHORT"] = 6,
            ["ITEM_MOD_BLOCK_RATING_SHORT"] = 7,
            ["EMPTY_SOCKET_RED"] = 210, -- Agility / Stamina Gem
            ["EMPTY_SOCKET_BLUE"] = 300, -- Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 170, -- Defense / Stamina Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Retribution"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 8,
            ["ITEM_MOD_AGILITY_SHORT"] = 3.2,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.4,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 6.6,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 2.2,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 0.9,
            ["EMPTY_SOCKET_RED"] = 160, -- Strength Gem
            ["EMPTY_SOCKET_BLUE"] = 160, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 120, -- Strength / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Hunter"] = {
        ["Beast Mastery"] = {
            ["ITEM_MOD_AGILITY_SHORT"] = 5.8,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 3.7,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 2.1,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3.2,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 4,
            ["EMPTY_SOCKET_RED"] = 116, -- Agility Gem
            ["EMPTY_SOCKET_BLUE"] = 116, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 64, -- Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Marksmanship"] = {
            ["ITEM_MOD_AGILITY_SHORT"] = 7.4,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 3.9,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 2.4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 4.2,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 6,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 8,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT_CAP"] = 800,
            ["EMPTY_SOCKET_RED"] = 160, -- Armor Penetration Gem
            ["EMPTY_SOCKET_BLUE"] = 160, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 84, -- Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Survival"] = {
            ["ITEM_MOD_AGILITY_SHORT"] = 7.6,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 3.5,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 2.6,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 6,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 3.1,
            ["EMPTY_SOCKET_RED"] = 152, -- Agility Gem
            ["EMPTY_SOCKET_BLUE"] = 77.5, -- Agility / Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 84, -- Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Rogue"] = {
        ["Assassination"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 3.2,
            ["ITEM_MOD_AGILITY_SHORT"] = 6,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 8.3,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 315,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 6.4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 8.1,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 8.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT_CAP"] = 4000,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 8.7,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 6.5,
            ["EMPTY_SOCKET_RED"] = 251, -- Attack Power / Haste Gem
            ["EMPTY_SOCKET_BLUE"] = 251, -- Used for activating Meta gem, socket with Orange gem.
            ["EMPTY_SOCKET_YELLOW"] = 251, -- Attack Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Combat"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 3.2,
            ["ITEM_MOD_AGILITY_SHORT"] = 6,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 8,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 315,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 6.8,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 7.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 5,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 8.2,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 21,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 10,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT_CAP"] = 1400,
            ["EMPTY_SOCKET_RED"] = 200, -- Armor Penetration Gem
            ["EMPTY_SOCKET_BLUE"] = 200, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 135, -- Agility / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Subtlety"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 3.2,
            ["ITEM_MOD_AGILITY_SHORT"] = 10,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 8,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 315,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 6.5,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 7.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 5,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 7.5,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 7.5,
            ["EMPTY_SOCKET_RED"] = 200, -- Agility Gem
            ["EMPTY_SOCKET_BLUE"] = 200, -- Used for activating Meta gem, socket with Orange gem.
            ["EMPTY_SOCKET_YELLOW"] = 175, -- Agility / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Priest"] = {
        ["Discipline"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 6.5,
            ["ITEM_MOD_SPIRIT_SHORT"] = 2.2,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 5.9,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 4.8,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 10,
            ["ITEM_MOD_POWER_REGEN0_SHORT"] = 6.7,
            ["EMPTY_SOCKET_RED"] = 200, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 153.5, -- Spell Power / Mp5 Gem
            ["EMPTY_SOCKET_YELLOW"] = 185, -- Intellect / Spell Power Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Holy"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 6.9,
            ["ITEM_MOD_SPIRIT_SHORT"] = 5.2,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3.1,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3.8,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 7,
            ["ITEM_MOD_POWER_REGEN0_SHORT"] = 3,
            ["EMPTY_SOCKET_RED"] = 161, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 136, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 107, -- Intellect / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Shadow"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 1.6,
            ["ITEM_MOD_SPIRIT_SHORT"] = 1.6,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 289,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 5,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.4,
            ["ITEM_MOD_HASTE_RATING_SHORT_CAP"] = 1250,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 7.6,
            ["EMPTY_SOCKET_RED"] = 174.8, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 107.2, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 145.2, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Death Knight"] = {
        ["Blood_DPS"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 9.9,
            ["ITEM_MOD_AGILITY_SHORT"] = 4.2,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 9.1,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 5.7,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.6,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 9,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 10,
            ["RESISTANCE0_NAME"] = 1,
            ["EMPTY_SOCKET_RED"] = 200, -- Armor Penetration Gem
            ["EMPTY_SOCKET_BLUE"] = 200, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 156, -- Strength / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Blood_TANK"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 3.1,
            ["ITEM_MOD_AGILITY_SHORT"] = 6.9,
            ["ITEM_MOD_STAMINA_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 8,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 7,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 2.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 1.6,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 0.8,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 2.6,
            ["RESISTANCE0_NAME"] = 1.8,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT"] = 9,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT_CAP"] = 540,
            ["ITEM_MOD_DODGE_RATING_SHORT"] = 5,
            ["ITEM_MOD_PARRY_RATING_SHORT"] = 4.33,
            ["EMPTY_SOCKET_RED"] = 300, -- Used for activating Meta gem, socket with Blue gem.
            ["EMPTY_SOCKET_BLUE"] = 300, -- Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 300, -- Used for activating Meta gem, socket with Blue gem.
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Frost"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 9.7,
            ["ITEM_MOD_AGILITY_SHORT"] = 1.9,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 165,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 6.1,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 2.8,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.5,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 9.9,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 4.5,
            ["RESISTANCE0_NAME"] = 1,
            ["EMPTY_SOCKET_RED"] = 194, -- Strength Gem
            ["EMPTY_SOCKET_BLUE"] = 194, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 158, -- Strength / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Unholy"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 10,
            ["ITEM_MOD_AGILITY_SHORT"] = 2.6,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 6.6,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3.6,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 4.8,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.2,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 5.1,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 4.5,
            ["RESISTANCE0_NAME"] = 1,
            ["EMPTY_SOCKET_RED"] = 200, -- Strength Gem
            ["EMPTY_SOCKET_BLUE"] = 148, -- Strength / Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 101, -- Strength / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Shaman"] = {
        ["Elemental"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 8,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 367,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.6,
            ["ITEM_MOD_HASTE_RATING_SHORT_CAP"] = 1100,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 6,
            ["EMPTY_SOCKET_RED"] = 138, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 73.5, -- Spell Power / Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 128, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Enhancement"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 3.5,
            ["ITEM_MOD_AGILITY_SHORT"] = 5.5,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 5.5,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 446,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 3.2,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 8.4,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 2.6,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 2.9,
            ["EMPTY_SOCKET_RED"] = 110, -- Agility Gem
            ["EMPTY_SOCKET_BLUE"] = 110, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 110, -- Agility / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Restoration"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 3.5,
            ["ITEM_MOD_SPIRIT_SHORT"] = 1,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 6.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 8.5,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 10,
            ["ITEM_MOD_POWER_REGEN0_SHORT"] = 7.7,
            ["EMPTY_SOCKET_RED"] = 205, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_BLUE"] = 170, -- Haste / Mp5 Gem
            ["EMPTY_SOCKET_YELLOW"] = 123.5, -- Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Mage"] = {
        ["Arcane"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 3.1,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_SPIRIT_SHORT"] = 3.2,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 289,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3.7,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.4,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 7.2,
            ["EMPTY_SOCKET_RED"] = 165.6, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 118.4, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 140.4, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Fire"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 1.3,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_SPIRIT_SHORT"] = 2.4,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 367,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 4.3,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 6.5,
            ["EMPTY_SOCKET_RED"] = 133, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 79, -- Crit / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 133, -- Spell Power / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Frost"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 0.6,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_SPIRIT_SHORT"] = 1.5,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 367,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 1.9,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 4.2,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 3.9,
            ["EMPTY_SOCKET_RED"] = 89.7, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 57, -- Haste / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 88.8, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Warlock"] = {
        ["Affliction"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 1.5,
            ["ITEM_MOD_SPIRIT_SHORT"] = 3.8,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 367,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3.4,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 6.1,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 7.2,
            ["EMPTY_SOCKET_RED"] = 165.6, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 124.4, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 147.4, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Demonology"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 1.3,
            ["ITEM_MOD_SPIRIT_SHORT"] = 2.9,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 446,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3.1,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5,
            ["ITEM_MOD_HASTE_RATING_SHORT_CAP"] = 1370,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 6,
            ["EMPTY_SOCKET_RED"] = 138, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 101, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 122, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Destruction"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 1.3,
            ["ITEM_MOD_SPIRIT_SHORT"] = 2.6,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 446,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 1.6,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 4.6,
            ["ITEM_MOD_HASTE_RATING_SHORT_CAP"] = 1600,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 4.7,
            ["EMPTY_SOCKET_RED"] = 108.1, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 82.4, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 102.4, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
    },
    ["Druid"] = {
        ["Balance"] = {
            ["ITEM_MOD_INTELLECT_SHORT"] = 2.2,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_SPIRIT_SHORT"] = 2.2,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.3,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.4,
            ["ITEM_MOD_HASTE_RATING_SHORT_CAP"] = 585,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 6.6,
            ["EMPTY_SOCKET_RED"] = 151.8, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 101.2, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 133.2, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Feral_TANK"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 1,
            ["ITEM_MOD_AGILITY_SHORT"] = 7.5,
            ["ITEM_MOD_STAMINA_SHORT"] = 10,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 9,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 9,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 3,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 4,
            ["RESISTANCE0_NAME"] = 5.7,
            ["ITEM_MOD_DEFENSE_SKILL_SHORT"] = 6,
            ["ITEM_MOD_DODGE_RATING_SHORT"] = 6.5,
            ["EMPTY_SOCKET_RED"] = 300, -- Used for activating Meta gem, socket with Blue gem.
            ["EMPTY_SOCKET_BLUE"] = 300, -- Stamina Gem
            ["EMPTY_SOCKET_YELLOW"] = 300, -- Used for activating Meta gem, socket with Blue gem.
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Feral_DPS"] = {
            ["ITEM_MOD_STRENGTH_SHORT"] = 8,
            ["ITEM_MOD_AGILITY_SHORT"] = 10,
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_HIT_RATING_SHORT"] = 6,
            ["ITEM_MOD_HIT_RATING_SHORT_CAP"] = 264,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 5.5,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 3.5,
            ["ITEM_MOD_ATTACK_POWER_SHORT"] = 4,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT"] = 5.8,
            ["ITEM_MOD_EXPERTISE_RATING_SHORT_CAP"] = 26,
            ["ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT"] = 9,
            ["EMPTY_SOCKET_RED"] = 180, -- Armor Penetration Gem
            ["EMPTY_SOCKET_BLUE"] = 180, -- Used for activating Meta gem, socket with Red gem.
            ["EMPTY_SOCKET_YELLOW"] = 155, -- Agility / Crit Gem
            ["EMPTY_SOCKET_META"] = 0
        },
        ["Restoration"] = {
            ["ITEM_MOD_STAMINA_SHORT"] = 0.1,
            ["ITEM_MOD_INTELLECT_SHORT"] = 5.1,
            ["ITEM_MOD_SPIRIT_SHORT"] = 6.2,
            ["ITEM_MOD_CRIT_RATING_SHORT"] = 4.2,
            ["ITEM_MOD_HASTE_RATING_SHORT"] = 5.7,
            ["ITEM_MOD_HASTE_RATING_SHORT_CAP"] = 585,
            ["ITEM_MOD_SPELL_POWER_SHORT"] = 10,
            ["ITEM_MOD_POWER_REGEN0_SHORT"] = 5.5,
            ["EMPTY_SOCKET_RED"] = 230, -- Spell Power Gem
            ["EMPTY_SOCKET_BLUE"] = 182, -- Spell Power / Spirit Gem
            ["EMPTY_SOCKET_YELLOW"] = 177, -- Spell Power / Haste Gem
            ["EMPTY_SOCKET_META"] = 0
        }
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
-- ITEM_MOD_HASTE_RATING_SHORT
-- ITEM_MOD_EXPERTISE_RATING_SHORT
-- ITEM_MOD_DODGE_RATING_SHORT
-- ITEM_MOD_PARRY_RATING_SHORT
-- Mana regen??


-- Other stats on items, not currently used.
-- ITEM_MOD_DAMAGE_PER_SECOND_SHORT
-- EMPTY_SOCKET_RED
-- EMPTY_SOCKET_BLUE
-- EMPTY_SOCKET_YELLOW
-- EMPTY_SOCKET_META



-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear
local AceConfigDialog = LibStub("AceConfigDialog-3.0")


function NeglectedGear:InitSettings()
  NeglectedGearDB = {};
  NeglectedGearCharDB = {};

  NeglectedGearDB.major_version = NeglectedGear.major_version;
  NeglectedGearDB.minor_version = NeglectedGear.minor_version;
  NeglectedGearCharDB.major_version = NeglectedGear.major_version;
  NeglectedGearCharDB.minor_version = NeglectedGear.minor_version;

  NeglectedGearDB.debug = { [1] = false, [2] = false, [3] = false };

  local options = {
    type = 'group',
    name = "Neglected Gear",
    args = {
      General = {
        order = 1;
        type = "group",
        name = "General Settings",
        desc = "General settings",
        args = {
          debug = {
            order = 1,
            type = "multiselect",
            name = "Debug",
            desc = "Enable different levels of debug",
            values = { [1]="Level 1", [2]="Level 2", [3]="Level 3" },
            get = function(info, index) return NeglectedGearDB.debug[index]; end,
            set = function(info, index, val) NeglectedGearDB.debug[index] = val; end
          },
        }
      }
    }
  };

  LibStub("AceConfig-3.0"):RegisterOptionsTable("NeglectedGear", options);
  AceConfigDialog:AddToBlizOptions("NeglectedGear", "Neglected Gear", nil, "General");
end

function NeglectedGear:UpdateSettings()
  -- When we get a major version change, use this function
  -- to update the settings structure if necessary.

  NeglectedGearDB.major_version = NeglectedGear.major_version;
  NeglectedGearDB.minor_version = NeglectedGear.minor_version;
  NeglectedGearCharDB.major_version = NeglectedGear.major_version;
  NeglectedGearCharDB.minor_version = NeglectedGear.minor_version;
end




-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


NeglectedGear = {}
local NeglectedGear = _G.NeglectedGear


NeglectedGear.event_queue = {};


function NeglectedGear:TestItem(item)
    if strsub(item, 1, 5) ~= "item:"
    then
        item = "item:" .. tostring(tonumber(item));
    end

    if not IsEquippableItem(item)
    then
        NeglectedGear:ChatMessage("Error: " .. item .. " is not equippable.");
        return;
    end

    local name, _, _, _, _, _, _, _, loc = GetItemInfo(item);
    if nil == name
    then
        NeglectedGear:ChatMessage("Error: " .. item .. " is not a valid item link.");
        return;
    end

    NeglectedGear:Initialise(name);

    local _, old_item_1, diff_1, old_item_2, diff_2 = NeglectedGear:GetItemValues(item, "player");

    NeglectedGear:AddRow(GetUnitName('player'), old_item_1, diff_1, old_item_2, diff_2)

    SendAddonMessage("NG_QUERY", item, "RAID");
end


function SlashCmdList.NG(msg, editbox)
    local cmd, rest = msg:match("^(%S*)%s*(.-)$");

    if cmd:lower() == "test"
    then
        NeglectedGear:TestItem(rest);

    elseif cmd:lower() == "check"
    then
        if strsub(rest, 1, 5) ~= "item:"
        then
            rest = "item:" .. tostring(tonumber(rest));
        end

        if IsUsableItem(rest)
        then
            NeglectedGear:DebugMessage(3, "You can use that.");
        else
            NeglectedGear:DebugMessage(3, "You cannot use that.");
        end

    elseif cmd:lower() == "warn"
    then
        NeglectedGear:ShowWarning(rest);

    elseif cmd:lower() == "findapi"
    then
        for key, _ in pairs(_G)
        do
            if string.find(key, rest)
            then
                NeglectedGear:DebugMessage(1, key);
            end
        end

    elseif cmd:lower() == "hide"
    then
        NeglectedGear.frame:Hide();

    else
        NeglectedGear:DebugMessage(3, "Invalid command \""..(cmd or "NIL").."\".");
    end
end


function NeglectedGear_OnLoad(self)
    NeglectedGear:InitSettings();

    self:RegisterEvent("PLAYER_LOGIN");
    self:RegisterEvent("PLAYER_REGEN_ENABLED");
    self:RegisterEvent("PLAYER_REGEN_DISABLED");
    self:RegisterEvent("CHAT_MSG_ADDON");
    self:RegisterEvent("OPEN_MASTER_LOOT_LIST");
    self:RegisterEvent("UPDATE_MASTER_LOOT_LIST");

    GameTooltip:HookScript("OnTooltipSetItem", NeglectedGear_HookSetItem)
    ShoppingTooltip1:HookScript("OnTooltipSetItem", NeglectedGear_HookCompareItem)
    ShoppingTooltip2:HookScript("OnTooltipSetItem", NeglectedGear_HookCompareItem2)
    ItemRefTooltip:HookScript("OnTooltipSetItem", NeglectedGear_HookRefItem)

    NeglectedGear:CreateFrame();

    -- Set up CLI.
    _G["SLASH_NG1"] = "/ng";

    NeglectedGear:ChatMessage("Welcome to the Neglected Gear add-on version "..NeglectedGear.major_version.."."..NeglectedGear.minor_version..".");
end

function NeglectedGear_OnEvent(self, event, ...)
    local arg1, arg2, arg3, arg4, arg5, arg6 = ...;
    local timestamp = GetTime();

    NeglectedGear:DebugMessage(1, "Event \""..event.."\" received.");

    if event == "PLAYER_LOGIN"
    then
        NeglectedGear:UpdateSettings();
        NeglectedGear.in_combat = false;

    elseif event == "PLAYER_REGEN_ENABLED"
    then
        NeglectedGear.in_combat = false;

    elseif event == "PLAYER_REGEN_DISABLED"
    then
        NeglectedGear.in_combat = true;

    elseif event == "CHAT_MSG_ADDON"
    then
        if arg1 == "NG_QUERY"
        then
            if not UnitIsUnit(arg4, "player")
            then
                local name, old_item_1, diff_1, old_item_2, diff_2 = NeglectedGear:GetItemValues(arg2, "player");
                if name
                then
                    if old_item_2
                    then
                        SendAddonMessage("NG_REPLY", old_item_1 .. "@" .. tostring(diff_1) .. "@" .. old_item_2 .. "@" .. tostring(diff_2), "WHISPER", arg4);
                    else
                        SendAddonMessage("NG_REPLY", old_item_1 .. "@" .. tostring(diff_1), "WHISPER", arg4);
                    end
                end
            end

        elseif arg1 == "NG_REPLY"
        then
            local old_item_1, diff_1, rest = arg2:match("^([^@]*)@([^@]*)@*(.-)$");
            local old_item_2 = nil;
            local diff_2 = nil;

            if rest
            then
                old_item_2, diff_2, rest = rest:match("^([^@]*)@([^@]*)@*(.-)$");
            end
            NeglectedGear:AddRow(GetUnitName(arg4), old_item_1, diff_1, old_item_2, diff_2)
        end

    elseif (event == "OPEN_MASTER_LOOT_LIST") or (event == "UPDATE_MASTER_LOOT_LIST")
    then
        item = GetLootSlotLink(LootFrame.selectedSlot);
        item = item:match("^.*(item:[0-9]*):.*");

        if IsEquippableItem(item)
        then
            NeglectedGear:ChatMessage("Item is " .. item .. ".");

            NeglectedGear:Initialise(LootFrame.selectedItemName);

            local i = 1;
            local candidate = GetMasterLootCandidate(i);

            while nil ~= candidate
            do
                if UnitIsUnit(candidate, "player")
                then
                    local _, old_item_1, diff_1, old_item_2, diff_2 = NeglectedGear:GetItemValues(item, "player");

                    NeglectedGear:AddRow(GetUnitName('player'), old_item_1, diff_1, old_item_2, diff_2)
                else
                    SendAddonMessage("NG_QUERY", item, "WHISPER", candidate);
                end

                i = i + 1;
                candidate =  GetMasterLootCandidate(i);
            end
        end

    elseif event == "HIDE_WARNING"
    then
        NeglectedGear:HideWarning();

    else
        NeglectedGear:ChatMessage("Event "..event.."("..GetTime().."). Args are "..(arg1 or "nil")..", "..(arg2 or "nil")..", "..(arg3 or "nil")..".");
    end
end


function NeglectedGear:PostEvent(event, delay)
    local entry = {};

    entry.event = event;
    entry.remaining = delay;

    NeglectedGear:DebugMessage(2, "Posting event "..event.." with "..string.format("%0.03f", entry.remaining).." seconds delay.");
    NeglectedGear.event_queue[event] = entry;
end


function NeglectedGear:CancelPostedEvent(event)
    NeglectedGear.event_queue[event] = nil;
end


function NeglectedGear_OnUpdate(self, elapsed)
    local event, entry;

    if(NeglectedGear.event_queue)
    then
        for event,entry in pairs(NeglectedGear.event_queue)
        do
            entry.remaining = entry.remaining - elapsed;
            if(0 >= entry.remaining)
            then
                NeglectedGear.event_queue[event] = nil;
                NeglectedGear:DebugMessage(2, "Posting event "..event);
                NeglectedGear_OnEvent(self, event);
            end
        end
    end
end



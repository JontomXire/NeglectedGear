-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


NeglectedGear = {}
local NeglectedGear = _G.NeglectedGear


NeglectedGear.major_version = 0;
NeglectedGear.minor_version = 2;

NeglectedGear.event_queue = {};


function NeglectedGear:TestItem(item)
    if strsub(item, 1, 5) ~= "item:"
    then
        item = "item:" .. tostring(tonumber(item));
    end

    local name, display_str = NeglectedGear:GetItemString(item, "player");
    if nil ~= name
    then
        NeglectedGear:ChatMessage(name .. ": " .. display_str);
    end
end


function SlashCmdList.NG(msg, editbox)
    local cmd, rest = msg:match("^(%S*)%s*(.-)$");

    if cmd:lower() == "test"
    then
        NeglectedGear:TestItem(rest);

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

    else
        NeglectedGear:DebugMessage(3, "Invalid command \""..(cmd or "NIL").."\".");
    end
end


function NeglectedGear_OnLoad(self)
    NeglectedGear:InitSettings();

    self:RegisterEvent("PLAYER_LOGIN");
    self:RegisterEvent("PLAYER_REGEN_ENABLED");
    self:RegisterEvent("PLAYER_REGEN_DISABLED");

    GameTooltip:HookScript("OnTooltipSetItem", NeglectedGear_HookSetItem)
    ShoppingTooltip1:HookScript("OnTooltipSetItem", NeglectedGear_HookCompareItem)
    ShoppingTooltip2:HookScript("OnTooltipSetItem", NeglectedGear_HookCompareItem2)
    ItemRefTooltip:HookScript("OnTooltipSetItem", NeglectedGear_HookRefItem)

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

    elseif(event == "HIDE_WARNING")
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



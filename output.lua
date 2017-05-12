-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear


local frame = nil;
local font = nil;


function NeglectedGear:ChatMessage(msg, ...)
  DEFAULT_CHAT_FRAME:AddMessage("|cff0000ffNeglected Gear: "..(format(msg, ...) or "?????"),1,1,1)
end

function NeglectedGear:DebugMessage(level, msg, ...)
  if NeglectedGearDB.debug and NeglectedGearDB.debug[level] 
  then
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000Neglected Gear Debug: "..(format(msg, ...) or "?????"),1,1,1);
  end
end


function NeglectedGear:ShowWarning(msg, ...)

    if nil == frame
    then
        frame = CreateFrame("Frame", nil, UIParent);
        font = frame:CreateFontString(nil, "OVERLAY", "ZoneTextFont");
        frame:SetMovable(1);
        frame:SetWidth(1);
        frame:SetHeight(1);
        frame:SetFrameStrata("HIGH");
        frame:SetClampedToScreen();
        frame:Hide();
        frame:ClearAllPoints();
        frame:SetPoint("CENTER", UIParent, "CENTER", 0, 300)
        frame:SetAlpha(1);
        font:SetWidth(1024);
        font:SetHeight(0);
        font:SetPoint("CENTER", 0, 0);
        font:SetFont(STANDARD_TEXT_FONT, 80, "THICKOUTLINE");
        font:SetTextColor(0.0, 0.0, 1.0);
    end

    frame:Hide();
    font:SetText(format(msg, ...));
    frame:Show();
    NeglectedGear:PostEvent("HIDE_WARNING", 3.0);

end


function NeglectedGear:HideWarning()
    frame:Hide();
end



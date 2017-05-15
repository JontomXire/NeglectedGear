-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear


function NeglectedGear:CreateFrame()
    NeglectedGear.frame = CreateFrame("Frame", nil, UIParent);
    NeglectedGear.frame:ClearAllPoints();
    NeglectedGear.frame:SetPoint("CENTER", UIParent);
    NeglectedGear.frame:SetWidth(320);
    NeglectedGear.frame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = true, tileSize = 32,
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 32,
        insets = {left = 8, right = 8, top = 8, bottom = 8}
    });
    NeglectedGear.frame:SetBackdropColor(0.0, 0.0, 0.1);
    NeglectedGear.frame:SetBackdropBorderColor(0.5, 0.5, 1.0);
    NeglectedGear.frame:EnableMouse(true);
    NeglectedGear.frame:SetMovable(true);
    NeglectedGear.frame:RegisterForDrag("LeftButton");
    NeglectedGear.frame:SetFrameStrata("FULLSCREEN_DIALOG");
    NeglectedGear.frame:SetScript("OnDragStart", NeglectedGear.frame.StartMoving);
    NeglectedGear.frame:SetScript("OnDragStop", NeglectedGear.frame.StopMovingOrSizing);

    NeglectedGear.frame.titleframe = CreateFrame("Frame", nil, NeglectedGear.frame);
    NeglectedGear.frame.titleframe:SetPoint("TOP", NeglectedGear.frame, "TOP", 0, -12);
    NeglectedGear.frame.titleframe:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = true, tileSize = 16,
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
        insets = {left = 3, right = 3, top = 3, bottom = 3}
    });
    NeglectedGear.frame.titleframe:SetBackdropColor(0.1, 0.1, 0.3);
    NeglectedGear.frame.titleframe:SetBackdropBorderColor(0.2, 0.2, 0.6);

    NeglectedGear.frame.titletext = NeglectedGear.frame.titleframe:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    NeglectedGear.frame.titletext:SetPoint("TOP", NeglectedGear.frame.titleframe, "TOP", 0, -6);
    NeglectedGear.frame.titletext:SetTextColor(0.75, 0.75, 1.0, 1.0);
    NeglectedGear.frame.titletext:SetText("");

    NeglectedGear.frame.close_button = CreateFrame("Button", nil, NeglectedGear.frame, "UIPanelButtonTemplate");
    NeglectedGear.frame.close_button:SetHeight(20)
    NeglectedGear.frame.close_button:SetWidth(100)
    NeglectedGear.frame.close_button:SetText("Close");
    NeglectedGear.frame.close_button:SetPoint("BOTTOM", NeglectedGear.frame, "BOTTOM", 0, 12);
    NeglectedGear.frame.close_button:SetScript("OnClick", function(this) this:GetParent():Hide() end);

    NeglectedGear.frame:Hide();
end


function NeglectedGear:SetSize()
    local height = 72;

    if 0 == NeglectedGear.frame.rowcount
    then
        height = height + 12;
    else
        height = height + (NeglectedGear.frame.rowcount * 16);
    end

    NeglectedGear.frame:SetHeight(height);
end


function NeglectedGear:Initialise(title)
    NeglectedGear.frame.titletext:SetText(title);
    NeglectedGear.frame.titleframe:SetWidth(NeglectedGear.frame.titletext:GetWidth() + 24);
    NeglectedGear.frame.titleframe:SetHeight(NeglectedGear.frame.titletext:GetHeight() + 12);
    NeglectedGear.frame.rowname = {};
    NeglectedGear.frame.rowdata = {};
    NeglectedGear.frame.rowcount = 0;
    NeglectedGear:SetSize();
    NeglectedGear.frame:Show();
end


function NeglectedGear:AddRow(name, data)
    local name_text = NeglectedGear.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    name_text:SetTextColor(0.75, 0.75, 1.0, 1.0);
    name_text:SetText(name);

    local data_text = NeglectedGear.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    data_text:SetTextColor(0.75, 0.75, 1.0, 1.0);
    data_text:SetText(data);

    name_text:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 12, ((NeglectedGear.frame.rowcount * -16) - 36));
    data_text:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 120, ((NeglectedGear.frame.rowcount * -16) - 36));

    NeglectedGear.frame.rowcount = NeglectedGear.frame.rowcount + 1;
    NeglectedGear.frame.rowname[NeglectedGear.frame.rowcount] = name_text;
    NeglectedGear.frame.rowdata[NeglectedGear.frame.rowcount] = data_text;

    NeglectedGear:SetSize();
end



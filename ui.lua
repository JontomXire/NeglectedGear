-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear;


function NeglectedGear.OnEnter(icon)
    local item = icon:GetAttribute('ng_item');

    GameTooltip_SetDefaultAnchor(GameTooltip, icon);
    GameTooltip:SetHyperlink(item);
    GameTooltip:Show();
end

function NeglectedGear.OnLeave(icon)
    GameTooltip:Hide();
end

function NeglectedGear:CreateFrame()
    NeglectedGear.frame = CreateFrame("Frame", nil, UIParent);
    NeglectedGear.frame:ClearAllPoints();
    NeglectedGear.frame:SetPoint("CENTER", UIParent, 0, 200);
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
    local height = 100;

    if 0 == NeglectedGear.frame.rowcount
    then
        height = height;
    else
        height = height + (NeglectedGear.frame.rowcount * 16);
    end

    NeglectedGear.frame:SetHeight(height);
end


function NeglectedGear:Initialise(title)
    NeglectedGear.frame.titletext:SetText(title);
    NeglectedGear.frame.titleframe:SetWidth(NeglectedGear.frame.titletext:GetWidth() + 24);
    NeglectedGear.frame.titleframe:SetHeight(NeglectedGear.frame.titletext:GetHeight() + 12);

    if NeglectedGear.frame.rows == nil
    then
        NeglectedGear.frame.rows = {};
    end

    if NeglectedGear.frame.rowcount == nil
    then
        NeglectedGear.frame.rowcount = 0;
    end

    if 0 < NeglectedGear.frame.rowcount
    then
        for i = 1, NeglectedGear.frame.rowcount
        do
            local row = NeglectedGear.frame.rows[i];

            row['name']:Hide();
            row['icon_1']:Hide();
            row['icon_frame_1']:Hide();
            row['diff_1']:Hide();
            if row['icon_2']
            then
                row['icon_2']:Hide();
            end
            if row['icon_frame_2']
            then
                row['icon_frame_2']:Hide();
            end
            if row['diff_2']
            then
                row['diff_2']:Hide();
            end
        end
    end

    NeglectedGear.frame.rowcount = 0;
    NeglectedGear:SetSize();
    NeglectedGear.frame:Show();
end


function NeglectedGear:AddRow(name, item_1, diff_1, item_2, diff_2)
    local row = {};

    NeglectedGear.frame.rowcount = NeglectedGear.frame.rowcount + 1;
    if NeglectedGear.frame.rows[NeglectedGear.frame.rowcount]
    then
        row = NeglectedGear.frame.rows[NeglectedGear.frame.rowcount];
    end

    local name_text = row['name'];
    if name_text == nil
    then
        name_text = NeglectedGear.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
        name_text:SetTextColor(0.75, 0.75, 1.0, 1.0);
        name_text:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 12, ((NeglectedGear.frame.rowcount * -16) - 36));
    else
        name_text:Show();
    end
    name_text:SetText(name);

    row['name'] = name_text;

    local icon_frame = row['icon_frame_1'];
    if icon_frame == nil
    then
        icon_frame = CreateFrame("Frame", nil, NeglectedGear.frame);
        icon_frame:SetWidth(16);
        icon_frame:SetHeight(16);
        icon_frame:SetScript("OnEnter", NeglectedGear.OnEnter);
        icon_frame:SetScript("OnLeave", NeglectedGear.OnLeave);
        icon_frame:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 120, ((NeglectedGear.frame.rowcount * -16) - 36));
        icon_frame:EnableMouse(true);
    else
        icon_frame:Show();
    end
    icon_frame:SetAttribute('ng_item', item_1);

    row['icon_frame_1'] = icon_frame;

    local icon = row['icon_1'];
    if icon == nil
    then
        icon = icon_frame:CreateTexture(nil, "OVERLAY");
        icon:SetPoint("TOPLEFT", icon_frame, "TOPLEFT", 0, 0);
        icon:SetWidth(16);
        icon:SetHeight(16);
    else
        icon:Show();
    end
    icon:SetTexture(GetItemIcon(item_1));

    row['icon_1'] = icon;

    local diff_text = row['diff_1'];
    if diff_text == nil
    then
        diff_text = NeglectedGear.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
        diff_text:SetTextColor(0.75, 0.75, 1.0, 1.0);
        diff_text:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 140, ((NeglectedGear.frame.rowcount * -16) - 36));
    else
        diff_text:Show();
    end
    diff_text:SetText(tostring(diff_1));

    row['diff_1'] = diff_text;

    if item_2
    then
        icon_frame = row['icon_frame_2'];
        if icon_frame == nil
        then
            icon_frame = CreateFrame("Frame", nil, NeglectedGear.frame);
            icon_frame:SetWidth(16);
            icon_frame:SetHeight(16);
            icon_frame:SetScript("OnEnter", NeglectedGear.OnEnter);
            icon_frame:SetScript("OnLeave", NeglectedGear.OnLeave);
            icon_frame:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 200, ((NeglectedGear.frame.rowcount * -16) - 36));
            icon_frame:EnableMouse(true);
        else
            icon_frame:Show();
        end
        icon_frame:SetAttribute('ng_item', item_2);

        row['icon_frame_2'] = icon_frame;

        icon = row['icon_2'];
        if icon == nil
        then
            icon = icon_frame:CreateTexture(nil, "OVERLAY");
            icon:SetPoint("TOPLEFT", icon_frame, "TOPLEFT", 0, 0);
            icon:SetWidth(16);
            icon:SetHeight(16);
        else
            icon:Show();
        end
        icon:SetTexture(GetItemIcon(item_2));

        row['icon_2'] = icon;

        diff_text = row['diff_2'];
        if diff_text == nil
        then
            diff_text = NeglectedGear.frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
            diff_text:SetTextColor(0.75, 0.75, 1.0, 1.0);
            diff_text:SetPoint("TOPLEFT", NeglectedGear.frame, "TOPLEFT", 220, ((NeglectedGear.frame.rowcount * -16) - 36));
        else
            diff_text:Show();
        end
        diff_text:SetText(tostring(diff_2));

        row['diff_2'] = diff_text;
    end

    NeglectedGear.frame.rows[NeglectedGear.frame.rowcount] = row;

    NeglectedGear:SetSize();
end



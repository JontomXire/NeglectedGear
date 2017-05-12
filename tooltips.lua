-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear


function NeglectedGear_HookSetItem()
    ItemName, ItemLink = GameTooltip:GetItem();
    NeglectedGear:HookItem(ItemName, ItemLink, GameTooltip);
end
function NeglectedGear_HookRefItem()
    ItemName, ItemLink = ItemRefTooltip:GetItem();
    NeglectedGear:HookItem(ItemName, ItemLink, ItemRefTooltip);
end
function NeglectedGear_HookCompareItem()
    ItemName, ItemLink = ShoppingTooltip1:GetItem();
    NeglectedGear:HookItem(ItemName, ItemLink, ShoppingTooltip1);
end
function NeglectedGear_HookCompareItem2()
    ItemName, ItemLink = ShoppingTooltip2:GetItem();
    NeglectedGear:HookItem(ItemName, ItemLink, ShoppingTooltip2);
end


function NeglectedGear:HookItem(name, link, tooltip)
    if (NeglectedGear.in_combat)
    then
        return;
    end

    if not IsEquippableItem(link)
    then
        return;
    end

    _, _, _, _, _, _, _, _, loc = GetItemInfo(link);

    if nil == name
    then
        return;
    end

    local value = NeglectedGear:ValueItem(link, "player");

    local current_item = GetInventoryItemLink("player", NG_SlotID[loc]);
    if nil == current_item
    then
        NeglectedGear:DebugMessage(1, "Location: " .. loc .. ", Slot: " .. tostring(NG_SlotID[loc]) .. " is empty.");
        tooltip:AddLine("NG Value: " .. tostring(value), 0.5, 0.5, 1.0);
    else
        local old_value = NeglectedGear:ValueItem(current_item, "player");

        if value >= old_value
        then
            tooltip:AddLine("NG Value: " .. tostring(value) .. "(+" .. tostring(value - old_value) .. ")", 0.5, 0.5, 1.0);
        else
            tooltip:AddLine("NG Value: " .. tostring(value) .. "(-" .. tostring(old_value - value) .. ")", 0.5, 0.5, 1.0);
        end
    end
end



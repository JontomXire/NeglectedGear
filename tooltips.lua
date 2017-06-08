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

    if not IsUsableItem(link)
    then
        return;
    end

    local _, display_str = NeglectedGear:GetItemString(link, "player");
    if nil == display_str
    then
        return;
    end

    tooltip:AddLine("NG Value: " .. display_str, 0.5, 0.5, 1.0);
end



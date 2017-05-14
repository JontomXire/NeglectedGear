-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear


function NeglectedGear:GetClass(target)
    local class = UnitClass(target);
    if nil == class
    then
        NeglectedGear:DebugMessage(3, "Target '" .. target .. "' is not recognised.");
        return nil, nil;
    end

    if target ~= "player"
    then
        NeglectedGear:DebugMessage(1, "Target '" .. target .. "' is not supported.");
        return nil, nil;
    end

    local max = 0;
    local spec = nil;
    for i = 1, GetNumTalentTabs()
    do
        local name = nil;
        local count = 0;
        name, _, count = GetTalentTabInfo(i);
        if count > max
        then
            max = count;
            spec = name;
        end
    end

    if nil == spec
    then
        return nil, nil;
    end

-- Blood Dps will have the talent "Dancing Rune Weapon', Blood tanks will not.
-- Feral Druid Tanks will have the talent 'Natural Reaction', Feral dps will not.

    return class, spec;
end


function NeglectedGear:GetWeightings(class, spec)
    local class_weightings = NG_Weightings[class];
    if nil == class_weightings
    then
        NeglectedGear:DebugMessage(3, "Class '" .. class .. "' is not recognised.");
        return nil;
    end

    if nil == class_weightings[spec]
    then
        NeglectedGear:DebugMessage(3, "Specialisation '" .. spec .. "' is not recognised for class '" .. class .. "'.");
        return nil;
    end

    NeglectedGear:DebugMessage(1, "Using weightings for " .. spec .. " " .. class .. ".");

    return class_weightings[spec];
end


function NeglectedGear:GetStatValue(class, spec, stat)
    local value = 0;

    if stat == "ITEM_MOD_HIT_RATING_SHORT"
    then
        value = GetCombatRatingBonus(NG_HitType[class][spec]);

    elseif stat == "ITEM_MOD_EXPERTISE_RATING_SHORT"
    then
        value = GetExpertise();
    elseif stat == "ITEM_MOD_DEFENSE_SKILL_SHORT"
    then
        value = GetCombatRatingBonus(CR_DEFENSE_SKILL);
    end

    return value;
end


function NeglectedGear:GetBaseStatsForCaps(class, spec, weightings, old_item)
    local base_stats = {};
    local item_stats = {};
    
    if nil ~= old_item
    then
        item_stats = GetItemStats(old_item);
    end

    for cap, value in pairs(weightings)
    do
        if cap:sub(-4) == "_CAP"
        then
            stat = cap:sub(1, (string.len(cap) - 4));
            base_stats[stat] = NeglectedGear:GetStatValue(class, spec, stat) - (item_stats[stat] or 0);
        end
    end

    return base_stats;
end


function NeglectedGear:ValueItem(item, weightings, base_stats)
    local score = 0;

    if (nil ~= weightings) and (nil ~= item)
    then
        local stats = GetItemStats(item);
        for stat, value in pairs(stats)
        do
--            NeglectedGear:DebugMessage(1, stat .. ": " .. tostring(value));

            if weightings[stat]
            then
                local base_value = base_stats[stat] or 0;
                local cap = weightings[stat.."_CAP"];
                if not cap or ((base_value + value) < cap)
                then
                    score = score + (value * weightings[stat]);
                elseif base_value < cap
                then
                    score = score + ((cap - base_value) * weightings[stat]);
                end
            end
        end
    end

    return floor(score / 10.0);
end


function NeglectedGear:GetItemString(item, target)
    local name, _, _, _, _, _, _, _, loc = GetItemInfo(item);
    if nil == name
    then
        NeglectedGear:ChatMessage("Error: " .. item .. " is not a valid item link.")
        return nil, nil
    end

    local old_item = GetInventoryItemLink(target, NG_SlotID[loc]);
    local class, spec = NeglectedGear:GetClass(target);
    if nil == class
    then
        return nil, nil;
    end

    local weightings = NeglectedGear:GetWeightings(class, spec);
    local base_stats = NeglectedGear:GetBaseStatsForCaps(class, spec, weightings, old_item);
    local value = NeglectedGear:ValueItem(item, weightings, base_stats);
    local old_value = NeglectedGear:ValueItem(old_item, weightings, base_stats);

    if value >= old_value
    then
        return name, tostring(value) .. "(+" .. tostring(value - old_value) .. ")";
    end

    return name, tostring(value) .. "(-" .. tostring(old_value - value) .. ")";
end



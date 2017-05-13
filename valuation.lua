-- Neglected Gear Copyright 2017 JontomXire@hushmail.com


local NeglectedGear = _G.NeglectedGear


function NeglectedGear:GetWeightings(target)
    local class = UnitClass(target);
    if nil == class
    then
        NeglectedGear:DebugMessage(3, "Target '" .. target .. "' is not recognised.");
        return nil
    end

    local class_weightings = NG_Weightings[class];
    if nil == class_weightings
    then
        NeglectedGear:DebugMessage(3, "Class '" .. class .. "' is not recognised.");
        return nil
    end

    if target ~= "player"
    then
        NeglectedGear:DebugMessage(1, "Target '" .. target .. "' is not supported.");
        return nil
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
            count = max;
            spec = name;
        end
    end

    if nil == spec
    then
        return nil;
    end

    if nil == class_weightings[spec]
    then
        NeglectedGear:DebugMessage(3, "Specialisation '" .. spec .. "' is not recognised for class '" .. class .. "'.");
        return nil;
    end

    return class_weightings[spec];
end


function NeglectedGear:ValueItem(item, target)
    local score = 0;

    local weightings = NeglectedGear:GetWeightings(target);
    if nil ~= weightings
    then
        local stats = GetItemStats(item);
        for stat, value in pairs(stats)
        do
--            NeglectedGear:DebugMessage(1, stat .. ": " .. tostring(value));

            if weightings[stat]
            then
                score = score + (value * weightings[stat]);
            end
        end
    end

    return floor(score);
end



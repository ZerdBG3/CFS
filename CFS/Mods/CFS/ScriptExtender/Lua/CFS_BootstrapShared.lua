local ENUM_CFS_Concentration_RequirementEvents = {
    "OnStatusApplied",
    "OnStatusRemoved",
    "OnSpellCast",
}

local CFS_ConcentrationBlocker_Passive = "RAW_Concentration_Block"

local function CFS_CharIsHero(char)
    return char ~= nil and string.find(char.Passives, "WeaponThrow") and string.find(char.Passives, "CombatStartAttack")
end

local function CFS_HasValueInList(list, value)
    for _, v in pairs(list) do
        if v == value then
            return true
        end
    end
    return false
end

local function CFS_StatsLoaded()
    for _, name in pairs(Ext.Stats.GetStats("SpellData")) do
        local spell = Ext.Stats.Get(name)
        if CFS_HasValueInList(spell.SpellFlags, "IsConcentration") then
            -- Ext.Utils.Print("\nAdding requirement to " .. spell.Name)

            local requirementConditionsPrefix = ""
            if spell.RequirementConditions ~= nil and spell.RequirementConditions ~= "" then
                requirementConditionsPrefix = "(" .. spell.RequirementConditions .. ") and "
            end

            spell.RequirementConditions = requirementConditionsPrefix ..
                "(RAW_ConcentrationBlocker())"
            -- Ext.Utils.Print("\tRequirementConditions: " .. spell.RequirementConditions)

            local requirementEvents = spell.RequirementEvents
            for _, event in pairs (ENUM_CFS_Concentration_RequirementEvents) do
                if not CFS_HasValueInList(requirementEvents, event) then
                    table.insert(requirementEvents, event)
                end
            end
            spell.RequirementEvents = requirementEvents
            -- Ext.Utils.Print("\tRequirementEvents: ")
            -- _D(spell.RequirementEvents)
        end
    end

    for _, name in pairs(Ext.Stats.GetStats("Character")) do
        local char = Ext.Stats.Get(name)

        if CFS_CharIsHero(char) then
            -- Ext.Utils.Print("\nCharacter: " .. name)
            if string.find(char.Passives, CFS_ConcentrationBlocker_Passive) then
                -- Ext.Utils.Print("\tSkipping; already has passive")
            else
                -- Ext.Utils.Print("\tAdding passive: " .. CFS_ConcentrationBlocker_Passive)
                char.Passives = CFS_ConcentrationBlocker_Passive .. ";" .. char.Passives
                -- Ext.Utils.Print("\tPassives: " .. char.Passives)
            end
        end
    end
end

Ext.Events.StatsLoaded:Subscribe(CFS_StatsLoaded)

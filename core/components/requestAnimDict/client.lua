QBCorev2Components = {} or QBCorev2Components

function QBCorev2Components.RequestAnimDict(animDict)
    if HasAnimDictLoaded(animDict) then return end
    RequestAnimDict(animDict)
    local time = GetGameTimer()
    while not HasAnimDictLoaded(animDict) do
        if GetGameTimer() - time > 1000 then
            return false, error('Failed to load animDict: ' .. animDict, 2)
        end
        Wait(0)
    end
    return true, animDict
end
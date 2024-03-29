QBCorev2Components = QBCorev2Components or {}

function QBCorev2Components.LoadAnimSet(animSet)
    if HasAnimSetLoaded(animSet) then return end
    RequestAnimSet(animSet)
    local time = GetGameTimer()
    while not HasAnimSetLoaded(animSet) do
        if GetGameTimer() - time > 1000 then
            return false, error('Failed to load animSet: ' .. animSet, 2)
        end
        Wait(0)
    end
    return true, animSet
end
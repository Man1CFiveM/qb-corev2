--- LoadAnimSet function
--- @param animSet string
--- @return boolean, string
--- @usage QBCorev2.Components.LoadAnimSet('move_m@drunk@verydrunk')
function QBCorev2.Components.LoadAnimSet(animSet)
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
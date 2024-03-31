--- Get closest ped to the player or entity provided
--- @param entity number -- entity to get closest ped to
--- @return number|boolean -- closest ped to the player or entity
--- @usage QBCorev2.Components.GetClosestPed(PlayerPedId())
function QBCorev2.Components.GetClosestPed(entity)
    if not DoesEntityExist(entity) then return error('entity does not exist', 2) end
    if not entity then entity = PlayerPedId() end
    local playerPos = GetEntityCoords(entity)
    local peds = GetGamePool('CPed')
    local closestPed = nil
    local closestDistance = 1000.0

    for i=1, #peds do
        local pedPos = GetEntityCoords(peds[i])
        local distance = #(playerPos - pedPos)

        if distance < closestDistance then
            closestPed = peds[i]
            closestDistance = distance
        end
    end
    if not closestPed then return false end
    return closestPed
end
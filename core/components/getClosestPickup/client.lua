--- Get closest pickup to the player or entity provided
--- @param entity number -- entity to get closest vehicle to
--- @return number|boolean -- closest vehicle to the player or entity
--- @usage QBCorev2.Components.GetClosestPickup(PlayerPedId())
function QBCorev2.Components.GetClosestPickup(entity)
    if not DoesEntityExist(entity) then return error('entity does not exist', 2) end
    if not entity then entity = PlayerPedId() end
    local playerPos = GetEntityCoords(entity)
    local pickups = GetGamePool('CPickup')
    local closestPickup = nil
    local closestDistance = 1000.0

    for i=1, #pickups do
        local pickupPos = GetEntityCoords(pickups[i])
        local distance = #(playerPos - pickupPos)

        if distance < closestDistance then
            closestPickup = pickups[i]
            closestDistance = distance
        end
    end
    if not closestPickup then return false end
    return closestPickup
end
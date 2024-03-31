--- Get closest vehicle to the player or entity provided
--- @param entity number -- entity to get closest vehicle to
--- @return number|boolean -- closest vehicle to the player or entity
--- @usage QBCorev2.Components.GetClosestVehicle(PlayerPedId())
function QBCorev2.Components.GetClosestVehicle(entity)
    if not entity then entity = PlayerPedId() end
    local playerPos = GetEntityCoords(entity)
    local vehicles = GetGamePool('CVehicle')
    local closestVehicle = nil
    local closestDistance = 1000.0

    for i=1, #vehicles do
        local vehiclePos = GetEntityCoords(vehicles[i])
        local distance = #(playerPos - vehiclePos)

        if distance < closestDistance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    if not closestVehicle then return false end
    return closestVehicle
end
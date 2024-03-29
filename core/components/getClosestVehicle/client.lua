---@return number | nil -- closest vehicle from player | entity or nil
function QBCorev2.Components.GetClosestVehicle(_entity)
    if not _entity then _entity = PlayerPedId() end
    local playerPos = GetEntityCoords(_entity)
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

    return closestVehicle
end
QBCorev2.Components.Closest = {}
--- Spawns a vehicle at the specified coordinates and returns the vehicle and networkid, client-side only
---@param entity number -- model name or hash
---@return number|boolean -- vehicle, networkid
---@usage QBCorev2.Modules.Vehicles.Spawn('adder', function(vehicle) print(vehicle) end, false, true, true)
function QBCorev2.Components.Closest.Object(entity)
    if not DoesEntityExist(entity) then return error('entity does not exist', 2) end
    if not entity then entity = PlayerPedId()  end
    local playerPos = GetEntityCoords(entity)
    local objects = GetGamePool('CObject')
    local closestObject = nil
    local closestDistance = 1000.0

    for i=1, #objects do
        local objectPos = GetEntityCoords(objects[i])
        local distance = #(playerPos - objectPos)

        if distance < closestDistance then
            closestObject = objects[i]
            closestDistance = distance
        end
    end
    if not closestObject then return false end
    return closestObject
end

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

--- Get closest vehicle to the player or entity provided
--- @param entity number -- entity to get closest vehicle to
--- @return number|boolean -- closest vehicle to the player or entity
--- @usage QBCorev2.Components.GetClosestVehicle(PlayerPedId())
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
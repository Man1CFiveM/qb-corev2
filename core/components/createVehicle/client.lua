QBCorev2.Components.Vehicle = {}
--- Spawns a vehicle at the specified coordinates and returns the vehicle and networkid, client-side only
---@param model string|number -- model name or hash
---@param cb function -- callback function
---@param coords vector4|false -- vector4 or false
---@param isnetworked boolean -- is networked
---@param teleportInto boolean -- teleport into vehicle
---@return number|nil -- vehicle, networkid
---@usage QBCorev2.Modules.Vehicles.Spawn('adder', function(vehicle) print(vehicle) end, false, true, true)
function QBCorev2.Components.Vehicle.Spawn(model, cb, coords, isnetworked, teleportInto)
    QBCorev2.Utils.validateArgs({model, cb, coords, isnetworked, teleportInto}, {'string|number', 'function', 'vector4|false', 'boolean', 'boolean'})
    if not IsModelInCdimage(model) then return error('vehicle not loaded', 2) end

    local ped = PlayerPedId()
    if not coords then local pos = GetEntityCoords(ped) local heading GetEntityHeading(ped) coords = vector4(pos.x, pos.y, pos.z, heading) end
    if type(model) == 'string' then model = joaat(model) end

    QBCorev2.Components.RequestModel(model)
    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w, isnetworked, false)
    local netid = NetworkGetNetworkIdFromEntity(veh)

    SetVehicleHasBeenOwnedByPlayer(veh, true)
    SetNetworkIdCanMigrate(netid, true)
    SetVehicleNeedsToBeHotwired(veh, false) -- this should be handled by the vehiclekeys
    SetVehRadioStation(veh, 'OFF')
    SetVehicleFuelLevel(veh, 100.0) -- this should be handled by the fuelscript
    SetModelAsNoLongerNeeded(model)

    if teleportInto then TaskWarpPedIntoVehicle(ped, veh, -1) end
    if cb then cb(veh) end

    return veh, netid
end

function QBCorev2.Components.Vehicle.Delete(vehicle)
    if not DoesEntityExist(vehicle) then return error('this entity does not exist: '..vehicle, 2)end
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
end

function QBCorev2.Components.Vehicle.GetPlate(vehicle)
    if vehicle == 0 then return end
    return QBCorev2.Utils.Trim(GetVehicleNumberPlateText(vehicle))
end

function QBCorev2.Components.Vehicle.GetLabel(vehicle)
    if vehicle == nil or vehicle == 0 then return end
    return GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
end

function QBCorev2.Components.Vehicle.GetProperties(vehicle)
    if vehicle == nil or vehicle == 0 then return end
    local props = {
        model = GetEntityModel(vehicle),
        plate = QBCorev2.Modules.GetPlate(vehicle),
        label = QBCorev2.Modules.GetVehicleLabel(vehicle),
        class = GetVehicleClass(vehicle),
        fuel = GetVehicleFuelLevel(vehicle),
        engine = GetIsVehicleEngineRunning(vehicle),
        bodyHealth = GetVehicleBodyHealth(vehicle),
        engineHealth = GetVehicleEngineHealth(vehicle),
        dirtLevel = GetVehicleDirtLevel(vehicle),
        color1 = table.pack(GetVehicleColours(vehicle)),
        color2 = table.pack(GetVehicleExtraColours(vehicle)),
        pearlescentColor = GetVehicleExtraColours(vehicle)[1],
        wheelColor = GetVehicleExtraColours(vehicle)[2],
        neonColor = table.pack(GetVehicleNeonLightsColour(vehicle)),
        neonEnabled = table.pack(GetVehicleNeonLightsColour(vehicle))[1] ~= 0,
        extras = table.pack(GetVehicleMod(vehicle, 22)),
        livery = GetVehicleLivery(vehicle),
        plateStyle = GetVehicleNumberPlateTextIndex(vehicle),
        plateType = GetVehicleNumberPlateText(vehicle),
        windowTint = GetVehicleWindowTint(vehicle),
        wheels = GetVehicleWheelType(vehicle),
        wheelType = GetVehicleWheelType(vehicle),
        wheelVariation = IsVehicleWheelTypeCustom(vehicle),
        mods = {},
    }
    for i = 0, 48 do
        props.mods[i] = GetVehicleMod(vehicle, i)
    end
    return props
end

-- backwards compatibility
function QBCore.Functions.SpawnVehicle(model, cb, coords, isnetworked, teleportInto)
    QBCorev2.Components.Vehicle.Spawn(model, cb, coords, isnetworked, teleportInto)
end

function QBCore.Functions.DeleteVehicle(vehicle)
    QBCorev2.Components.Vehicle.Delete(vehicle)
end

function QBCore.Functions.GetVehicleProperties(vehicle)
    QBCorev2.Components.Vehicle.GetProperties(vehicle)
end

function QBCore.Functions.GetVehiclePlate(vehicle)
    QBCorev2.Components.Vehicle.GetPlate(vehicle)
end
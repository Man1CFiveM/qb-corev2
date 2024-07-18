local speedLimits  = {
    [0] = 250, -- Compacts
    [1] = 250, -- Sedans
    [2] = 250, -- SUVs
    [3] = 250, -- Coupes
    [4] = 250, -- Muscle
    [5] = 250, -- Sports Classics
    [6] = 250, -- Sports
    [7] = 250, -- Super
    [8] = 200, -- Motorcycles
    [9] = 200, -- Off-road
    [10] = 200, -- Industrial
    [11] = 200, -- Utility
    [12] = 250, -- Vans
    [13] = 250, -- Cycles
    [14] = 250, -- Boats
    [15] = 250, -- Helicopters
    [16] = 250, -- Planes
    [17] = 250, -- Service
    [18] = 250, -- Emergency
    [19] = 250, -- Military
    [20] = 250, -- Commercial
    [21] = 250  -- Trains
}

-- local vehicleMeta = {
--     maxSpeed = 'fInitialDriveMaxFlatVel'
-- }

-- SetHandlingFloat(
-- 	vehicle --[[ string ]], 
-- 	'CHandlingData' --[[ string ]], 
-- 	vehicleMeta.maxSpeed --[[ string ]], 
-- 	value --[[ number ]]
-- )

function SetMaxSpeed(vehicle)
    CreateThread(function()
        while true do
            Wait(0)
            if vehicle ~= 0 then
                local speed = GetEntitySpeed(vehicle)
                local vehicleClass = GetVehicleClass(vehicle)
                local maxSpeed = speedLimits[vehicleClass] or 200
                local maxSpeedConverted = maxSpeed / 3.6
                if speed > maxSpeedConverted then
                    SetEntityMaxSpeed(vehicle, maxSpeedConverted)
                end
            end
        end
    end)
end

AddEventHandler('gameEventTriggered', function (event, args)
    if event == 'CAgitatedActionEnterVehicle' then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) then
            SetMaxSpeed(vehicle)
        end
    end
end)
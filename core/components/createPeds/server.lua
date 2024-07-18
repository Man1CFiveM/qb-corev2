

function QBCorev2.Components.CreatePed(hash, vecto4, isNetwork, bScriptHostPed, vehicle)
    local x, y, z, heading = vecto4.x, vecto4.y, vecto4.z, vecto4.w

    if vehicle then
        local veh = CreateVehicle(joaat(vehicle), x, y, z, heading, isNetwork, bScriptHostPed)
        local ped = CreatePedInsideVehicle(veh, 0, joaat(hash), -1, isNetwork, bScriptHostPed)
        return ped
    end

    local ped = CreatePed(0, joaat(hash), x, y, z, heading, isNetwork, bScriptHostPed)
    return ped
end
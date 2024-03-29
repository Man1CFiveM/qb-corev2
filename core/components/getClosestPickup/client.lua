---@return number | nil -- closest pickup from player | entity or nil
function QBCorev2.Components.GetClosestPickup(_entity)
    if not _entity then _entity = PlayerPedId() end
    local playerPos = GetEntityCoords(_entity)
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

    return closestPickup
end
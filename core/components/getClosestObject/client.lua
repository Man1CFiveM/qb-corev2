---@return nil | number -- closest object from player | entity or nil
function QBCorev2.Components.GetClosestObject(_entity)
    if not _entity then _entity = PlayerPedId()  end
    local playerPos = GetEntityCoords(_entity)
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

    return closestObject
end
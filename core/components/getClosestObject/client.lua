--- Get closest object to the player or entity provided
---@param entity number -- model name or hash
---@return number|boolean -- vehicle, networkid
---@usage QBCorev2.Components.GetClosestObject(PlayerPedId())
function QBCorev2.Components.GetClosestObject(entity)
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
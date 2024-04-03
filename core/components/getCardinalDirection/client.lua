--- Gets the cardinal direction an entity is facing.
---@param entity number -- The entity to get the cardinal direction from
---@return string -- The cardinal direction the entity is facing
---@useage local cardinalDirection = QBCorev2.Components.GetCardinalDirection(number)
function QBCorev2.Components.GetCardinalDirection(entity) --TODO: Change language to locals
    QBCorev2.Utils.ValidateArgs({entity},{'number'})
    if not DoesEntityExist(entity) then return 'Cardinal Direction Error' end
    if not entity then entity = PlayerPedId() end

    local heading = GetEntityHeading(entity)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then return 'North' end
    if (heading >= 45 and heading < 135) then return 'West' end
    if (heading >= 135 and heading < 225) then return 'South' end
    if (heading >= 225 and heading < 315) then return 'East' end
end

--- Backwards compatibility for GetCardinalDirection
function QBCore.Functions.GetCardinalDirection(entity)
    QBCorev2.Components.GetCardinalDirection(entity)
end
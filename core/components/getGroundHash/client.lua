--- Get the ground hash of an entity
---@param entity number -- The entity to get the ground hash from
---@return number, number, vector3, vector3, boolean, number -- The material hash, the entity hit, the surface normal, the end coords, the success, and the retval
---@useage local materialHash, entityHit, surfaceNormal, endCoords, success, retval = QBCorev2.Components.GetGroundHash(number)
function QBCorev2.Components.GetGroundHash(entity)
    QBCorev2.Utils.ValidateArgs({entity},{'number'})
    local coords = GetEntityCoords(entity)
    local num = StartShapeTestCapsule(coords.x, coords.y, coords.z + 4, coords.x, coords.y, coords.z - 2.0, 1, 1, entity, 7)
    local retval, success, endCoords, surfaceNormal, materialHash, entityHit = GetShapeTestResultIncludingMaterial(num)
    if not success then print('Failed to get ground hash') end
    return materialHash, entityHit, surfaceNormal, endCoords, success, retval
end

--- Backwards compatibility for GetGroundHash
function QBCore.Functions.GetGroundHash(entity)
    QBCorev2.Components.GetGroundHash(entity)
end
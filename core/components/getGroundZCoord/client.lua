--- Get the ground z coord at the given coords
---@param coords vector3 -- The coords to get the ground z coord from
---@return number -- The ground z coord
---@useage local groundZ = QBCorev2.Components.GetGroundZCoord(vector3)
function QBCorev2.Components.GetGroundZCoord(coords)
    QBCorev2.Utils.ValidateArgs({coords},{'vector3'})
    local boolean, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, 0)
    if not boolean then
        boolean, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, 1)
    end
    return groundZ
end

function QBCore.Functions.GetGroundZCoord(coords)
    QBCorev2.Components.GetGroundZCoord(coords)
end
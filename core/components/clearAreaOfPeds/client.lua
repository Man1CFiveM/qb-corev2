--- Clear area around a position with a radius of peds
---@param coords vector3
---@param radius number
---@usage QBCorev2.Modules.AreaClearOfPeds(0.0, 0.0, 0.0, 100.0)
function QBCorev2.Modules.ClearAreaOfPeds(coords, radius)
    if not QBCorev2.Utils.HasDecimalPoint(radius) then return error('radius must have a decimal point', 2) end
    QBCorev2.Utils.validateArgs({coords, radius}, {'vector3', 'number'})
    ClearAreaOfPeds(coords.x, coords.y, coords.z, radius, true)
end
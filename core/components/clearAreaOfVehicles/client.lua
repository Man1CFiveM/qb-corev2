--- Clear vehicles in a area at the given position with a radius
---@param coords vector3
---@param radius number
---@usage QBCorev2.Modules.ClearAreaOfVehicles(0.0, 0.0, 0.0, 100.0)
function QBCorev2.Modules.ClearAreaOfVehicles(coords, radius)
    if not QBCorev2.Utils.HasDecimalPoint(radius) then return error('radius must have a decimal point', 2) end
    QBCorev2.Utils.validateArgs({coords, radius}, {'vector3', 'number'})
    ClearAreaOfVehicles(coords.x, coords.y, coords.z, radius, false, false, false, false, false)
end
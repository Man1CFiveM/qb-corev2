--- Clear area around a position with a radius of objects
---@param coords vector3
---@param radius number
---@param flags integer
---@usage QBCorev2.Modules.ClearAreaOfObjects(0.0, 0.0, 0.0, 100.0, 0)
function QBCorev2.Modules.ClearAreaOfObjects(coords, radius, flags)
    if not QBCorev2.Utils.HasDecimalPoint(radius) then return error('radius must have a decimal point', 2) end
    QBCorev2.Utils.validateArgs({coords, radius, flags}, {'vector3', 'number', 'integer'})
    ClearAreaOfObjects(coords.x, coords.y, coords.z, radius, flags)
end
--- Clear area around a position with a radius
---@param coords vector3
---@param radius number
---@param ignoreCopCars boolean
---@param ignoreObjects boolean
---@usage QBCorev2.Modules.AreaClear(0.0, 0.0, 0.0, 100.0, true, true)
function QBCorev2.Modules.AreaClear(coords, radius, ignoreCopCars, ignoreObjects)
    if not QBCorev2.Utils.HasDecimalPoint(radius) then return error('radius must have a decimal point', 2) end
    QBCorev2.Utils.validateArgs({coords, radius, ignoreCopCars, ignoreObjects}, {'vector3', 'number', 'boolean', 'boolean'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    ClearArea(coords.x, coords.y, coords.z, radius, true, ignoreCopCars, ignoreObjects, false)
end
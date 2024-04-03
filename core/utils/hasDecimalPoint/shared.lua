--- Checks if a number has a decimal point.
---@param num number
---@return boolean
---@usage QBCorev2.Utils.HasDecimalPoint(1.0) -- true
function QBCorev2.Utils.HasDecimalPoint(num)
    return tostring(num):find('%.') ~= nil
end
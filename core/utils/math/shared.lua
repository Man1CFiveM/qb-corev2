QBCorev2.Utils.Math = {}

--- Rounds a number to a specified number of decimal places.
-- If no number of decimal places is specified, rounds to the nearest whole number.
---@param int number The number to round
---@param numDecimalPlaces number The number of decimal places to round to. Optional
---@return number The rounded number
---@usage QBCorev2.Utils.Math.Round(1.23456, 2) -- Returns 1.23
function QBCorev2.Utils.Math.Round(int, numDecimalPlaces)
    if not numDecimalPlaces then return math.floor(int + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((int * power) + 0.5) / (power)
end
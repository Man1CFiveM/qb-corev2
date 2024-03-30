-- Function to generate a random key
QBCorev2.Utils.Random = {}

--- Generates a random key of a specified length
---@param length number -- the length of the key to generate
---@return string -- the generated key
---@usage QBCorev2.Utils.Random.Key(10) -- Returns 'aBcD3eFg
function QBCorev2.Utils.Random.Key(length)
    local res = ""
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    for i = 1, length do
        local index = math.random(#chars)
        res = res .. chars:sub(index, index)
    end

    return res
end

--- Generates a random string of a specified length
---@param length number -- the length of the string to generate
---@return string -- the generated string
---@usage QBCorev2.Utils.Random.String(10) -- Returns 'aBcDeFg
function QBCorev2.Utils.Random.String(length)
    local res = ""
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    for i = 1, length do
        local index = math.random(#chars)
        res = res .. chars:sub(index, index)
    end

    return res
end

--- Generates a random integer of a specified length
---@param length number -- the length of the integer to generate
---@return string -- the generated integer
---@usage QBCorev2.Utils.Random.Int(10) -- Returns '1234567890'
function QBCorev2.Utils.Random.Int(length)
    local res = ""
    local chars = "0123456789"

    for i = 1, length do
        local index = math.random(#chars)
        res = res .. chars:sub(index, index)
    end

    return res
end
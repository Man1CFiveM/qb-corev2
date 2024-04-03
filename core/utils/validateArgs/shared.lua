local function tableContains(table, val)
    for i=1, #table do
        if table[i] == val then 
            return true
        end
    end
    return false
end

---@param expected any -- the expected argument
---@param actual any -- the actual argument
---@param cb function -- callback function
---@return boolean, string -- returns false and an error message if the actual argument does not match the expected argument
---@usage local result, error = QBCorev2.Utils.validateArgs('string', 'string'), using | can be used to look for multiple types
function QBCorev2.Utils.ValidateArgs(expected, actual, cb)
    if type(expected) ~= 'table' then
        if type(actual) ~= expected then
            if not cb then return false, string.format("Invalid argument: argument %d must be a %s", actual, expected) end
            return cb(false, error(string.format("Invalid argument: argument %d must be a %s", actual, expected), 2))
        end
    end
    for i, expType in ipairs(expected) do
        local types = {}
        for typeStr in string.gmatch(expType, '([^|]+)') do
            table.insert(types, typeStr)
        end
        if not tableContains(types, type(actual[i])) then
            if not cb then return false, string.format("Invalid argument: argument %d must be a %s", actual, expected) end
            return cb(false, error(string.format("Invalid argument: argument %d must be a %s", actual, expected), 2))
        end
    end
    return true, 'success'
end
local function tableContains(table, val)
    for i=1, #table do
        if table[i] == val then 
            return true
        end
    end
    return false
end

---@param expected any
---@param actual any
---@usage QBCorev2.Utils.validateArgs({'string', 'number'}, {1, 'string'}), using | can be used to look for multiple types
function QBCorev2.Utils.validateArgs(expected, actual)
    if type(expected) ~= 'table' then
        if type(actual) ~= expected then
            error(string.format("Invalid argument: argument %d must be a %s", actual, expected), 2)
        end
    end
    for i, expType in ipairs(expected) do
        local types = {}
        for typeStr in string.gmatch(expType, '([^|]+)') do
            table.insert(types, typeStr)
        end
        if not tableContains(types, type(actual[i])) then
            error(string.format("Invalid argument: argument %d must be one of %s", i, expType), 2)
        end
    end
end
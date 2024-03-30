QBCorev2.Utils.String = {}

--- Trims whitespace from the beginning and end of a string
---@param str string -- string to trim
---@return string -- trimmed string
---@usage QBCorev2.Utils.String.Trim('  hello  ') -- 'hello'
function QBCorev2.Utils.String.Trim(str)
    if not str then return print('error') end
    if type(str) ~= 'string' then str = tostring(str) end
    return (string.gsub(str, '^%s*(.-)%s*$', '%1'))
end


--- Splits a string into a table by a specified delimiter
---@param str string The string to split
---@param delimiter string The delimiter to split by. Defaults to a comma
---@return table -- table of substrings
---@usage QBCorev2.Utils.String.Split('hello,world', ',') -- Returns {'hello', 'world'}
function QBCorev2.Utils.String.Split(str, delimiter)
    if not str or str == '' then return print('error') end

    delimiter = delimiter or ','  -- Use comma as the default delimiter

    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    while delim_from do
        result[#result + 1] = string.sub(str, from, delim_from - 1)
        from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
    result[#result + 1] = string.sub(str, from)
    return result
end

--- Capitalizes the first letter of a string.
---@param value string the string to capitalize
---@return string the input string with the first letter capitalized
---@usage QBShared.FirstToUpper('hello') -- Returns 'Hello'
function QBCorev2.Utils.String.FirstToUpper(str)
    if not str then return print('error') end
    if type(str) ~= 'string' then str = tostring(str) end
    return (str:gsub("^%l", string.upper))
end
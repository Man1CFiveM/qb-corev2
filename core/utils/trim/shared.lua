---@param _string string -- string to trim
---@return string -- trimmed string
---@usage QBCorev2.Utils.Trim('  hello  ') -- 'hello'
function QBCorev2.Utils.Trim(_string)
    if type(_string) ~= 'string' then return error('can only trim a string',2) end
    return (string.gsub(_string, '^%s*(.-)%s*$', '%1'))
end
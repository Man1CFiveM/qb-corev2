QBCorev2.Components.GetIdentifier = {}
-- Identifier types:
-- fivem
-- license
-- discord
-- xbl
-- live
-- ip

-- get all identifiers of a player by source
---@param src any -- player source
---@return table|boolean, number -- identifier table of player, number of identifiers or return false if no identifiers
---@usage local identifiers, amount = QBCorev2.Components.GetIdentifier:All(1)
function QBCorev2.Components.GetIdentifier:All(src)
    -- if type(src) ~= 'number' then return print('error handler') end
    local identifierAmount = GetNumPlayerIdentifiers(src)
    local identifiers, count = {},0
    for i = 0, identifierAmount - 1 do
        local type, license = string.match(GetPlayerIdentifier(src, i), "(%w+):(.*)")
        if (type == 'license2' or type == 'license') and not identifiers['license'] then
            identifiers['license'] = license
            count = count + 1
        elseif type ~= 'license' and type ~= 'license2' then
            identifiers[type] = license
            count = count + 1
        end
    end
    if not next(identifiers) then return false, 0 end
    return identifiers, count
end

-- get a specific identifier of a player by source and type
---@param src any -- player source
---@param idType string -- identifier type, see Identifier types above
---@return string|boolean -- identifier of player or return false if no identifier
---@usage local identifier = QBCorev2.Components.GetIdentifier:ByType(1, 'fivem')
function QBCorev2.Components.GetIdentifier:ByType(src, idType)
    local identifiers = GetPlayerIdentifiers(src)
    for _, identifier in pairs(identifiers) do
        local type, license = string.match(identifier, "(%w+):(.+)")
        if type == idType then
            return license
        end
    end
    return false
end

exports('GetIdentifier', function ()
    return QBCorev2.Components.GetIdentifier
end)
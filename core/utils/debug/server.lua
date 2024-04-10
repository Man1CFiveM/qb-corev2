QBCorev2 = QBCorev2 or {}
QBCorev2.Utils = QBCorev2.Utils or {}

local function tPrint(_table, _indent)
    local colorCodes = {
        ['table'] = '^3',
        ['boolean'] = '^1',
        ['function'] = '^9',
        ['number'] = '^5',
        ['string'] = '^2',
        ['default'] = '^2',
        ['nil'] = '^8',
    }

    _indent = _indent or 0
    if type(_table) == 'table' then
        for k, v in pairs(_table) do
            local tableType = type(v)
            local colorCode = colorCodes[tableType] or colorCodes['default']
            local formatting = ('%s %s%s:^0'):format(string.rep('  ', _indent), colorCode, k)

            if tableType == 'table' then
                print(formatting)
                tPrint(v, _indent + 1)
            else
                print(('%s %s'):format(formatting, tostring(v)))
            end
        end
    else
        print(('%s ^0%s'):format(string.rep('  ', _indent), tostring(_table)))
    end
end

RegisterServerEvent('qbcore:utils:debug', function(_table, _indent, _resource)
    QBCorev2.Utils.ValidateArgs({_table, _indent, _resource}, {'table', 'number', 'string'}, function(success, err)
        if not success then
           return error(err)
        end
    end)
    print(('\x1b[4m\x1b[36m[ %s : DEBUG]\x1b[0m'):format(_resource))
    tPrint(_table, _indent)
    print('\x1b[4m\x1b[36m[ END DEBUG ]\x1b[0m')
end)

function QBCorev2.Utils.Debug(tbl, indent)
    -- QBCorev2.Utils.validateArgs({tbl, indent}, {'table', 'number'})
    TriggerEvent('QBCore:DebugSomething', tbl, indent, GetInvokingResource() or 'qb-core')
end

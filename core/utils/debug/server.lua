local function tPrint(tbl, indent)
    indent = indent or 0
    local indentStr = string.rep('  ', indent)

    local formatStrs = {
        ['boolean'] = '%s^1 %s ^0',
        ['function'] = '%s^9 %s ^0',
        ['number'] = '%s^5 %s ^0',
        ['string'] = "%s ^2'%s' ^0",
        ['default'] = '%s^2 %s ^0'
    }

    if type(tbl) ~= 'table' then
        print(('%s ^0%s'):format(indentStr, tostring(tbl)))
        return
    end

    for k, v in pairs(tbl) do
        local tblType = type(v)
        local formatting = ('%s ^3%s:^0'):format(indentStr, k)

        if tblType == 'table' then
            print(formatting)
            tPrint(v, indent + 1)
        else
            local formatStr = formatStrs[tblType] or formatStrs['default']
            print(formatStr:format(formatting, tostring(v)))
        end
    end
end

RegisterServerEvent('qbcore:utils:debug', function(obj, indent, resource)
    print(('\x1b[4m\x1b[36m[ %s : DEBUG]\x1b[0m'):format(resource))
    tPrint(obj, indent)
    print('\x1b[4m\x1b[36m[ END DEBUG ]\x1b[0m')
end)

function QBCorev2.Utils.Debug(tbl, indent)
    TriggerEvent('qbcore:utils:debug', tbl, indent, GetInvokingResource() or 'qb-core')
end

--backward compatibility
function QBCore.Debug(tbl, indent)
    QBCorev2.Utils.Debug(tbl, indent)
end
QBCorev2 = QBCorev2 or {}
QBCorev2.Utils = QBCorev2.Utils or {}
QBCorev2.Components = QBCorev2.Components or {}
QBCorev2.Modules = QBCorev2.Modules or {}
QBCorev2.Functions = QBCorev2.Functions or {}

exports('QBCoreReturn', function()
    return QBCorev2
end)

local sdf = {
    label = 'Adding Job Test',
    type = 'test',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = { name = 'one', payment = 50 },
        ['1'] = { name = 'two', payment = 75 },
        ['2'] = { name = 'three', payment = 100 },
        ['3'] = { name = 'four', payment = 125 },
        ['4'] = { name = 'five', isboss = true, payment = 150 },
    },
}

exports['qb-core']:AddJob('test',sdf)
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('testjobs', 'testing jobs adding', {}, false, function(source)
    TriggerClientEvent('testjobs', source)
end, 'admin')
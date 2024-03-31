QBCorev2 = QBCorev2 or {}
QBCorev2.Utils = QBCorev2.Utils or {}
QBCorev2.Components = QBCorev2.Components or {}
QBCorev2.Modules = QBCorev2.Modules or {}
QBCorev2.Functions = QBCorev2.Functions or {}

exports('QBCoreReturn', function()
    return QBCorev2
end)

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('testjobs',function()
    QBCore.Debug(QBCore.Shared.Jobs['test'])
end)
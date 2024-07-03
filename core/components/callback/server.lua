local QBCore = exports['qb-core']:GetCoreObject()

function QBCorev2.Components.TriggerClientCallback(name, source, cb, ...)
    QBCorev2.ClientCallbacks[name] = cb
    TriggerClientEvent('qbcorev2:component:TriggerClientCallback', source, name, ...)
end

function QBCorev2.Components.CreateServerCallback(name, cb)
    QBCorev2.ServerCallbacks[name] = cb
end

function QBCorev2.Components.TriggerServerCallback(name, source, cb, ...)
    if not QBCorev2.ServerCallbacks[name] then return end
    QBCorev2.ServerCallbacks[name](source, cb, ...)
end

-- RegisterNetEvent('qbcorev2:component:TriggerClientCallback', function(name, ...)
--     if QBCorev2.ClientCallbacks[name] then
--         QBCorev2.ClientCallbacks[name](...)
--     end
-- end)

RegisterNetEvent('qbcorev2:component:TriggerServerCallback', function(name, ...)
    local src = source
    QBCorev2.Components.TriggerServerCallback(name, src, function(...)
        TriggerClientEvent('qbcorev2:component:TriggerServerCallback', src, name, ...)
    end, ...)
end)











-- function QBCorev2.Components.CreateServerCallback(name, cb)
--     QBCorev2.ServerCallbacks[name] = cb
--     QBCore.Debug(QBCorev2.ServerCallbacks)
-- end

-- RegisterNetEvent('qbcore:components:TriggerServerCallback', function(name, ...)
--     local src = source
--     if QBCorev2.ServerCallbacks[name] then
--         QBCorev2.ServerCallbacks[name](...)
--     end
-- end)

-- function QBCore.Functions.TriggerCallback(name, source, cb, ...)
--     if not QBCore.ServerCallbacks[name] then return end
--     QBCore.ServerCallbacks[name](source, cb, ...)
-- end

-- RegisterNetEvent('QBCore:Server:TriggerCallback', function(name, ...)
--     local src = source
--     QBCore.Functions.TriggerCallback(name, src, function(...)
--         TriggerClientEvent('QBCore:Client:TriggerCallback', src, name, ...)
--     end, ...)
-- end)




-- Callback Events --
-- Client Callback
-- RegisterNetEvent('qbcore:components:TriggerClientCallback', function(name, ...)
--     if QBCorev2.ClientCallbacks[name] then
--         QBCorev2.ClientCallbacks[name](...)
--     end
-- end)

-- Server Callback
-- RegisterNetEvent('qbcore:components:TriggerServerCallback', function(name, ...)
--     local src = source
--     QBCorev2.Components.TriggerServerCallback(name, src, function(...)
--         TriggerClientEvent('qbcore:components:TriggerServerCallback', src, name, ...)
--     end, ...)
-- end)


-- function QBCore.Components.TriggerClientCallback(name, source, cb, ...)
--     QBCorev2.ClientCallbacks[name] = cb
--     TriggerClientEvent('qbcore:components:TriggerClientCallback', source, name, ...)
-- end

-- function QBCore.Components.CreateServerCallback(name, cb)
--     QBCorev2.ServerCallbacks[name] = cb
-- end

-- function QBCore.Components.TriggerServerCallback(name, source, cb, ...)
--     if not QBCore.ServerCallbacks[name] then return end
--     QBCorev2.ServerCallbacks[name](source, cb, ...)
-- end

-- -- Define ServerCallbacks as a separate list
-- QBCorev2.Components.Callbacks.ServerCallbacks = {}

-- -- Define CreateServerCallback as a separate function
-- function QBCorev2.Components.Callbacks:CreateServerCallback(name, cb)
--     if not QBCorev2.Components.Callbacks.ServerCallbacks[name] then
--         QBCorev2.Components.Callbacks.ServerCallbacks[name] = cb
--     end
-- end

-- -- Define TriggerClientCallback as a separate function
-- function QBCorev2.Components.Callbacks:TriggerClientCallback(name, source, ...)
--     TriggerClientEvent('qbcore:components:triggerClientCallback', source, name, ...)
-- end

-- RegisterNetEvent('qbcore:components:triggerServerCallback', function(name, ...)
--     local src = source
--     if not QBCorev2.Components.Callbacks.ServerCallbacks[name] then return end -- TODO needs a proper error message
--     QBCorev2.Components.Callbacks.ServerCallbacks[name](src, ...)
--     -- QBCorev2.Components.Callbacks.ServerCallbacks[name] = nil
-- end)

-- RegisterNetEvent('QBCore:Server:TriggerCallback', function(name, ...)
--     local src = source
--     QBCore.Functions.TriggerCallback(name, src, function(...)
--         TriggerClientEvent('QBCore:Client:TriggerCallback', src, name, ...)
--     end, ...)
-- end)

-- --backwards compatibility
-- function QBCorev2.Functions.CreateCallback(name, cb)
--     QBCorev2.Components.Callbacks.CreateServerCallback(name, cb)
-- end

-- function QBCorev2.Functions.TriggerClientCallback(name, source, cb, ...)
--     QBCorev2.Components.Callbacks.TriggerClientCallback(name, source, cb, ...)
-- end


-- QBCorev2.Components.Callbacks:CreateServerCallback('test', function(source, cb, ...)
--     print('test')
--     cb('test')
-- end)

-- QBCorev2.Components.Callbacks.CreateServerCallback('test', function(source, cb, ...)
--     print('test')
--     cb('test')
-- end)
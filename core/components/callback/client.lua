function QBCorev2.Components.CreateClientCallback(name, cb)
    QBCorev2.ClientCallbacks[name] = cb
end

function QBCorev2.Components.TriggerClientCallback(name, cb, ...)
    if not QBCorev2.ClientCallbacks[name] then return end
    QBCorev2.ClientCallbacks[name](cb, ...)
end

-- Server Callback
function QBCorev2.Components.TriggerServerCallback(name, cb, ...)
    QBCorev2.ServerCallbacks[name] = cb
    TriggerServerEvent('qbcorev2:component:TriggerServerCallback', name, ...)
end

RegisterNetEvent('qbcorev2:component:TriggerClientCallback', function(name, ...)
    QBCorev2.Components.TriggerClientCallback(name, function(...)
        TriggerServerEvent('qbcorev2:component:TriggerClientCallback', name, ...)
    end, ...)
end)

-- RegisterNetEvent('qbcorev2:component:TriggerServerCallback', function(name, ...)
--     if QBCorev2.ServerCallbacks[name] then
--         QBCorev2.ServerCallbacks[name](...)
--     end
-- end)


-- Define ClientCallbacks as a separate list
-- QBCorev2.Components.Callbacks.ClientCallbacks = {}

-- function QBCorev2.Components.TriggerServerCallback(name, ...)
--     TriggerServerEvent('qbcore:components:TriggerServerCallback', name, ...)
-- end

-- -- Define CreateClientCallback as a separate function
-- function QBCorev2.Components.Callbacks:CreateClientCallback(name, cb)
--     if not QBCorev2.Components.Callbacks.ClientCallbacks[name] then
--         QBCorev2.Components.Callbacks.ClientCallbacks[name] = cb
--     end
-- end

-- -- Define ClientCallback as a separate function
-- function QBCorev2.Components.Callbacks:ClientCallback(name, cb, ...)
--     if not QBCorev2.Components.Callbacks.ClientCallbacks[name] then return QBCorev2.Modules.logger(name) end
--     QBCorev2.Components.Callbacks.ClientCallbacks[name](cb, ...)
-- end

-- -- Define TriggerServerCallback as a separate function
-- function QBCorev2.Components.Callbacks:TriggerServerCallback(name, ...)
--     print('trigger server callback : '..name)
--     TriggerServerEvent('qbcore:components:triggerServerCallback', name, ...)
-- end

-- -- Register the event
-- RegisterNetEvent('qbcore:components:triggerClientCallback', function(name, ...)
--     if not QBCorev2.Components.Callbacks.ClientCallbacks[name] then return  end
--     QBCorev2.Components.Callbacks.ClientCallbacks[name](...)
--     -- QBCorev2.Components.Callbacks.ClientCallbacks[name] = nil
-- end)

-- -- Define the backwards compatibility functions
-- function QBCorev2.Functions.CreateClientCallback(name, cb)
--     QBCorev2.Components.Callbacks:CreateClientCallback(name, cb)
-- end

-- function QBCorev2.Functions.TriggerCallback(name, source, cb, ...)
--     QBCorev2.Components.Callbacks:TriggerServerCallback(name, source, cb, ...)
-- end


-- Callback Events --

-- Client Callback
-- RegisterNetEvent('qbcore:components:TriggerClientCallback', function(name, ...)
--     QBCorev2.Components.TriggerClientCallback(name, function(...)
--         TriggerServerEvent('qbcore:components:TriggerClientCallback', name, ...)
--     end, ...)
-- end)

-- -- Server Callback
-- -- RegisterNetEvent('qbcorev2:components:TriggerServerCallback', function(name, ...)
-- --     if QBCorev2.ServerCallbacks[name] then
-- --         QBCorev2.ServerCallbacks[name](...)
-- --     end
-- -- end)

-- -- Callback Functions --

-- -- Client Callback
-- function QBCorev2.Components.CreateClientCallback(name, cb)
--     QBCorev2.ClientCallbacks[name] = cb
-- end

-- function QBCorev2.Components.TriggerClientCallback(name, cb, ...)
--     if not QBCorev2.ClientCallbacks[name] then return end
--     QBCorev2.ClientCallbacks[name](cb, ...)
-- end

-- -- Server Callback
-- function QBCorev2.Components.TriggerServerCallback(name, cb, ...)
--     QBCorev2.ServerCallbacks[name] = cb
--     TriggerServerEvent('qbcore:components:TriggerServerCallback', name, ...)
-- end
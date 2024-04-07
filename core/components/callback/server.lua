QBCorev2.Components.Callbacks = {
    ServerCallbacks = {},

    CreateServerCallback = function(self, name, cb)
        if not self.ServerCallbacks[name] then
            self.ServerCallbacks[name] = cb
        end
    end,

    TriggerServerCallback = function(self, name, source, cb, ...)
        if not self.ServerCallbacks[name] then return QBCorev2.Modules.logger(name,source) end
        self.ServerCallbacks[name](source, cb, ...)
    end,

    TriggerClientCallback = function(self, name, source, ...)
        TriggerClientEvent('QBCore:Client:TriggerClientCallback', source, name, ...)
    end,
}

RegisterNetEvent('qbcore:components:triggerservercallback', function(name, ...)
    local src = source
    if not QBCorev2.Components.Callbacks.ServerCallbacks[name] then return QBCorev2.Modules.logger(name,src) end
    QBCorev2.Components.Callbacks.ServerCallbacks[name](src, ...)
    QBCorev2.Components.Callbacks.ServerCallbacks[name] = nil
end)

--backwards compatibility
function QBCorev2.Functions.CreateCallback(name, cb)
    QBCorev2.Components.Callbacks.CreateServerCallback(name, cb)
end

function QBCorev2.Functions.TriggerClientCallback(name, source, cb, ...)
    QBCorev2.Components.Callbacks.TriggerClientCallback(name, source, cb, ...)
end
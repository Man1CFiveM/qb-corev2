--- Callbacks for client side to server side and vice versa communication
QBCorev2.Components.Callbacks = {
    ClientCallbacks = {},

    CreateClientCallback = function(self, name, cb)
        if not self.ClientCallbacks[name] then
            self.ClientCallbacks[name] = cb
        end
    end,

    ClientCallback = function(self, name, cb, ...)
        if not self.ClientCallbacks[name] then return QBCorev2.Modules.logger(name) end
        self.ClientCallbacks[name](cb, ...)
    end,

    TriggerServerCallback = function(self, name, ...)
        TriggerServerEvent('qbcore:components:triggerServerCallback', name, ...)
    end,
}

RegisterNetEvent('qbcore:components:triggerClientCallback', function(name, ...)
    if not QBCorev2.Components.Callbacks.ClientCallbacks[name] then return QBCorev2.Modules.logger(name) end
    QBCorev2.Components.Callbacks.ClientCallbacks[name](...)
    QBCorev2.Components.Callbacks.ClientCallbacks[name] = nil
end)

--backwards compatibility
function QBCorev2.Functions.CreateClientCallback(name, cb)
    QBCorev2.Components.Callbacks.CreateClientCallback(name, cb)
end

function QBCorev2.Functions.TriggerCallback(name, source, cb, ...)
    QBCorev2.Components.Callbacks.TriggerServerCallback(name, source, cb, ...)
end
QBCorev2.Modules.Logger = {}
local Logger = {}

function Logger:Text(level, message, metadata)
    TriggerServerEvent('qb-core:server:LogMessage', level, message, metadata)
end

QBCorev2.Modules.Logger = setmetatable({}, {
    __index = function(_, key)
        local method = Logger[key]
        if method then
            return function(_, ...) return method(Logger, ...) end
        else
            error("Function " .. tostring(key) .. " does not exist in QBCorev2.Modules.Logger")
        end
    end,
    __call = function(_, ...)
        error("QBCorev2.Modules.Logger cannot be called like a function")
    end,
})

RegisterNetEvent('qb-core:server:LogMessage',function(level, message, metadata)
    Logger:Text(level, message, metadata)
end)
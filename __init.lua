-- initialization file for QBCore framework
QBCorev2 = QBCorev2 or {}
QBCorev2.Assets = QBCorev2.Assets or {}
QBCorev2.Components = QBCorev2.Components or {}
QBCorev2.Modules = QBCorev2.Modules or {}
QBCorev2.Utils = QBCorev2.Utils or {}
--backward compatibility
QBCore = QBCore or {}
QBCore.Functions = QBCore.Functions or {}
QBCorev2.Functions = QBCorev2.Functions or {}

-- Define a function that returns a metatable with error handling
function QBCorev2.CreateErrorHandlerMetaTable(moduleName)
    return {
        __index = function(_, key)
            if _G[moduleName] == nil then
                error("Module " .. moduleName .. ":" .. key .. " does not exist")
            end
            local method = _G[moduleName][key]
            if method then
                return function(_, ...) return method(_G[moduleName], ...) end
            else
                error("Function " .. tostring(key) .. " does not exist in " .. moduleName)
            end
        end,
        __call = function(_, ...)
            error(moduleName .. " cannot be called like a function")
        end,
    }
end

exports('QBCoreReturn', function()
    return QBCorev2
end)
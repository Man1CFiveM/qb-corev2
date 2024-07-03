-- initialization file for QBCore framework
QBCorev2 = {}
QBCorev2.Assets = {}
QBCorev2.ClientCallbacks = {}
QBCorev2.ServerCallbacks = {}
QBCorev2.Components = {}
QBCorev2.Components.Callbacks = {}
QBCorev2.Components.Callbacks.Client = {}
QBCorev2.Components.Callbacks.Server = {}
QBCorev2.Modules = {}
QBCorev2.Managment = {}
QBCorev2.Utils = {}
--backward compatibility
QBCore = QBCore or {}
QBCore.Functions = QBCore.Functions or {}
QBCorev2.Functions = QBCorev2.Functions or {}

exports('CoreObject', function()
    return QBCorev2
end)

-- QBCorev2.errorHandlerMetaTable = {
--     __index = function(table, key)
--         error("Function " .. tostring(key) .. " does not exist in " .. print(table))
--     end,
--     __call = function(table, ...)
--         error(tostring(table) .. " cannot be called like a function")
--     end,
-- }



-- function printTable(t, indent)
--     indent = indent or ''
--     for k, v in pairs(t) do
--         if type(v) == 'table' then
--             print(indent .. k .. ':')
--             printTable(v, indent .. '  ')
--         else
--             print(indent .. k, v)
--         end
--     end
-- end


-- local errorHandlerMetaTable = {
--     __index = function(table, key)
--         error("Function " .. tostring(key) .. " does not exist in " .. print(table))
--     end,
--     __call = function(table, ...)
--         error(tostring(table) .. " cannot be called like a function")
--     end,
-- }

-- -- Set the metatable for QBCorev2.Components, QBCorev2.Modules, and QBCorev2.Utils
-- -- QBCorev2.Components = setmetatable({}, errorHandlerMetaTable)
-- -- QBCorev2.Modules = setmetatable({}, errorHandlerMetaTable)
-- -- QBCorev2.Utils = setmetatable({}, errorHandlerMetaTable)

-- function printTable(t, indent)
--     indent = indent or ''
--     for k, v in pairs(t) do
--         if type(v) == 'table' then
--             print(indent .. k .. ':')
--             printTable(v, indent .. '  ')
--         else
--             print(indent .. k, v)
--         end
--     end
-- end

-- function GetQBCorev2()
--     -- Set the metatable for QBCorev2.Components, QBCorev2.Modules, and QBCorev2.Utils
--     QBCorev2.Components = setmetatable(QBCorev2.Components or {}, errorHandlerMetaTable)
--     QBCorev2.Modules = setmetatable(QBCorev2.Modules or {}, errorHandlerMetaTable)
--     QBCorev2.Utils = setmetatable(QBCorev2.Utils or {}, errorHandlerMetaTable)
--     printTable(QBCorev2)
--     return QBCorev2
-- end

-- exports('CoreObject', GetQBCorev2)

-- Define a function that returns a metatable with error handling
    -- function QBCorev2.CreateErrorHandlerMetaTable(moduleName)
    --     return {
    --         __index = function(_, key)
    --             if _G[moduleName] == nil then
    --                 error("Module " .. moduleName .. ":" .. key .. " does not exist"..debug.traceback())
    --             end
    --             local method = _G[moduleName][key]
    --             if method then
    --                 return function(_, ...)
    --                     local status, result = pcall(method, _G[moduleName], ...)
    --                     if not status then
    --                         -- An error occurred, log it
    --                         print("Error in module " .. moduleName .. ", function " .. tostring(key) .. ": " .. result)
    --                         print(debug.traceback())
    --                         return nil
    --                     end
    --                     return result
    --                 end
    --             else
    --                 error("Function " .. tostring(key) .. " does not exist in " .. moduleName)
    --             end
    --         end,
    --         __call = function(_, ...)
    --             error(moduleName .. " cannot be called like a function")
    --         end,
    --     }
    -- end

    -- function QBCorev2.CreateErrorHandlerMetaTable(moduleName, moduleTable)
    --     return setmetatable({}, {
    --         __index = function(_, key)
    --             print(moduleTable[key])
    --             if moduleTable[key] then
    --                 return moduleTable[key]
    --             else
    --                 error("Function " .. tostring(key) .. " does not exist in " .. moduleName)
    --             end
    --         end,
    --         __newindex = function(_, key, value)
    --             rawset(moduleTable, key, value)
    --         end,
    --         __call = function(_, ...)
    --             error(moduleName .. " cannot be called like a function")
    --         end,
    --     })
    -- end



-- local function errorHandler(err)
--     print("An error occurred: " .. err)
--     print(debug.traceback())
-- end

-- local status, result = xpcall(function()
--     -- Your code here
-- end, errorHandler)


-- if not status then
--     print("An error occurred: " .. result)
-- end
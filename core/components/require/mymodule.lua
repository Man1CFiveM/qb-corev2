local M = {}

-- Define a metatable
local mt = {
    __index = function(table, key)
        local value = rawget(table, key)
        if value == nil then
            error("Attempt to access non-existent key: " .. key)
        end
        return value
    end,
    __newindex = function(table, key, value)
        print("Setting key: " .. key .. " to value: " .. tostring(value))
        rawset(table, key, value)
    end
}

-- Set the metatable for the module
setmetatable(M, mt)

function M.sayHello()
    print("Hello from mymodule!")
end

return M
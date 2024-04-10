QBCorev2.Modules.Logger = {}
local Logger = {}

function Logger:Screenshot()
    local imageData = exports.fmsdk:takeImage({
        script = GetInvokingResource(),
        name = "My image",
        description = "Explanation",
    })
end

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


-- exports.fmsdk:LogMessage("error", "An error occurred")
-- exports['screenshot-basic']:requestScreenshotUpload('https://api.fivemanage.com/api/image',
-- 'image',
-- {
--     headers = {
--         Authorization = "UVtf8BLrjcayebVgD0k8mtAuL6n8llSV"
--     }
-- },
-- function(data)
--     local resp = json.decode(data)
--     if resp then
--         print(resp.url)
--     end
-- end)
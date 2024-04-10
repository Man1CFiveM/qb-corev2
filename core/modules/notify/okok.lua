-- OkOkNotify integration for QBCorev2
-- This module is a wrapper for the OkOkNotify resource, which is a notification system for FiveM.
-- https://docs.okokscripts.io/scripts/okoknotify#displaying-a-notification

RegisterNUICallback('getNotifyConfig', function(_, cb) -- why isnt this in the notify module?
    cb(QBCore.Config.Notify)
end)

---Notify the client with a message
---@param text string | table -- single string or table with text and/or caption
---@param type string -- primary | success | warning | error | police | etc, colour of the notification
---@param duration number -- time in ms 1000 = 1 second
---@param icon string -- icon name, see QBConfig.Notify.VariantDefinitions
function QBCorev2.Modules.Notify(text, type, duration, icon, playSound)
    QBCorev2.Utils.validateArgs({'string', 'string', 'number', 'string'}, {text, type, duration, icon}, function (valid, err)
        if not valid then
            return error(err)
        end
    end)
    if type(text) == 'table' then
        return exports['okokNotify']:Alert(text.caption, text.text, duration, type, playSound)
    end
    exports['okokNotify']:Alert('Notification', text, duration, type, playSound)
end

---Netevent to notify the client from the server
---@param text string -- the text to display
---@param type string -- primary | success | warning | error | police | etc, colour of the notification
---@param duration number -- time in ms 1000 = 1 second
---@param icon string -- icon name, see QBConfig.Notify.VariantDefinitions
---@usage TriggerEvent('qbcore:modules:notify', 'Hello World', 'primary', 5000, 'fas fa-bell')
RegisterNetEvent('qbcore:modules:notify', function(text, type, duration, icon, playSound)
    QBCorev2.Modules.Notify(text, type, duration, icon, playSound)
end)

-- backward compatibility
function QBCore.Functions.Notify(text, type, duration, icon, playSound)
    QBCorev2.Modules.Notify(text, type, duration, icon, playSound)
end
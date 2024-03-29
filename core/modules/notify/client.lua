RegisterNUICallback('getNotifyConfig', function(_, cb) -- why isnt this in the notify module?
    cb(QBCore.Config.Notify)
end)

--- docs.QBCorev2org
---@param _text string | table -- single string or table with text and/or caption
---@param _type string -- primary | success | warning | error | police | etc, colour of the notification
---@param _duration number -- time in ms 1000 = 1 second
---@param _icon string -- icon name, see QBConfig.Notify.VariantDefinitions
function QBCorev2.Modules.Notify(_text, _type, _duration, _icon)
    QBCorev2.Utils.validateArgs({'string', 'string', 'number', 'string'}, {_text, _type, _duration, _icon})
    local message = {
        action = 'notify',
        type = _type or 'primary',
        length = _duration or 5000,
    }
    message.text = _text
    if type(_text) == 'table' then
        message.text = _text.text or 'Placeholder'
        message.caption = _text.caption or 'Placeholder'
    end

    if _icon then
        message.icon = _icon
    end
    SendNUIMessage(message)
end

RegisterNetEvent('qbcore:modules:notify', function(_text, _type, _duration, _icon)
    QBCorev2.Modules.Notify(_text, _type, _duration, _icon)
end)

-- okokNotify is a notification resource, this is a wrapper for it
-- function QBCorev2.Modules.Notify(_text, _type, _duration, _icon, _playSound)
--     if not _playSound then _playSound = false end
--     if type(_text) ~= 'table' then
--         exports['okokNotify']:Alert('', _text, _duration, _type, _playSound)
--     end
--     exports['okokNotify']:Alert(_text.caption, _text.text, _duration, 'type', _playSound)
-- end

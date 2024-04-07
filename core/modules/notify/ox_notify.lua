RegisterNUICallback('getNotifyConfig', function(_, cb) -- why isnt this in the notify module?
    cb(QBCorev2.Config.Notify)
end)

function QBCorev2.Modules.Notify(text, notifyType, duration)
    notifyType = notifyType or 'inform'
    if notifyType == 'primary' then notifyType = 'inform' end
    duration = duration or 5000
    local position = 'center-right' -- 'top' | 'top-right' | 'top-left' | 'bottom' | 'bottom-right' | 'bottom-left'
    if type(text) == "table" then
        local title = text.text or 'Placeholder'
        local description = text.caption or 'Placeholder'
        lib.notify({ title = title, description = description, duration = duration, type = notifyType, position = position})
    else
        lib.notify({ description = text, duration = duration, type = notifyType, position = position})
    end
end

RegisterNetEvent('qbcore:modules:notify', function(_text, _type, _duration, _icon)
    QBCorev2.Modules.Notify(_text, _type, _duration, _icon)
end)
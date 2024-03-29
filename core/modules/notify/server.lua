-- Server side function for the notify component. This will send a notification to the client or clients depending on the source.
function QBCorev2.Modules.Notify(_source, _text, _type, _duration, _icon)
    if not _source then return print('cant trigger client event without source') end
    TriggerClientEvent('qbcore:components:notify', _source, _text, _type, _duration, _icon)
end
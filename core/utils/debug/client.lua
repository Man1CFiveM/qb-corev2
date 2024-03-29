QBCorev2 = QBCorev2 or {}
QBCorev2.Utils = QBCorev2.Utils or {}

function QBCorev2.Utils.debug(resource, obj, depth)
    TriggerServerEvent('qbcore:utils:debug', resource, obj, depth)
end
function QBCorev2.Utils.Debug(obj)
    TriggerServerEvent('qbcore:utils:debug', obj, 0, GetInvokingResource() or 'qb-core')
end
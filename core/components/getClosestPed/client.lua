    ---@return number | nil -- closest ped from player | entity or nil
    function QBCorev2.Components.GetClosestPed(_entity)
        if not _entity then _entity = PlayerPedId() end
        local playerPos = GetEntityCoords(_entity)
        local peds = GetGamePool('CPed')
        local closestPed = nil
        local closestDistance = 1000.0

        for i=1, #peds do
            local pedPos = GetEntityCoords(peds[i])
            local distance = #(playerPos - pedPos)

            if distance < closestDistance then
                closestPed = peds[i]
                closestDistance = distance
            end
        end

        return closestPed
    end
--- Get closest player to the player or entity provided
--- @param coords vector3 -- entity to get closest player to
--- @return number|boolean, number|boolean, number|boolean -- closest player to the player or entity
--- @usage QBCorev2.Components.GetClosestPlayer(PlayerPedId())
function QBCorev2.Components.ClosestPlayer(coords)
    if not coords then coords = GetEntityCoords(PlayerPedId()) end
    local closestPlayers = QBCorev2.Components.GetPlayersFromCoords(coords, 5)
    local closestDistance = -1
    local closestPlayer = -1
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    if not closestPlayer then return false, false, false end
    return closestPlayer, closestDistance, GetPlayerServerId(closestPlayer)
    -- GetPlayerServerId(closestPlayer)
end
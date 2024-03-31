--- Get players from coords
---@param coords vector3 -- The coordinates to check from (default is the player's coords)
---@param distance number -- The distance to check from, default is 5
---@return table -- List of players
---@usage QBCorev2.Components.GetPlayersFromCoords(vector3(0, 0, 0), 5)
function QBCorev2.Components.GetPlayersFromCoords(coords, distance)
    local players = GetActivePlayers()
    local playerPed = PlayerPedId()

    if type(coords) ~= 'vector3' then
        coords = GetEntityCoords(playerPed)       
    end

    distance = distance or 5
    local closePlayers = {}

    for i=1 , #players do
        local otherPlayerPed = GetPlayerPed(players[i])
        local otherPlayerCoords = GetEntityCoords(otherPlayerPed)
        local distanceToOtherPlayer = #(otherPlayerCoords - coords)

        if distanceToOtherPlayer <= distance then
            closePlayers[#closePlayers + 1] = players[i]
        end
    end

    return closePlayers
end
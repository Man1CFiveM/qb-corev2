--- Get all peds in the game world
---@param ignoreList table -- List of peds to ignore
---@return table -- List of peds
---@usage QBCorev2.Components.GetPeds({ped1, ped2})
function QBCorev2.Components.GetPeds(ignoreList)
    local pedPool = GetGamePool('CPed')
    local peds = {}
    local ignoreSet = {}

    for i = 1, #ignoreList, 1 do
        ignoreSet[ignoreList[i]] = true
    end

    for i = 1, #pedPool, 1 do
        if not ignoreSet[pedPool[i]] then
            peds[#peds + 1] = pedPool[i]
        end
    end

    return peds
end
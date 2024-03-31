--- Loads a particle dictionary
---@param dictionary string -- The name of the particle dictionary
---@usage QBCorev2.Components.LoadParticleDictionary('core')
function QBCorev2.Components.LoadParticleDictionary(dictionary)
    if HasNamedPtfxAssetLoaded(dictionary) then return end
    RequestNamedPtfxAsset(dictionary)
    local time = GetGameTimer()
    while not HasNamedPtfxAssetLoaded(dictionary) do
        if GetGameTimer() - time > 1000 then
            return print('Failed to load particle dictionary: ' .. dictionary)
        end
        Wait(0)
    end
end
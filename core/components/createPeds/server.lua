-- https://docs.fivem.net/docs/game-references/ped-models/
--- Server sided CreatePed function
---@param hash -- Ped module
---@param vector4 vector4 -- x, y, z, heading
---@param isNetwork boolean -- Whether to create a network object for the ped. If false, the ped exists only locally
---@param bScriptHostPed boolean -- Whether the ped is a script host ped or not (if true, the ped will be deleted when the script host is deleted)
---@return number -- Ped handle
---@usage QBCorev2.Components.CreatePed('a_m_m_skater_01', vector4, true, false)
function QBCorev2.Components.CreatePed(hash, vector4, isNetwork, bScriptHostPed)
    local x, y, z, heading = vector4.x, vector4.y, vector4.z, vector4.w
    local ped = CreatePed(0, joaat(hash), x, y, z, heading, isNetwork, bScriptHostPed)
    return ped
end
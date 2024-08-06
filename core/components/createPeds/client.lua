-- https://docs.fivem.net/docs/game-references/ped-models/
--- Client sided CreatePed function
---@param model string -- Ped module
---@param vector4 vector4 -- x, y, z, heading
---@param isNetwork boolean -- Whether to create a network object for the ped. If false, the ped exists only locally
---@param bScriptHostPed boolean -- Whether the ped is a script host ped or not (if true, the ped will be deleted when the script host is deleted)
---@return number -- Ped handle
---@usage QBCorev2.Components.CreatePed('a_m_m_skater_01', vector4, true, false)
function QBCorev2.Components.CreatePed(model, vector4, isNetwork, bScriptHostPed)
    local x, y, z, heading = vector4.x, vector4.y, vector4.z, vector4.w
    QBCorev2.Components.RequestModel(model)
    local ped = CreatePed(0, joaat(model), x, y, z, heading, isNetwork, bScriptHostPed)
    return ped
end
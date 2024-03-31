--- Starts a particle effect at a specified location
---@param dict string -- The name of the particle dictionary
---@param particleName string -- The name of the particle effect
---@param looped boolean -- Whether the particle effect should be looped
---@param coords table -- The coordinates of the particle effect
---@param rot table -- The rotation of the particle effect
---@param scale number -- The scale of the particle effect
---@param alpha number -- The alpha of the particle effect
---@param color table -- The color of the particle effect
---@param duration number -- The duration of the particle effect
---@usage QBCorev2.Components.StartParticleAtCoord('core', 'ent_amb_wind_grass', false, vector3(0, 0, 0), vector3(0, 0, 0), 1.0, 10.0, {r = 255, g = 255, b = 255}, 5000)
function QBCorev2.Components.StartParticleAtCoord(dict, particleName, looped, coords, rot, scale, alpha, color, duration)
    QBCorev2.Utils.validateArgs({dict, particleName, looped, coords, rot, scale, alpha, color, duration},{'string', 'string', 'boolean', 'table', 'table', 'number', 'number', 'table', 'number'})
    QBCorev2.Components.LoadParticleDictionary(dict)
    UseParticleFxAsset(dict)
    if not looped then
        SetParticleFxNonLoopedAlpha(alpha or 10.0)
        if color then SetParticleFxNonLoopedColour(color.r, color.g, color.b) end
        return StartParticleFxNonLoopedAtCoord(particleName, coords.x, coords.y, coords.z, rot.x, rot.y, rot.z, scale or 1.0, false, false, false)
    end
    local particle = StartParticleFxLoopedAtCoord(particleName, coords.x, coords.y, coords.z, rot.x, rot.y, rot.z, scale or 1.0, false, false, false, 0)
    if color then SetParticleFxLoopedColour(particle, color.r, color.g, color.b, false) end
    if duration then
        StopParticleFxLooped(particle, 0)
        Wait(duration)
    end
    SetParticleFxLoopedAlpha(particle, alpha or 10.0)
    return particle
end
--- Starts a particle effect on an entity
---@param dict string -- The name of the particle dictionary
---@param ptName string -- The name of the particle effect
---@param looped boolean -- Whether the particle effect should be looped
---@param entity number -- The entity to attach the particle effect to
---@param bone string -- The bone to attach the particle effect to
---@param offset table -- The offset from the entity to attach the particle effect
---@param rot table -- The rotation of the particle effect
---@param scale number -- The scale of the particle effect
---@param alpha number -- The alpha of the particle effect
---@param color table -- The color of the particle effect
---@param evolution table -- The evolution of the particle effect
---@param duration number -- The duration of the particle effect
---@usage QBCorev2.Components.StartParticleOnEntity('core', 'ent_amb_smoke', false, PlayerPedId(), 'IK_Head', { x = 0.0, y = 0.0, z = 0.0 }, { x = 0.0, y = 0.0, z = 0.0 }, 1.0, 10.0, { r = 255, g = 255, b = 255 }, { name = 'speed', amount = 0.1 }, 5000)
function QBCorev2.Components.StartParticleOnEntity(dict, ptName, looped, entity, bone, offset, rot, scale, alpha, color, evolution, duration)
    QBCorev2.Components.LoadParticleDictionary(dict)
    UseParticleFxAsset(dict)
    local particleHandle, boneID
    if bone and GetEntityType(entity) == 1 then
        boneID = GetPedBoneIndex(entity, bone)
    elseif bone then
        boneID = GetEntityBoneIndexByName(entity, bone)
    end
    if looped then
        if bone then
            particleHandle = StartParticleFxLoopedOnEntityBone(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, boneID, scale)
        else
            particleHandle = StartParticleFxLoopedOnEntity(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, scale)
        end
        if evolution then
            SetParticleFxLoopedEvolution(particleHandle, evolution.name, evolution.amount, false)
        end
        if color then
            SetParticleFxLoopedColour(particleHandle, color.r, color.g, color.b, false)
        end
        SetParticleFxLoopedAlpha(particleHandle, alpha)
        if duration then
            Wait(duration)
            StopParticleFxLooped(particleHandle, 0)
        end
    else
        SetParticleFxNonLoopedAlpha(alpha or 10.0)
        if color then
            SetParticleFxNonLoopedColour(color.r, color.g, color.b)
        end
        if bone then
            StartParticleFxNonLoopedOnPedBone(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, boneID, scale)
        else
            StartParticleFxNonLoopedOnEntity(ptName, entity, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, scale)
        end
    end
    return particleHandle
end
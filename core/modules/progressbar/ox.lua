--https://discord.com/channels/831626422232678481/1217634191672610887
--Created by ByteGenius/CTB
--- Progressbar function By ox
---@param label string -- The text to display on the progress bar
---@param duration number -- The duration of the progress bar in milliseconds
---@param useWhileDead boolean -- Whether the progress bar should be displayed while the player is dead
---@param canCancel boolean -- Whether the progress bar can be cancelled by the player
---@param disableControls table -- Whether the player should have their controls disabled while the progress bar is active
---@param animation table -- The animation to play while the progress bar is active
---@param prop table -- The prop to display while the progress bar is active
---@param onFinish function -- The function to call when the progress bar completes
---@param onCancel function -- The function to call when the progress bar is cancelled
---@usage QBCorev2.Modules.Progressbar('Doing something', 5000, false, false, {disableMovement = true, disableCarMovement = true, disableMouse = true, disableCombat = true}, {animDict = 'anim@heists@ornate_bank@hostages@hit', anim = 'hit_react_die_table', flags = 49}, {propOne = 'p_ld_id_card_01', bone = 57005, coords = vector3(0.0, 0.0, 0.0), rotation = vector3(0.0, 0.0, 0.0)}, function() print('Finished') end, function() print('Cancelled') end)
function QBCorev2.Modules.Progressbar(_, label, duration, useWhileDead, canCancel, disableControls, animation, prop, _ , onFinish, onCancel, _)
    if GetResourceState('progressbar') ~= 'started' then error('progressbar needs to be started in order for QBCore.Functions.Progressbar to work') end
    local disable = {
        move = disableControls.disableMovement,
        car = disableControls.disableCarMovement,
        mouse = disableControls.disableMouse,
        combat = disableControls.disableCombat,
    }

    local anim = {
        dict = animation.animDict,
        clip = animation.anim,
        flag = animation.flags,
    }
    local props = {
        model = prop.propOne,
        bone = prop.bone,
        pos = prop.coords,
        rot = prop.rotation,
    }
    if lib.progressBar({
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        disable = disable,
        anim = anim,
        prop = props,
    }) then
        if onFinish then
            onFinish()
        end
    else
        if onCancel then
            onCancel()
        end
    end
end

--- ProgressCircle function By ox
---@param duration number -- The duration of the progress circle in milliseconds
---@param useWhileDead boolean -- Whether the progress circle should be displayed while the player is dead
---@param canCancel boolean -- Whether the progress circle can be cancelled by the player
---@param disableControls table -- Whether the player should have their controls disabled while the progress circle is active
---@param animation table -- The animation to play while the progress circle is active
---@param prop table -- The prop to display while the progress circle is active
---@param onFinish function -- The function to call when the progress circle completes
---@param onCancel function -- The function to call when the progress circle is cancelled
---@usage QBCorev2.Modules.ProgressCircle(5000, false, false, {disableMovement = true, disableCarMovement = true, disableMouse = true, disableCombat = true}, {animDict = 'anim@heists@ornate_bank@hostages@hit', anim = 'hit_react_die_table', flags = 49}, {propOne = 'p_ld_id_card_01', bone = 57005, coords = vector3(0.0, 0.0, 0.0), rotation = vector3(0.0, 0.0, 0.0)}, function() print('Finished') end, function() print('Cancelled') end)
function QBCorev2.Modules.ProgressCircle(_, _, duration, useWhileDead, canCancel, disableControls, animation, prop, _, onFinish, onCancel, _)
    if GetResourceState('progressbar') ~= 'started' then error('progressbar needs to be started in order for QBCore.Functions.Progressbar to work') end
    local disable = {
        move = disableControls.disableMovement,
        car = disableControls.disableCarMovement,
        mouse = disableControls.disableMouse,
        combat = disableControls.disableCombat,
    }

    local anim = {
        dict = animation.animDict,
        clip = animation.anim,
        flag = animation.flags,
    }
    local props = {
        model = prop.propOne,
        bone = prop.bone,
        pos = prop.coords,
        rot = prop.rotation,
    }
    if lib.progressCircle({
        duration = duration,
        position = 'bottom',
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        disable = disable,
        anim = anim,
        prop = props,
    }) then
        if onFinish then
            onFinish()
        end
    else
        if onCancel then
            onCancel()
        end
    end
end
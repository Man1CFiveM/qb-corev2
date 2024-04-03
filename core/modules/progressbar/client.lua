---@param name string: The name of the progress bar
---@param label string: The text to display on the progress bar
---@param duration number: The duration of the progress bar in milliseconds
---@param useWhileDead boolean: Whether the progress bar should be displayed while the player is dead
---@param canCancel boolean: Whether the progress bar can be cancelled by the player
---@param disableControls boolean: Whether the player should have their controls disabled while the progress bar is active
---@param animation string: The animation to play while the progress bar is active
---@param prop string: The prop to display while the progress bar is active
---@param propTwo string: The second prop to display while the progress bar is active
---@param onFinish function: The function to call when the progress bar completes
---@param onCancel function: The function to call when the progress bar is cancelled
---@usage QBCorev2.Modules.progressbar('unique_name', 'Doing something', 5000, false, false, false, 'prop', 'propTwo', function() print('Finished') end, function() print('Cancelled') end)
function QBCorev2.Modules.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    QBCorev2.Utils.ValidateArgs({name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel}, {'string', 'string', 'number', 'boolean', 'boolean', 'boolean', 'string', 'string', 'string', 'function', 'function'}, function (success, err)
        if not success then
            error(err)
        end
    end)
    
        if GetResourceState('progressbar') ~= 'started' then
        error('The progressbar resource needs to be started in order for QBCore.Modules.progressbar to work. Please ensure the progressbar resource is running.') 
    end
    -- Validate essential parameters
    if not name or not label or not duration then
        error('The parameters name, label, and duration are required for creating a progress bar.')
    end
    --if using a different progress bar resource, change the exports['progressbar'] to the appropriate export
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            -- Check if onFinish is a function before calling it
            if onFinish and type(onFinish) == 'function' then
                onFinish()
            end
        else
            -- Check if onCancel is a function before calling it
            if onCancel and type(onCancel) == 'function' then
                onCancel()
            end
        end
    end)
end
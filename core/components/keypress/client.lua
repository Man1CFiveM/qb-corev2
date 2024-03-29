QBCorev2 = QBCorev2 or {}
QBCorev2.Components = QBCorev2.Components or {}

---@param _command any
---@param _description any
---@param _key any
---@param _func any
function QBCorev2.Components.keyPress(_command, _description, _key, _func)
    RegisterCommand('+' .. _command, function()
        _func()
    end, false)

    RegisterKeyMapping('+' .. _command, _description, 'keyboard', _key)
end

-- Function to register key release action
function QBCorev2.Components.keyRelease(_command, _description, _key, _func)
    RegisterCommand('-' .. _command, function()
        _func()
    end, false)

    RegisterKeyMapping('-' .. _command, _description, 'keyboard', _key)
end

QBCorev2.Components.keyPress('myAction', 'Perform my action', 'G', function()
    print('G key pressed')
end)

QBCorev2.Components.keyRelease('myAction', 'Stop performing my action', 'G', function()
    print('G key released')
end)
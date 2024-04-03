QBCorev2.Components.Display = setmetatable({
    prompt = function(self, _text, _position)
        QBCorev2Utils.validateArgs({'string', 'string'}, {_text, _position})
        if type(_position) ~= 'string' then _position = 'left' end
        SendNUIMessage({
            action = 'DRAW_TEXT',
            data = {
                text = _text,
                position = _position
            }
        })
    end,
    change = function(self, _text, _position)
        QBCorev2Utils.validateArgs({'string', 'string'}, {_text, _position})
        if type(_position) ~= 'string' then _position = 'left' end
        SendNUIMessage({
            action = 'CHANGE_TEXT',
            data = {
                text = _text,
                position = _position
            }
        })
    end,
    hide = function(self)
        SendNUIMessage({
            action = 'HIDE_TEXT',
        })
    end,
    keyPressed = function(self)
        SendNUIMessage({
            action = 'KEY_PRESSED',
        })
        Wait(500)
        self.hide()
    end,
}, {
    __index = function(_, key)
        local value = rawget(QBCorev2Modules.Display, key)
        if value then
            return value
        end
        return error("Function " .. key .. " does not exist in QBCorev2Modules.Display", 2)
    end
})

exports('Display', QBCorev2.Modules.Display())
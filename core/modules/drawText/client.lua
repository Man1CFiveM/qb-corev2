QBCorev2.Modules.DrawText = {}
local DrawText = {}

--- Draw the text on the screen at the specified position
---@param text string -- the text to display
---@param position string -- the position to display the text
---@usage QBCorev2.Modules.DrawText:Draw('Hello World', 'left')
function DrawText:Draw(text, position)
    QBCorev2.Utils.ValidateArgs({'string', 'string'}, {text, position}, function(success, err)
        if not success then
            return error(err)
        end
    end)
    SendNUIMessage({
        action = 'DRAW_TEXT',
        data = {
            text = text,
            position = position
        }
    })
end

--- Hide the text
---@useage QBCorev2.Modules.DrawText:Hide()
function DrawText:Hide()
    SendNUIMessage({
        action = 'HIDE_TEXT',
    })
end

--- Change the text on the screen at the specified position
---@param text string -- the text to display
---@param position string -- the position to display the text
---@usage QBCorev2.Modules.DrawText:Change('Hello World, Again', 'right')
function DrawText:Change(text, position)
    QBCorev2.Utils.ValidateArgs({'string', 'string'}, {text, position}, function(success, err)
        if not success then
            return error(err)
        end
    end)
    SendNUIMessage({
        action = 'CHANGE_TEXT',
        data = {
            text = text,
            position = position
        }
    })
end

--- Hide the text after a key is pressed
---@usage QBCorev2.Modules.DrawText:KeyPressed()
function DrawText:KeyPressed()
    SendNUIMessage({
        action = 'KEY_PRESSED',
    })
    Wait(500)
    self:Hide()
end

QBCorev2.Modules.DrawText = setmetatable({}, {
    __index = function(_, key)
        local method = DrawText[key]
        if method then
            return function(_, ...) return method(DrawText, ...) end
        else
            error("Function " .. tostring(key) .. " does not exist in QBCorev2.Modules.DrawText")
        end
    end,
    __call = function(_, ...)
        error("QBCorev2.Modules.DrawText cannot be called like a function")
    end,
})

--backwards compatibility, not adding any new events. calling the function is cleaner and safer
RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    QBCorev2.Modules.DrawText:Draw(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    QBCorev2.Modules.DrawText:Change(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    QBCorev2.Modules.DrawText:Hide()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    QBCorev2.Modules.DrawText:KeyPressed()
end)

exports('DrawText', QBCorev2.Modules.DrawText.Draw)
exports('ChangeText', QBCorev2.Modules.DrawText.Change)
exports('HideText', QBCorev2.Modules.DrawText.Hide)
exports('KeyPressed', QBCorev2.Modules.DrawText.KeyPressed)
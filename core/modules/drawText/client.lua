QBCorev2.Modules.DrawText = {}

--- Draw the text on the screen at the specified position
---@param text string -- the text to display
---@param position string -- the position to display the text
---@usage QBCorev2.Modules.DrawText.Draw('Hello World', 'left')
function QBCorev2.Modules.DrawText.Draw(text, position)
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
---@useage QBCorev2.Modules.DrawText.Hide()
function QBCorev2.Modules.DrawText.Hide()
    SendNUIMessage({
        action = 'HIDE_TEXT',
    })
end

--- Change the text on the screen at the specified position
---@param text string -- the text to display
---@param position string -- the position to display the text
---@usage QBCorev2.Modules.DrawText.Change('Hello World, Again', 'right')
function QBCorev2.Modules.DrawText.Change(text, position)
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
---@usage QBCorev2.Modules.DrawText.KeyPressed()
function QBCorev2.Modules.DrawText.KeyPressed()
    SendNUIMessage({
        action = 'KEY_PRESSED',
    })
    Wait(500)
    QBCorev2.Modules.DrawText.Hide()
end

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    QBCorev2.Modules.DrawText.Draw(text, position)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    QBCorev2.Modules.DrawText.Change(text, position)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    QBCorev2.Modules.DrawText.Hide()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    QBCorev2.Modules.DrawText.KeyPressed()
end)

exports('DrawText', QBCorev2.Modules.DrawText.Draw)
exports('ChangeText', QBCorev2.Modules.DrawText.Change)
exports('HideText', QBCorev2.Modules.DrawText.Hide)
exports('KeyPressed', QBCorev2.Modules.DrawText.KeyPressed)
-- QBCorev2 = {}
-- QBCorev2.Functions = {}

-- local function validateArgs(expected, actual) -- needs to be placed in QB-Core.ErrorHandler.validateArgs
--     if type(expected) ~= 'table' then
--         if type(actual) ~= expected then
--             error(string.format("Invalid argument: argument %d must be a %s", actual, expected), 3)
--         end
--     end
--     for i, expType in ipairs(expected) do
--         if type(actual[i]) ~= expType then
--             error(string.format("Invalid argument: argument %d must be a %s", i, expType), 3)
--         end
--     end
-- end

-- local function text3d(self, _x, _y, _width, _height, _scale, _r, _g, _b, _a, _text)
--     validateArgs({'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'string'}, {_x, _y, _width, _height, _scale, _r, _g, _b, _a, _text})
--     local onScreen, x, y = World3dToScreen2d(_x, _y, _z)
--     local pos = GetFinalRenderedCamCoord()
--     local distance = #(vector3(pos.x, pos.y, pos.z) - vector3(_x, _y, _z))
--     local scale = ((1 / distance) * 2) * (1 / GetGameplayCamFov()) * 100

--     if onScreen then
--         SetTextScale(0.0 * scale, 0.55 * scale)
--         SetTextFont(0)
--         SetTextScale(_scale, _scale)
--         SetTextColour(255, 255, 255, 255)
--         SetTextColour(_r, _g, _b, _a)
--         SetTextDropshadow(0, 0, 0, 0, 255)
--         SetTextEdge(2, 0, 0, 0, 150)
--         SetTextDropShadow()
--         SetTextOutline()
--         SetTextEntry("STRING")
--         SetTextCentre(true)
--         AddTextComponentString(_text)
--         EndTextCommandDisplayText(_x - _width / 2, _y - _height / 2 + 0.005)
--     end
-- end
-- local QBCore = exports['qb-core']:GetCoreObject()
-- -- Add the functions to the metatable
-- QBCorev2.Functions.DrawText = setmetatable({
--     text3d = text3d,
--     text2d = text2d,
-- }, {
--     __index = function(_, key)
--         local value = rawget(QBCorev2Functions.DrawText, key)
--         if value then
--             return value
--         end
--         return error("Function " .. key .. " does not exist in QBCorev2Functions.Display", 2)
--     end
-- })


-- SetTextFont(fontType)  -- Sets the font of the text
-- SetTextProportional(proportional)  -- Sets whether the text is proportional
-- SetTextScale(scaleX, scaleY)  -- Sets the scale of the text
-- SetTextColour(red, green, blue, alpha)  -- Sets the color of the text
-- SetTextDropshadow(distance, red, green, blue, alpha)  -- Sets the dropshadow of the text
-- SetTextEdge(p, red, green, blue, alpha)  -- Sets the edge of the text
-- SetTextOutline()  -- Sets the outline of the text
-- SetTextCentre(center)  -- Sets the text to be centered
-- SetDrawOrigin(x, y, z, p)  -- Sets the origin point for drawing in the 3D world
-- ClearDrawOrigin()  -- Clears the draw origin to reset the drawing state
-- SetTextEntry("STRING")  -- Sets the text entry for the text
-- AddTextComponentString(text)  -- Adds a text component string
-- AddTextComponentSubstringPlayerName(text)  -- Adds a text component substring with the player's name
-- BeginTextCommandDisplayText("STRING")  -- Begins the text command to display text
-- BeginTextCommandGetWidth("STRING")  -- Begins the text command to get the width of the text, seems to be returing the width of the text in pixels
-- EndTextCommandDisplayText(x, y)  -- Ends the text command to display text
-- DrawText(x, y)  -- Draws the text at the specified 2D coordinates

-- QBCorev2.Components = {} or QBCorev2.Components

QBCorev2.Components.ShowSubtitle = function(text, duration)
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(duration, true)
end

-- Example usage
CreateThread(function()
    while true do
        Wait(5000) -- Wait for 5 seconds
        QBCorev2.Components.ShowSubtitle("Hello, this is a subtitle!", 2000) -- Show subtitle for 2 seconds
    end
end)
--https://docs.fivem.net/docs/game-references/blips/#blips
--https://docs.fivem.net/docs/game-references/blips/#blip-colors
--- Creates a blip for the specified coordinates

-- display Behaviour explanation
-- 0 = Doesn't show up, ever, anywhere
-- 2 = Shows on both main map and minimap. (Selectable on map)
-- 3 = Shows on main map only. (Selectable on map)
-- 4 = Shows on main map only. (Selectable on map)
-- 5 = Shows on minimap only.
-- 8 = Shows on both main map and minimap. (Not selectable on map)
---@param coords vector3 -- vector3
---@param sprite number -- The sprite ID of the blip
---@param color number -- The color of the blip
---@param text string -- The label of the blip
---@param scale number -- The scale of the blip
---@param range boolean -- Whether the blip should be short range, default set to true
---@param behaviour number -- The display behaviour of the blip, default set to 4. Anything higher than 10 seems to be exactly the same as 10.
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip(vector3(100.0,100.0,10.0), 588, 1, '~a~Radar', 1.0, true, 4)
function QBCorev2.Components.Blip(coords, sprite, color, text, scale, range, behaviour)
    QBCorev2.Utils.ValidateArgs({coords, sprite, color, text, scale, range, behaviour},{'vector3', 'number', 'number', 'string', 'number', 'boolean', 'number'}, function(success, err)
        if not success then
            return error(err)
        end
    end)
    range = range or true
    behaviour = behaviour or 4
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, scale)
    SetBlipDisplay(blip, behaviour)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandSetBlipName(blip)
    return blip
end
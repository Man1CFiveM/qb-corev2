--https://docs.fivem.net/docs/game-references/blips/#blips
--https://docs.fivem.net/docs/game-references/blips/#blip-colors
--- Creates a blip for the specified coordinates

-- local Blip = {}
-- display Behaviour explanation
-- Rockstar seem to only use 0, 2, 3, 4, 5 and 8 in their scripts. Anything higher than 10 seems to be exactly the same as 10.
-- 0 = Doesn't show up, ever, anywhere
-- 2 = Shows on both main map and minimap. (Selectable on map)
-- 3 = Shows on main map only. (Selectable on map)
-- 4 = Shows on main map only. (Selectable on map)
-- 5 = Shows on minimap only.
-- 8 = Shows on both main map and minimap. (Not selectable on map)

QBCorev2.Components.Blip = {}

Blip = {}
Blip.__index = Blip

-- Constructor
function Blip.new(text, sprite, scale, colour)
    local self = setmetatable({}, Blip)
    self.text = text
    self.sprite = sprite
    self.colour = colour
    self.scale = scale
    return self
end

-- Method for setting the properties of a blip
function Blip:setProperties()
    SetBlipSprite(self.blip, self.sprite)
    SetBlipScale(self.blip, self.scale)
    SetBlipColour(self.blip, self.colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(self.text)
    EndTextCommandSetBlipName(self.blip)
end

function Blip:setAdditionalProperties(properties)
    local propertySetters = {
        display = function(blip, prop) SetBlipDisplay(blip, prop) end,
        shortRange = function(blip, prop) SetBlipAsShortRange(blip, prop) end,
        alpha = function(blip, prop) SetBlipAlpha(blip, prop) end,
        category = function(blip, prop) SetBlipCategory(blip, prop) end,
        hiddenOnLegend = function(blip, prop) SetBlipHiddenOnLegend(blip, prop) end,
        rotation = function(blip, prop) SetBlipRotation(blip, prop) end,
        friendly = function(blip, prop) SetBlipAsFriendly(blip, prop) end,
        bright = function(blip, prop) SetBlipBright(blip, prop) end,
        check = function(blip, prop) ShowTickOnBlip(blip, prop) end,
        outline = function(blip, prop) ShowOutlineIndicatorOnBlip(blip, prop) end,
        flash = function(blip, prop)
            local interval, duration
            if type(prop) == "table" then
                interval = prop.interval
                duration = prop.duration
            else
                interval = prop
            end
            print(blip, interval, duration)
            SetBlipFlashes(blip, true)
            SetBlipFlashInterval(blip, interval)
            if duration then
                SetBlipFlashTimer(blip, duration)
            end
        end,
        route = function(blip, prop)
            SetBlipRoute(blip, true)
            SetBlipRouteColour(blip, prop)
        end
    }

    for key, prop in pairs(properties) do
        local setter = propertySetters[key]
        if setter then
            setter(self.blip, prop)
        end
    end
end

-- Method for adding a blip for a coordinate
function Blip:addForCoord(x, y, z)
    self.blip = AddBlipForCoord(x, y, z)
    self:setProperties()
end

-- Method for adding a blip for an area
function Blip:addForArea(x, y, z, width, height)
    self.blip = AddBlipForArea(x, y, z, width, height)
    self:setProperties()
end

-- Method for adding a blip for an entity
function Blip:addForEntity(entity)
    self.blip = AddBlipForEntity(entity)
    self:setProperties()
end

-- Method for adding a blip for a radius
function Blip:addForRadius(x, y, z, radius)
    self.blip = AddBlipForRadius(x, y, z, radius)
    self:setProperties()
end

-- Method for adding a blip for a pickup
function Blip:addForPickup(pickup)
    self.blip = AddBlipForPickup(pickup)
    self:setProperties()
end

function Blip:getBlipInstance()
    return self.blip
end

QBCorev2.Modules.Blip = setmetatable({}, {
    __index = function(_, key)
        local method = Blip[key]
        if method then
            return function(_, ...) return method(Blip, ...) end
        else
            error("Function " .. tostring(key) .. " does not exist in QBCorev2.Modules.Logger")
        end
    end,
    __call = function(_, ...)
        error("QBCorev2.Modules.Logger cannot be called like a function")
    end,
})

--- Adds a rectangular blip for the specified coordinates/area.
---@param text string -- The label of the blip
---@param sprite number -- The sprite ID of the blip
---@param scale number -- The scale of the blip
---@param colour number -- The color of the blip
---@param coords vector3 -- The coordinates of the blip
---@param width number -- The width of the blip
---@param height number -- The height of the blip
---@param setAdditionalProperties table -- Additional properties to set for the blip
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip:ToArea('example', 108, 1.0, 30, vector3(-1264.86, -904.98, 11.21), 100.0, 100.0, {flash = {interval = 1000, duration = 5000}})
function QBCorev2.Components.Blip:ToArea(text, sprite, scale, colour, coords, width, height, setAdditionalProperties)
    local myBlip = Blip.new(text, sprite, scale, colour)
    myBlip:addForArea(coords.x, coords.y, coords.z, width, height)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
end

function QBCorev2.Components.Blip:ToCoord(text, sprite, scale, colour, coords, setAdditionalProperties)
    local myBlip = Blip.new(text, sprite, scale, colour)
    myBlip:addForCoord(coords.x, coords.y, coords.z)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

function QBCorev2.Components.Blip:ToEntity(text, sprite, scale, colour, entity, setAdditionalProperties)
    local myBlip = Blip.new(text, sprite, scale, colour)
    myBlip:addForEntity(entity)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

function QBCorev2.Components.Blip:ToRadius(text, sprite, scale, colour, coords, radius, setAdditionalProperties)
    local myBlip = Blip.new(text, sprite, scale, colour)
    myBlip:addForRadius(coords.x, coords.y, coords.z, radius)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

function QBCorev2.Components.Blip:ToPickup(text, sprite, scale, colour, pickup, setAdditionalProperties)
    local myBlip = Blip.new(text, sprite, scale, colour)
    myBlip:addForPickup(pickup)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

-- local blip = QBCorev2.Components.Blip:ToCoord('example', 108, 1.0, 30, vector3(385.93, -127.66, 38.68),{flash = {interval = 1000, duration = 5000}})
-- local blip = QBCorev2.Components.Blip:ToCoord('example', 108, 1.0, 30, vector3(385.93, -127.66, 38.68),{flash = {interval = 1000}})
-- local blip = QBCorev2.Components.Blip:ToCoord('example', 108, 1.0, 30, vector3(385.93, -127.66, 38.68),{flash = 1000})
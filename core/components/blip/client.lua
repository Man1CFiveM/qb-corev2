--https://docs.fivem.net/docs/game-references/blips/#blips
--https://docs.fivem.net/docs/game-references/blips/#blip-colors
--- Creates a blip for the specified coordinates

-- display Behaviour explanation
-- Rockstar seem to only use 0, 2, 3, 4, 5 and 8 in their scripts. Anything higher than 10 seems to be exactly the same as 10.
-- 0 = Doesn't show up, ever, anywhere
-- 2 = Shows on both main map and minimap. (Selectable on map)
-- 3 = Shows on main map only. (Selectable on map)
-- 4 = Shows on main map only. (Selectable on map)
-- 5 = Shows on minimap only.
-- 8 = Shows on both main map and minimap. (Not selectable on map)

Blip = {}
Blip.__index = Blip
QBCorev2.Components.Blip = Blip

-- Constructor
function Blip.new(colour)
    local self = setmetatable({}, Blip)
    self.colour = colour
    return self
end

-- Method for setting the default properties of a blip
function Blip:setDefaultProperties(properties)
    self.text = properties.text
    self.sprite = properties.sprite
    self.scale = properties.scale
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

-- Method for setting additional properties of a blip
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

-- Method for setting additional properties of a area blip
function Blip:setRestrictedProperties(properties)
    local propertySetters = {
        -- Only include the properties that are valid for this type of blip
        flash = function(blip, prop)
            SetBlipFlashes(blip, true)
            SetBlipFlashInterval(blip, prop.interval)
            if prop.duration then
                SetBlipFlashTimer(blip, prop.duration)
            end
        end,
        rotation = function(blip, prop) SetBlipRotation(blip, prop) end,
        alpha = function(blip, prop) SetBlipAlpha(blip, prop) end,
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
    SetBlipColour(self.blip, self.colour)
end

-- Method for adding a blip for an entity
function Blip:addForEntity(entity)
    self.blip = AddBlipForEntity(entity)
    self:setProperties()
end

-- Method for adding a blip for a radius
function Blip:addForRadius(x, y, z, radius)
    self.blip = AddBlipForRadius(x, y, z, radius)
    SetBlipColour(self.blip, self.colour)
end

-- Method for adding a blip for a pickup
function Blip:addForPickup(pickup)
    self.blip = AddBlipForPickup(pickup)
    self:setProperties()
end

function Blip:getBlipInstance()
    return self.blip
end

--- Adds a rectangular blip for the specified coordinates/area.
---@param colour number -- The color of the blip
---@param coords vector3 -- The coordinates of the blip
---@param width number -- The width of the blip
---@param height number -- The height of the blip
---@param setRestrictedProperties table -- Additional properties to set for the blip
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip:ToArea(1, GetEntityCoords(PlayerPedId()), 100.0, 100.0 {alpha = 100})
function QBCorev2.Components.Blip:ToArea(colour, coords, width, height, setRestrictedProperties)
    local myBlip = Blip.new(colour)
    myBlip:addForArea(coords.x, coords.y, coords.z, width, height)
    if setRestrictedProperties then
        myBlip:setRestrictedProperties(setRestrictedProperties)
    end
    return myBlip:getBlipInstance()
end

--- Adds a blip for the specified coordinates.
---@param text string -- The label of the blip
---@param sprite number -- The sprite ID of the blip
---@param scale number -- The scale of the blip
---@param colour number -- The color of the blip
---@param coords vector3 -- The coordinates of the blip
---@param setAdditionalProperties table -- Additional properties to set for the blip
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip:ToCoord('example', 108, 1.0, 30, GetEntityCoords(PlayerPedId()), {flash = {interval = 1000, duration = 5000}})
function QBCorev2.Components.Blip:ToCoord(text, sprite, scale, colour, coords, setAdditionalProperties)
    local myBlip = Blip.new(colour)
    myBlip:setDefaultProperties({text = text, sprite = sprite, scale = scale})
    myBlip:addForCoord(coords.x, coords.y, coords.z)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

--- Adds a blip for the specified entity.
---@param text string -- The label of the blip
---@param sprite number -- The sprite ID of the blip
---@param scale number -- The scale of the blip
---@param colour number -- The color of the blip
---@param entity number -- The entity to add the blip for
---@param setAdditionalProperties table -- Additional properties to set for the blip
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip:ToEntity('example', 108, 1.0, 30, entity, {flash = {interval = 1000, duration = 5000}})
function QBCorev2.Components.Blip:ToEntity(text, sprite, scale, colour, entity, setAdditionalProperties)
    local myBlip = Blip.new(colour)
    myBlip:setDefaultProperties({text = text, sprite = sprite, scale = scale})
    myBlip:addForEntity(entity)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

--- Adds a circular blip for the specified coordinates.
---@param colour number -- The color of the blip
---@param coords vector3 -- The coordinates of the blip
---@param radius number -- The radius of the blip
---@param setRestrictedProperties table -- Additional properties to set for the blip
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip:ToRadius(1, GetEntityCoords(PlayerPedId()), 100.0, {alpha = 100})
function QBCorev2.Components.Blip:ToRadius(colour, coords, radius, setRestrictedProperties)
    local myBlip = Blip.new(colour)
    myBlip:addForRadius(coords.x, coords.y, coords.z, radius)
    if setRestrictedProperties then
        myBlip:setRestrictedProperties(setRestrictedProperties)
    end
    return myBlip:getBlipInstance()
end

--- Adds a blip for the specified pickup.
---@param text string -- The label of the blip
---@param sprite number -- The sprite ID of the blip
---@param scale number -- The scale of the blip
---@param colour number -- The color of the blip
---@param pickup number -- The pickup to add the blip for
---@param setAdditionalProperties table -- Additional properties to set for the blip
---@return number -- The blip ID
---@usage QBCorev2.Components.Blip:ToPickup('example', 108, 1.0, 30, pickup, {flash = {interval = 1000, duration = 5000}})
function QBCorev2.Components.Blip:ToPickup(text, sprite, scale, colour, pickup, setAdditionalProperties)
    local myBlip = Blip.new(colour)
    myBlip:setDefaultProperties({text = text, sprite = sprite, scale = scale})
    myBlip:addForPickup(pickup)
    if setAdditionalProperties then
        myBlip:setAdditionalProperties(setAdditionalProperties)
    end
    return myBlip:getBlipInstance()
end

-- Blip = QBCorev2.CreateErrorHandlerMetaTable("QBCorev2.Components.Blip", Blip)
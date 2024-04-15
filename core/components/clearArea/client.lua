QBCorev2.Modules.ClearArea = {}

-- Clear a area of objects, peds, vehicles etc. at the given coordinates and radius. Has a ignoreCopCars and ignoreObjects parameter
function QBCorev2.Modules.ClearArea:General(ignoreCopCars, ignoreObjects)
    ClearArea(self.coords.x, self.coords.y, self.coords.z, self.radius, true, ignoreCopCars, ignoreObjects, false)
end

-- Flags are 0, 2, 6, 16, 17 but not sure what they do yet. maybe type of objects to remove?
function QBCorev2.Modules.ClearArea:RemoveObjects(flags)
    ClearAreaOfObjects(self.coords.x, self.coords.y, self.coords.z, self.radius, flags)
end

-- Clears an area of cops at the given coordinates and radius
function QBCorev2.Modules.ClearArea:RemoveCops(createNetEvent)
    ClearAreaOfCops(self.coords.x, self.coords.y, self.coords.z, self.radius, createNetEvent)
end

-- Clears an area of peds at the given coordinates and radius.
function QBCorev2.Modules.ClearArea:RemovePeds(createNetEvent)
    ClearAreaOfPeds(self.coords.x, self.coords.y, self.coords.z, self.radius, createNetEvent)
end

-- Clears an area of vehicles at the given coordinates and radius.
function QBCorev2.Modules.ClearArea:RemoveVehicles()
    ClearAreaOfVehicles(self.coords.x, self.coords.y, self.coords.z, self.radius, false, false, false, false, false)
end

-- Seem to make all objects go away, peds, vehicles etc. needs more testing to see what it does or else it will be removed
function QBCorev2.Modules.ClearArea:PreserveVehicleHealth()
    ClearAreaLeaveVehicleHealth(self.coords.x, self.coords.y, self.coords.z, self.radius, false, false, false, false)
end

-- Clears an area of projectiles at the given coordinates and radius. doesnt seem to be really usefull
function QBCorev2.Modules.ClearArea:RemoveProjectiles(createNetEvent)
    ClearAreaOfProjectiles(self.coords.x, self.coords.y, self.coords.z, self.radius, createNetEvent)
end
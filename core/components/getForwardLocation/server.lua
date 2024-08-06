local function getDistanceInFront(location, distance, rotation)
    local radian = math.rad(location.w + (rotation or 180)) -- Convert heading to radians and adjust by 90 degrees
    local newLocation = {
        x = location.x + math.sin(radian) * distance,
        y = location.y - math.cos(radian) * distance,
        z = location.z,
        w = location.w
    }
    return vector(newLocation.x, newLocation.y, newLocation.z, newLocation.w)
end
--- Returns the street name and cross street name at the given coordinates.
---@param coords vector3 -- The coordinates to get the street name from
---@return string, string -- The name of the street and the name of the cross street
---@useage local streetName, crossingRoad  = QBCorev2.Components.GetStreetNametAtCoords(vector3)
function QBCorev2.Components.GetStreetNametAtCoords(coords)
    QBCorev2.Utils.ValidateArgs({coords},{'vector3'})
    local streetName, crossingRoad  = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    return streetName, crossingRoad
end
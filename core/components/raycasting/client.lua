-- 1: World geometry only
-- 2: Vehicles only
-- 4: Peds only
-- 8: Objects only
-- 16: Water only
-- 1 | 2: World geometry and vehicles
-- 1 | 4: World geometry and peds
-- 1 | 8: World geometry and objects
-- 1 | 16: World geometry and water
-- 2 | 4: Vehicles and peds
-- 2 | 8: Vehicles and objects
-- 2 | 16: Vehicles and water
-- 4 | 8: Peds and objects
-- 4 | 16: Peds and water
-- 8 | 16: Objects and water
-- 1 | 2 | 4: World geometry, vehicles, and peds
-- 1 | 2 | 8: World geometry, vehicles, and objects
-- 1 | 2 | 16: World geometry, vehicles, and water
-- 1 | 4 | 8: World geometry, peds, and objects
-- 1 | 4 | 16: World geometry, peds, and water
-- 1 | 8 | 16: World geometry, objects, and water
-- 2 | 4 | 8: Vehicles, peds, and objects
-- 2 | 4 | 16: Vehicles, peds, and water
-- 2 | 8 | 16: Vehicles, objects, and water
-- 4 | 8 | 16: Peds, objects, and water
-- 1 | 2 | 4 | 8: World geometry, vehicles, peds, and objects
-- 1 | 2 | 4 | 16: World geometry, vehicles, peds, and water
-- 1 | 2 | 8 | 16: World geometry, vehicles, objects, and water
-- 1 | 4 | 8 | 16: World geometry, peds, objects, and water
-- 2 | 4 | 8 | 16: Vehicles, peds, objects, and water
-- 1 | 2 | 4 | 8 | 16: World geometry, vehicles, peds, objects, and water
-- -1: All possible colliders (world geometry, vehicles, peds, objects, water, foliage, debris, glass, bushes

-- IntersectNothing = 0, Collides with nothing
-- IntersectWorld = 1, Collides with world geometry (buildings, terrain, etc.)
-- IntersectVehicles = 2, Collides with vehicles
-- IntersectPeds = 4, Collides with pedestrians
-- IntersectRagdolls = 8, Collides with ragdolls (characters in a ragdoll state)
-- IntersectObjects = 16, Collides with objects (props, items, etc.)
-- IntersectWater = 32, Collides with water
-- IntersectGlass = 64, Collides with glass
-- IntersectRiver = 128, Collides with rivers
-- IntersectFoliage = 256, Collides with foliage (trees, bushes, etc.)
-- IntersectEverything = -1, Collides with everything

-- you can combine these flags using the bitwise OR operator (|) to specify multiple types of colliders to check against. 
-- For example, to check for collisions with vehicles and pedestrians, you would use the following flag: 2 | 4.

local glm = require 'glm'

-- Cache common functions
local toRadians = glm.rad
local quaternionFromEuler = glm.quatEulerAngleZYX
local rayPicking = glm.rayPicking

-- Cache direction vectors
local upVector = glm.up()
local forwardVector = glm.forward()

local screenAspectRatio = GetAspectRatio(true)
local screenFieldOfView = GetFinalRenderedCamFov()

local getFinalRenderedCamNearClip = GetFinalRenderedCamNearClip()
local getFinalRenderedCamFarClip = GetFinalRenderedCamFarClip()

local playerPed = PlayerPedId()

local function screenPositionToCameraRay()
    local cameraPosition = GetFinalRenderedCamCoord()
    local cameraRotation = toRadians(GetFinalRenderedCamRot(2))
    local cameraQuaternion = quaternionFromEuler(cameraRotation.z, cameraRotation.y, cameraRotation.x)
    return cameraPosition, rayPicking(
        cameraQuaternion * forwardVector,
        cameraQuaternion * upVector,
        toRadians(screenFieldOfView),
        screenAspectRatio,
        getFinalRenderedCamNearClip, -- GetFinalRenderedCamNearClip(),
        getFinalRenderedCamFarClip, -- GetFinalRenderedCamFarClip(),
        0, 0
    )
end

---@param flag number -- check the list above to specify the type of collider to check against. For example, to check for collisions with vehicles and pedestrians, you would use the following flag: 2 | 4.
---@return integer entity the entity that was hit by the raycast
---@return vector3 endCoords the coordinates where the raycast hit the entity
---@return vector3 distance the distance between the player and the entity
---@return vector3 collisionSurfaceNormal the normal vector of the surface where the raycast hit the entity
local function PerformRaycast(flag)
    if not playerPed then playerPed = PlayerPedId() end

    local playerCoords = GetEntityCoords(playerPed)
    local rayPos, rayDir = screenPositionToCameraRay()
    local destination = rayPos + 16 * rayDir
    local rayHandle = StartShapeTestLosProbe(rayPos.x, rayPos.y, rayPos.z, destination.x, destination.y, destination.z, flag or -1, playerPed, 4)

    while true do
        local handle, hit, endCoords, collisionSurfaceNormal, entity = GetShapeTestResult(rayHandle)

        if handle == 2 and hit == 1 then
            local distance = playerCoords - endCoords
            entity = (flag == 30 and entity ~= 0 or not entity and not HasEntityClearLosToEntity(entity, playerPed, 7)) and 0 or entity

            return entity, endCoords, distance, collisionSurfaceNormal
        end

        Wait(0)
    end
end

return PerformRaycast
-- CreateThread(function()
--     -- while true do
--     --     Wait(1000)
--         PerformRaycast()
--     -- end
-- end)

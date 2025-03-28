local function isInOpenSky(x, y, z, hight)
    -- local rayHandle = StartShapeTestRay(x, y, z, x, y, z + 1000, 17, -1, 0)
    -- local _, _, _, _, result = GetShapeTestResult(rayHandle)
    -- return result == 0
    hight = hight or 10
    local _, hit = TestVerticalProbeAgainstAllWater(x, y, z + hight, 0)
    return not hit
end


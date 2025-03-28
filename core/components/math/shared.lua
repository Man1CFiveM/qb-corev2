-- roundToPlaces(number, places)

-- Description: Rounds a number to a specified number of decimal places.
-- Usage: Useful for formatting numbers for display, such as rounding player statistics or currency values.
-- clamp(number, min, max)

-- Description: Clamps a number between a minimum and maximum value.
-- Usage: Useful for ensuring values stay within a certain range, such as limiting player health or speed.
-- lerp(a, b, t)

-- Description: Linearly interpolates between two values.
-- Usage: Useful for smooth transitions, such as moving a player or camera smoothly from one position to another.
-- distance(x1, y1, x2, y2)

-- Description: Calculates the distance between two points in 2D space.
-- Usage: Useful for determining proximity between entities, such as checking if a player is within a certain distance of an objective.
-- distance3D(x1, y1, z1, x2, y2, z2)

-- Description: Calculates the distance between two points in 3D space.
-- Usage: Useful for 3D distance calculations, such as determining the distance between players or objects in the game world.
-- sign(number)

-- Description: Returns the sign of a number (1 for positive, -1 for negative, 0 for zero).
-- Usage: Useful for determining the direction of movement or force in scripts.
-- map(value, inMin, inMax, outMin, outMax)

-- Description: Maps a number from one range to another.
-- Usage: Useful for converting values from one scale to another, such as normalizing input values or adjusting UI elements.
-- isNan(value)

-- Description: Checks if a value is NaN (Not a Number).
-- Usage: Useful for validating input or calculations to ensure they are producing valid numbers.
-- isInf(value)

-- Description: Checks if a value is positive or negative infinity.
-- Usage: Useful for validating input or calculations to ensure they are within acceptable bounds.
-- wrap(value, min, max)

-- Description: Wraps a number to a specified range.
-- Usage: Useful for looping values within a range, such as angles or cyclic counters.
-- factorial(n)

-- Description: Calculates the factorial of a number.
-- Usage: Useful for mathematical calculations or algorithms that require combinatorial logic.
-- degrees(radians)

-- Description: Converts radians to degrees.
-- Usage: Useful for converting angle measurements when working with rotations or orientations in the game.
-- randomFloat(min, max)

-- Description: Generates a random float between a minimum and maximum value.
-- Usage: Useful for generating random positions, velocities, or other properties that require floating-point precision.
-- hypotenuse(a, b)

-- Description: Calculates the hypotenuse of a right-angled triangle given the lengths of the other two sides.
-- Usage: Useful for distance calculations or determining the magnitude of vectors in 2D space.

-- Round number to a specific number of decimal places.

-- https://github.com/CyCoSnag/snag_weapon_metas/tree/main/metas
local function roundToPlaces(number, places)
    local multiplier = 10^(places or 0)
    local value = number * multiplier
    local floorValue = math.floor(value)
    local decimalPart = value - floorValue

    if decimalPart >= 0.5 then
        value = math.ceil(value)
    else
        value = floorValue
    end

    return value / multiplier
end
-- Clamps a number between a minimum and maximum value.
function clamp(number, min, max)
    return math.max(min, math.min(max, number))
end

-- Linearly interpolates between two values.
function lerp(a, b, t)
    return a + (b - a) * t
end

-- Returns the distance between two points in 2D space.
function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

-- Returns the distance between two points in 3D space.
function distance3D(x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
end

-- Returns the angle between two points in 2D space.
function sign(number)
    return (number > 0 and 1) or (number < 0 and -1) or 0
end

-- Returns the angle between two points in 2D space.
function map(value, inMin, inMax, outMin, outMax)
    return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin
end

-- Checks if a value is NaN (Not a Number). 
function isNan(value)
    return value ~= value
end

-- Checks if a value is positive or negative infinity.
function isInf(value)
    return value == math.huge or value == -math.huge
end

-- Checks if a value is a number.
function wrap(value, min, max)
    local range = max - min + 1
    return (value - min) % range + min
end
-- Calculates the factorial of a number.
function factorial(n)
    if n == 0 then return 1 end
    local result = 1
    for i = 2, n do
        result = result * i
    end
    return result
end

-- Converts radians to degrees.
function degrees(radians)
    return radians * (180 / math.pi)
end

-- CGenerates a random float between a minimum and maximum value.
function randomFloat(min, max)
    return min + math.random() * (max - min)
end

-- Generates a random integer between a minimum and maximum value.
function hypotenuse(a, b)
    return math.sqrt(a^2 + b^2)
end
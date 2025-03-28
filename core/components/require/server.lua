---@param resourceName string -- name of the resource
---@param moduleName string -- name of the module
---@return string -- full path name of the file
local function findFileInStartedResource(resourceName, moduleName)
    -- Ensure the resource is started
    -- assert(GetResourceState(resourceName) == "started", "Error: The resource '" .. resourceName .. "' is not started. Current state: " .. GetResourceState(resourceName))

    -- Get the path of the resource
    local resourcePath = GetResourcePath(resourceName)

    -- Run the command to find the file
    local command = 'dir "' .. resourcePath .. '" /b /s | findstr /i "' .. moduleName .. '"'
    local fileHandle = io.popen(command)

    -- Ensure the command executed successfully
    assert(fileHandle, "Error: Failed to run command using io.popen")

    -- Read the output and remove any whitespace
    local fullPath = fileHandle:read('*a'):gsub("%s+", "")
    fileHandle:close()

    -- Ensure the file was found and not just an empty string
    assert(fullPath ~= "", "Error: File '" .. moduleName .. "' not found in resource '" .. resourceName .. "'")

    return fullPath
end

---@param resourceName string -- name of the resource
---@param moduleName string -- name of the module
---@return string -- relative path of the file
local function getRelativeModulePath(resourceName, moduleName)
    -- Find the full path of the file in the started resource
    local fullPath = findFileInStartedResource(resourceName, moduleName)

    -- Find the end index of the resource name in the full path
    local _, endIndex = string.find(fullPath, resourceName)

    -- Extract the relative path and replace backslashes with forward slashes
    local relativePath = fullPath:sub(endIndex + 1):gsub("\\", "/")

    -- Ensure the relative path is not empty or nil
    assert(relativePath ~= "" and relativePath, "Error: Failed to split the path. Full path: " .. fullPath .. ", Resource: " .. resourceName)

    return relativePath
end

-- Replace the default require function with the new one
---@param moduleName string -- name of the module
---@return table -- loaded module
local function loadResourceModule(moduleName)
    -- Get the current resource name
    local resourceName = GetCurrentResourceName()

    -- If the current resource is the invoking resource, update the resource name
    if not resourceName then
        resourceName = GetInvokingResource()
    end

    -- Ensure the resource name is valid
    assert(resourceName, "Error: Failed to get the resource name")

    -- Get the relative path of the module
    local modulePath = getRelativeModulePath(resourceName, moduleName)

    -- Load the resource file
    local code = LoadResourceFile(resourceName, modulePath)

    -- Load the module from the code
    local module = load(code, moduleName)

    -- Ensure the module was loaded successfully
    assert(module, "Error: Failed to load module '" .. moduleName .. "'")

    -- Execute and return the module
    return module()
end

-- -- Replace the default require function with the new one
-- require = loadResourceModule

-- -- Test script to demonstrate the metatable functionality
-- local mymodule = require("mymodule")

-- -- Accessing a function (triggers __index)
-- mymodule.sayHello()
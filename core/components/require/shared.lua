-- Globale modulecache
local moduleCache = {}
-- Validatiefunctie
local function validateModuleCode(moduleCode, moduleName)
    -- Controleer of de module een return-statement bevat
    if not moduleCode:match("return%s+") then
        error("Module '" .. moduleName .. "' moet een 'return' statement bevatten.")
    end

    -- Controleer op verboden functies
    local forbiddenPatterns = {
        "os%.execute", -- Verbied 'os.execute'
        "io%.popen",   -- Verbied 'io.popen'
        "debug%.getinfo", -- Verbied gebruik van debug library
        'PerformHttpRequest'
    }

    for _, pattern in ipairs(forbiddenPatterns) do
        if moduleCode:match(pattern) then
            error("Module '" .. moduleName .. "' bevat verboden code: " .. pattern)
        end
    end
end

local function checkModulePath(modulePath)
    local resource = modulePath:match('^@(.-)/.+')
    local module = modulePath:match(".*/(.-)%.lua")

    if resource then
        return resource, module
    end

    local index = 1
    local max = 10

    while index <= max do
        local path = debug.getinfo(index, "S")
        assert(path, "Module '" .. modulePath .. "' not found at path: " .. modulePath)
        local res = path.short_src:match("@(.-)/")
        if res then
            return res, modulePath
        end
        index = index + 1
    end

    error("Module '" .. modulePath .. "' not found at path: " .. modulePath)
end

-- Aangepaste require-functie
function RequireCustom(moduleName)
    print("Loading moduleCache " ,moduleCache[moduleName])
    if moduleCache[moduleName] then
        print("Module '" .. moduleName .. "' loaded from cache")
        return moduleCache[moduleName]
    end

    local resource, module = checkModulePath(moduleName)
    if not resource then
        module = moduleName
        resource = GetCurrentResourceName()
    end

    local path = "modules/" .. moduleName .. ".lua"

    print('module:',module, 'path:',path)
    local moduleCode = LoadResourceFile(resource, path)
    if not moduleCode then
        error("Module '" .. moduleName .. "' not found at path: " .. path)
    end

    validateModuleCode(moduleCode, moduleName)

    -- Creëer een aparte omgeving voor de module
    local moduleEnv = {}
    setmetatable(moduleEnv, { __index = _G }) -- Toegang tot globale variabelen

    -- Compileer en laad de modulecode
    local moduleFunc, loadErr = load(moduleCode, moduleName, "t", moduleEnv)
    -- local moduleFunc = assert(load(moduleCode, moduleName, "t", moduleEnv), "Error loading module '" .. moduleName .. "': " .. loadErr)
    if not moduleFunc then
        error("Error loading module '" .. moduleName .. "': " .. loadErr)
    end

    -- Voer de modulecode uit en sla de geretourneerde waarde op
    local result = moduleFunc()
    print("Module '" .. moduleName .. "' loaded")
    -- Sla de module op in de cache
    moduleCache[moduleName] = result

    return result
end

function ReturnModuleCache()
    print("Module cache:")
    for key, value in pairs(moduleCache) do
        print(key, value)
    end
end

-- local moduleCode = LoadResourceFile('math_utils.lua', '1require/modules')
-- print("Module code: " .. moduleCode)
-- -- Replace the default require function with the new one
-- ---@param moduleName string -- name of the module
-- ---@return table -- loaded module
-- local function loadResourceModule(moduleName)
--     -- Get the current resource name
--     local resourceName = GetCurrentResourceName()

--     -- If the current resource is the invoking resource, update the resource name
--     if not resourceName then
--         resourceName = GetInvokingResource()
--     end

--     -- Ensure the resource name is valid
--     assert(resourceName, "Error: Failed to get the resource name")

--     -- Get the relative path of the module
--     local modulePath = getRelativeModulePath(resourceName, moduleName)

--     -- Load the resource file
--     local code = LoadResourceFile(resourceName, modulePath)

--     -- Load the module from the code
--     local module = load(code, moduleName)

--     -- Ensure the module was loaded successfully
--     assert(module, "Error: Failed to load module '" .. moduleName .. "'")

--     -- Execute and return the module
--     return module()
-- end
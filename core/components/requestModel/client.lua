--- func description
---@model string | number -- model name or hash
---@return boolean | number -- success, model hash or error message 
---@usage local success, model = QBCorev2Components.requestModel('model_name')
function QBCorev2.Components.RequestModel(model)
    QBCorev2.Utils.validateArgs({model}, {'string|number'})
    if HasModelLoaded(model) then
        if type(model) == 'string' then model = joaat(model) end
        return true, model
    end
    RequestModel(model)
    local time = GetGameTimer()
    while not HasModelLoaded(model) do
        if GetGameTimer() - time > 1000 then
            return false, error('Failed to load model: ' .. model, 2)
        end
        Wait(0)
    end
    if type(model) == 'string' then model = joaat(model) end
    return true, model
end

-- Functie om een model te laden
function LoadModel(modelHash)
    -- Controleer of het een geldig model is
    if not IsModelValid(modelHash) then
        print("Ongeldig model: " .. modelHash)
        return false
    end

    -- Vraag het model aan
    RequestModel(modelHash)

    -- Wacht tot het model geladen is (met een time-out)
    local timeout = 0
    while not HasModelLoaded(modelHash) do
        Citizen.Wait(100)
        timeout = timeout + 100
        
        -- Stop na 5 seconden als het model niet laadt
        if timeout > 5000 then
            print("Kon model niet laden: " .. modelHash)
            return false
        end
    end

    return true
end

-- Functie om een model te onladen
function UnloadModel(modelHash)
    -- Controleer of het model geladen is
    if HasModelLoaded(modelHash) then
        SetModelAsNoLongerNeeded(modelHash)
        return true
    end
    
    return false
end

-- Voorbeeld van gebruik
Citizen.CreateThread(function()
    -- Hash van het model (bijv. een voertuig of ped)
    local modelHash = GetHashKey("adder")  -- Voorbeeld: Adder voertuig
    
    -- Model laden
    if LoadModel(modelHash) then
        print("Model succesvol geladen")
        
        -- Hier kun je het model gebruiken voor het maken van een voertuig of ped
        -- Bijvoorbeeld: CreateVehicle(modelHash, x, y, z, heading, isNetwork, isScript)
        
        -- Model onladen wanneer je klaar bent
        Citizen.Wait(5000)  -- Wacht 5 seconden
        if UnloadModel(modelHash) then
            print("Model succesvol ongeladen")
        end
    end
end)
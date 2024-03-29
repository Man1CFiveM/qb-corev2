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
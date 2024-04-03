--- get the ingame time
---@return table -- The current time
---@usage local time = QBCorev2.Components.GetCurrentTime()
function QBCorev2.Components.GetCurrentTime()
    local obj = {}
    obj.min = GetClockMinutes()
    obj.hour = GetClockHours()

    if obj.hour <= 12 then
        obj.ampm = 'AM'
    elseif obj.hour >= 13 then
        obj.ampm = 'PM'
        obj.formattedHour = obj.hour - 12
    end

    if obj.min <= 9 then
        obj.formattedMin = '0' .. obj.min
    end

    return obj
end
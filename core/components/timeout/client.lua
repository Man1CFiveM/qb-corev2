local Timer = {}
Timer.set = function(self)
    local year, month, day, hour, minute, second = GetLocalTime()
    self.setTimer = {
        second = second,
        minute = minute,
        hour = hour,
        day = day,
        month = month,
        year = year,
    }
    return self
end

Timer.compair = function(self, timeToCheck)
    local year, month, day, hour, minute, second = GetLocalTime()
    local seconds = (second - self.setTimer.second)
    local minutes = (minute - self.setTimer.minute) * 60
    local hours = (hour - self.setTimer.hour) * 3600
    local days = (day - self.setTimer.day) * 86400
    local months = (month - self.setTimer.month) * 2592000 -- Approximation
    local years = (year - self.setTimer.year) * 31536000 -- Approximation

    local totalElapsedSeconds = seconds + minutes + hours + days + months + years

    -- Check if the elapsed time is greater than or equal to the time to check
    if totalElapsedSeconds >= timeToCheck then
        return true
    else
        return false
    end
end
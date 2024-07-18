Player = {}
Player.__index = Player

-- Constructor
function Player.new(playerData, offline)
    local self = setmetatable({}, Player)
    self.playerData = playerData
    self.offline = offline
    return self
end

-- Method to update player data
function Player:updatePlayerData()
    if self.offline then return end
    TriggerEvent('QBCore:Player:SetPlayerData', self.playerData)
    TriggerClientEvent('QBCore:Player:SetPlayerData', self.playerData.source, self.playerData)
end

-- Method to set job
function Player:setJob(job, grade)
    job = job:lower()
    grade = tostring(grade) or '0'
    if not QBCore.Shared.Jobs[job] then return false end
    self.playerData.job.name = job
    self.playerData.job.label = QBCore.Shared.Jobs[job].label
    self.playerData.job.onduty = QBCore.Shared.Jobs[job].defaultDuty
    self.playerData.job.type = QBCore.Shared.Jobs[job].type or 'none'
    -- ... rest of the method
end

-- ... rest of the methods
-- Player = {}
-- Player.__index = Player

-- -- Constructor
-- function Player.new(playerData, offline)
--     local self = setmetatable({}, Player)
--     self.playerData = playerData
--     self.offline = offline
--     return self
-- end

-- -- Method to update player data
-- function Player:updatePlayerData()
--     if self.offline then return end
--     TriggerEvent('QBCore:Player:SetPlayerData', self.playerData)
--     TriggerClientEvent('QBCore:Player:SetPlayerData', self.playerData.source, self.playerData)
-- end

-- -- Method to set job
-- function Player:setJob(job, grade)
--     job = job:lower()
--     grade = tostring(grade) or '0'
--     if not QBCore.Shared.Jobs[job] then return false end
--     self.playerData.job.name = job
--     self.playerData.job.label = QBCore.Shared.Jobs[job].label
--     self.playerData.job.onduty = QBCore.Shared.Jobs[job].defaultDuty
--     self.playerData.job.type = QBCore.Shared.Jobs[job].type or 'none'
--     -- ... rest of the method
-- end

-- ... rest of the methods

-- local QBCore = exports['qb-core']:GetCoreObject()

-- local function emptyVehicleData()
    
-- end

-- local function randomizeVehicles()
--     local insert = ''
--     local number = 1
--     for key, value in pairs(QBCore.Shared.Vehicles) do
--         if value.category ~= 'emergency' then
--             local id = MySQL.insert.await('INSERT INTO `vehicles` (vehicle) VALUES (?)', {
--                 key
--             })
--         end
--     end
-- end

-- -- randomizeVehicles()

-- local function checkTimeToRandomize()
--     if os.date("*t").hour == 23 then -- 20 is 8 PM in 24-hour format
--         return randomizeVehicles()
--     end

-- end
-- checkTimeToRandomize()




-- -- local response = MySQL.query.await('SELECT * FROM vehiclerandomtime', {})
 
-- -- QBCore.Debug(QBCore.Shared.Vehicles)

-- local timestamp = os.time() -- The timestamp you want to check against
-- print(timestamp)
-- local currentTime = os.time()

-- if currentTime >= timestamp + 24*60*60 then
--     print("24 hours have passed")
-- else
--     print("24 hours have not passed yet")
-- end

-- local timestamp = os.time() -- The timestamp you want to check against
-- Wait(3000)
-- local currentTime = os.time()

-- local timePassed = currentTime - timestamp -- Time passed in seconds

-- print("Time passed: " .. timePassed .. " seconds")
-- print("Time passed: " .. timePassed/60 .. " minutes")
-- print("Time passed: " .. timePassed/(60*60) .. " hours")
-- print("Time passed: " .. timePassed/(60*60*24) .. " days")

-- if response then
--     for i = 1, #response do
--         local row = response[i]
--         print(row.firstname, row.lastname)
--     end
-- end



-- function QBCore.Player.CreateCitizenId()
--     local CitizenId = tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
--     local result = MySQL.prepare.await('SELECT EXISTS(SELECT 1 FROM players WHERE citizenid = ?) AS uniqueCheck', { CitizenId })
--     if result == 0 then return CitizenId end
--     return QBCore.Player.CreateCitizenId()
-- end

-- function QBCore.Functions.CreateAccountNumber()
--     local AccountNumber = 'US0' .. math.random(1, 9) .. 'QBCore' .. math.random(1111, 9999) .. math.random(1111, 9999) .. math.random(11, 99)
--     local result = MySQL.prepare.await('SELECT EXISTS(SELECT 1 FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(charinfo, "$.account")) = ?) AS uniqueCheck', { AccountNumber })
--     if result == 0 then return AccountNumber end
--     return QBCore.Functions.CreateAccountNumber()
-- end

-- function QBCore.Functions.CreatePhoneNumber()
--     local PhoneNumber = math.random(100, 999) .. math.random(1000000, 9999999)
--     local result = MySQL.prepare.await('SELECT EXISTS(SELECT 1 FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(charinfo, "$.phone")) = ?) AS uniqueCheck', { PhoneNumber })
--     if result == 0 then return PhoneNumber end
--     return QBCore.Functions.CreatePhoneNumber()
-- end

-- function QBCore.Player.CreateFingerId()
--     local FingerId = tostring(QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(1) .. QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(4))
--     local result = MySQL.prepare.await('SELECT EXISTS(SELECT 1 FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(metadata, "$.fingerprint")) = ?) AS uniqueCheck', { FingerId })
--     if result == 0 then return FingerId end
--     return QBCore.Player.CreateFingerId()
-- end

-- function QBCore.Player.CreateWalletId()
--     local WalletId = 'QB-' .. math.random(11111111, 99999999)
--     local result = MySQL.prepare.await('SELECT EXISTS(SELECT 1 FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(metadata, "$.walletid")) = ?) AS uniqueCheck', { WalletId })
--     if result == 0 then return WalletId end
--     return QBCore.Player.CreateWalletId()
-- end

-- function QBCore.Player.CreateSerialNumber()
--     local SerialNumber = math.random(11111111, 99999999)
--     local result = MySQL.prepare.await('SELECT EXISTS(SELECT 1 FROM players WHERE JSON_UNQUOTE(JSON_EXTRACT(metadata, "$.phonedata.SerialNumber")) = ?) AS uniqueCheck', { SerialNumber })
--     if result == 0 then return SerialNumber end
--     return QBCore.Player.CreateSerialNumber()
-- end

-- local resourceName = GetCurrentResourceName()

-- local function applyDefaults(playerData, defaults)
--     for key, value in pairs(defaults) do
--         if type(value) == 'function' then
--             playerData[key] = playerData[key] or value()
--         elseif type(value) == 'table' then
--             playerData[key] = playerData[key] or {}
--             applyDefaults(playerData[key], value)
--         else
--             playerData[key] = playerData[key] or value
--         end
--     end
-- end

-- local function checkPlayerData(source, PlayerData)
--     PlayerData = PlayerData or {}
--     local Offline = not source

--     if source then
--         PlayerData.source = source
--         PlayerData.license = PlayerData.license or QBCore.Functions.GetIdentifier(source, 'license')
--         PlayerData.name = GetPlayerName(source)
--     end

--     applyDefaults(PlayerData, QBCore.Config.Player.PlayerDefaults)

--     if GetResourceState('qb-inventory') ~= 'missing' then
--         PlayerData.items = exports['qb-inventory']:LoadInventory(PlayerData.source, PlayerData.citizenid)
--     end

--     return QBCore.Player.CreatePlayer(PlayerData, Offline)
-- end

-- function QBCorev2.Player.Login(source, citizenid, newData)
--     if not source or type(source) == 'number' then
--         QBCorev2.ShowError(resourceName, 'ERROR QBCORE.PLAYER.LOGIN - NO SOURCE GIVEN!')
--         return false
--     end

--     if not citizenid then -- new player
--         checkPlayerData(source, newData or {})
--         return true
--     end

--     local license = QBCore.Functions.GetIdentifier(source, 'license')
--     local PlayerData = MySQL.prepare.await('SELECT * FROM players where citizenid = ?', { citizenid })

--     if not PlayerData or license ~= PlayerData.license then
--         DropPlayer(source, Lang:t('info.exploit_dropped'))
--         TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'white', GetPlayerName(source) .. ' Has Been Dropped For Character Joining Exploit', false)
--         return false
--     end

--     PlayerData.money = json.decode(PlayerData.money)
--     PlayerData.job = json.decode(PlayerData.job)
--     PlayerData.gang = json.decode(PlayerData.gang)
--     PlayerData.position = json.decode(PlayerData.position)
--     PlayerData.metadata = json.decode(PlayerData.metadata)
--     PlayerData.charinfo = json.decode(PlayerData.charinfo)
--     checkPlayerData(source, PlayerData)
--     return true
-- end



-- function CreateNewPlayer()
--     local newPlayer = {}

--     newPlayer.citizenid = CreateCitizenId()
--     newPlayer.cid = 1
--     newPlayer.money = CreateMoneyDefaults()
--     newPlayer.optin = true
--     newPlayer.charinfo = CreateCharInfo()
--     newPlayer.job = CreateJobDefaults()
--     newPlayer.gang = CreateGangDefaults()
--     newPlayer.metadata = CreateMetadata()
--     newPlayer.position = QBConfig.DefaultSpawn
--     newPlayer.items = {}

--     return newPlayer
-- end

-- function CreateMoneyDefaults()
--     local moneyDefaults = {}
--     for moneytype, startamount in pairs(QBConfig.Money.MoneyTypes) do
--         moneyDefaults[moneytype] = startamount
--     end
--     return moneyDefaults
-- end

-- function CreateCharInfo()
--     return {
--         firstname = 'Firstname',
--         lastname = 'Lastname',
--         birthdate = '00-00-0000',
--         gender = 0,
--         nationality = 'USA',
--         phone = QBCore.Functions.CreatePhoneNumber(),
--         account = QBCore.Functions.CreateAccountNumber()
--     }
-- end

-- function CreateOrganizationDefaults(orgType)
--     if orgType == 'job' then
--         return {
--             name = 'unemployed',
--             label = 'Civilian',
--             payment = 10,
--             type = 'none',
--             onduty = false,
--             isboss = false,
--             grade = {
--                 name = 'Freelancer',
--                 level = 0
--             }
--         }
--     elseif orgType == 'gang' then
--         return {
--             name = 'none',
--             label = 'No Gang Affiliation',
--             isboss = false,
--             grade = {
--                 name = 'none',
--                 level = 0
--             }
--         }
--     else
--         error('Invalid organization type: ' .. orgType)
--     end
-- end

-- function CreateMetadata()
--     return {
--         hunger = 100,
--         thirst = 100,
--         stress = 0,
--         isdead = false,
--         inlaststand = false,
--         armor = 0,
--         ishandcuffed = false,
--         tracker = false,
--         injail = 0,
--         jailitems = {},
--         status = {},
--         phone = {},
--         rep = {},
--         currentapartment = nil,
--         callsign = 'NO CALLSIGN',
--         bloodtype = QBConfig.Player.Bloodtypes[math.random(1, #QBConfig.Player.Bloodtypes)],
--         fingerprint = QBCore.Player.CreateFingerId(),
--         walletid = QBCore.Player.CreateWalletId(),
--         criminalrecord = {
--             hasRecord = false,
--             date = nil
--         },
--         licences = {
--             driver = true,
--             business = false,
--             weapon = false
--         },
--         inside = {
--             house = nil,
--             apartment = {
--                 apartmentType = nil,
--                 apartmentId = nil,
--             }
--         },
--         phonedata = {
--             SerialNumber = QBCore.Player.CreateSerialNumber(),
--             InstalledApps = {}
--         }
--     }
-- end


-- QBConfig.Player.PlayerDefaults = {
--     citizenid = function() return QBCore.Player.CreateCitizenId() end,
--     cid = 1,
--     money = function()
--         local moneyDefaults = {}
--         for moneytype, startamount in pairs(QBConfig.Money.MoneyTypes) do
--             moneyDefaults[moneytype] = startamount
--         end
--         return moneyDefaults
--     end,
--     optin = true,
--     charinfo = {
--         firstname = 'Firstname',
--         lastname = 'Lastname',
--         birthdate = '00-00-0000',
--         gender = 0,
--         nationality = 'USA',
--         phone = function() return QBCore.Functions.CreatePhoneNumber() end,
--         account = function() return QBCore.Functions.CreateAccountNumber() end
--     },
--     job = {
--         name = 'unemployed',
--         label = 'Civilian',
--         payment = 10,
--         type = 'none',
--         onduty = false,
--         isboss = false,
--         grade = {
--             name = 'Freelancer',
--             level = 0
--         }
--     },
--     gang = {
--         name = 'none',
--         label = 'No Gang Affiliation',
--         isboss = false,
--         grade = {
--             name = 'none',
--             level = 0
--         }
--     },
--     metadata = {
--         hunger = 100,
--         thirst = 100,
--         stress = 0,
--         isdead = false,
--         inlaststand = false,
--         armor = 0,
--         ishandcuffed = false,
--         tracker = false,
--         injail = 0,
--         jailitems = {},
--         status = {},
--         phone = {},
--         rep = {},
--         currentapartment = nil,
--         callsign = 'NO CALLSIGN',
--         bloodtype = function() return QBConfig.Player.Bloodtypes[math.random(1, #QBConfig.Player.Bloodtypes)] end,
--         fingerprint = function() return QBCore.Player.CreateFingerId() end,
--         walletid = function() return QBCore.Player.CreateWalletId() end,
--         criminalrecord = {
--             hasRecord = false,
--             date = nil
--         },
--         licences = {
--             driver = true,
--             business = false,
--             weapon = false
--         },
--         inside = {
--             house = nil,
--             apartment = {
--                 apartmentType = nil,
--                 apartmentId = nil,
--             }
--         },
--         phonedata = {
--             SerialNumber = function() return QBCore.Player.CreateSerialNumber() end,
--             InstalledApps = {}
--         }
--     },
--     position = QBConfig.DefaultSpawn,
--     items = {},
-- }







-- QBCore.Players = {}
-- QBCore.Player = {}


-- -- On player login get their data or set defaults
-- -- Don't touch any of this unless you know what you are doing
-- -- Will cause major issues!

-- local resourceName = GetCurrentResourceName()

-- function QBCore.Player.Login(source, citizenid, newData)
--     if source and source ~= '' then
--         if citizenid then
--             local license = QBCore.Functions.GetIdentifier(source, 'license')
--             local PlayerData = MySQL.prepare.await('SELECT * FROM players where citizenid = ?', { citizenid })
--             if PlayerData and license == PlayerData.license then
--                 PlayerData.money = json.decode(PlayerData.money)
--                 PlayerData.job = json.decode(PlayerData.job)
--                 PlayerData.gang = json.decode(PlayerData.gang)
--                 PlayerData.position = json.decode(PlayerData.position)
--                 PlayerData.metadata = json.decode(PlayerData.metadata)
--                 PlayerData.charinfo = json.decode(PlayerData.charinfo)
--                 QBCore.Player.CheckPlayerData(source, PlayerData)
--             else
--                 DropPlayer(source, Lang:t('info.exploit_dropped'))
--                 TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'white', GetPlayerName(source) .. ' Has Been Dropped For Character Joining Exploit', false)
--             end
--         else
--             QBCore.Player.CheckPlayerData(source, newData)
--         end
--         return true
--     else
--         QBCore.ShowError(resourceName, 'ERROR QBCORE.PLAYER.LOGIN - NO SOURCE GIVEN!')
--         return false
--     end
-- end


-- function QBCore.Player.CheckPlayerData(source, PlayerData)
--     PlayerData = PlayerData or {}
--     local Offline = not source

--     if source then
--         PlayerData.source = source
--         PlayerData.license = PlayerData.license or QBCore.Functions.GetIdentifier(source, 'license')
--         PlayerData.name = GetPlayerName(source)
--     end

--     applyDefaults(PlayerData, QBCore.Config.Player.PlayerDefaults)

--     if GetResourceState('qb-inventory') ~= 'missing' then
--         PlayerData.items = exports['qb-inventory']:LoadInventory(PlayerData.source, PlayerData.citizenid)
--     end

--     return QBCore.Player.CreatePlayer(PlayerData, Offline)
-- end

-- function QBCore.Player.CreatePlayer(PlayerData, Offline)
--     local self = {}
--     self.Functions = {}
--     self.PlayerData = PlayerData
--     self.Offline = Offline

--     function self.Functions.UpdatePlayerData()
--         if self.Offline then return end
--         TriggerEvent('QBCore:Player:SetPlayerData', self.PlayerData)
--         TriggerClientEvent('QBCore:Player:SetPlayerData', self.PlayerData.source, self.PlayerData)
--     end

--     function self.Functions.SetJob(job, grade)
--         job = job:lower()
--         grade = grade or '0'
--         if not QBCore.Shared.Jobs[job] then return false end
--         self.PlayerData.job = {
--             name = job,
--             label = QBCore.Shared.Jobs[job].label,
--             onduty = QBCore.Shared.Jobs[job].defaultDuty,
--             type = QBCore.Shared.Jobs[job].type or 'none',
--             grade = {
--                 name = 'No Grades',
--                 level = 0,
--                 payment = 30,
--                 isboss = false
--             }
--         }
--         local gradeKey = tostring(grade)
--         local jobGradeInfo = QBCore.Shared.Jobs[job].grades[gradeKey]
--         if jobGradeInfo then
--             self.PlayerData.job.grade.name = jobGradeInfo.name
--             self.PlayerData.job.grade.level = tonumber(gradeKey)
--             self.PlayerData.job.grade.payment = jobGradeInfo.payment
--             self.PlayerData.job.grade.isboss = jobGradeInfo.isboss or false
--             self.PlayerData.job.isboss = jobGradeInfo.isboss or false
--         end

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             TriggerEvent('QBCore:Server:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--             TriggerClientEvent('QBCore:Client:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--         end

--         return true
--     end

--     function self.Functions.SetGang(gang, grade)
--         gang = gang:lower()
--         grade = grade or '0'
--         if not QBCore.Shared.Gangs[gang] then return false end
--         self.PlayerData.gang = {
--             name = gang,
--             label = QBCore.Shared.Gangs[gang].label,
--             grade = {
--                 name = 'No Grades',
--                 level = 0,
--                 isboss = false
--             }
--         }
--         local gradeKey = tostring(grade)
--         local gangGradeInfo = QBCore.Shared.Gangs[gang].grades[gradeKey]
--         if gangGradeInfo then
--             self.PlayerData.gang.grade.name = gangGradeInfo.name
--             self.PlayerData.gang.grade.level = tonumber(gradeKey)
--             self.PlayerData.gang.grade.isboss = gangGradeInfo.isboss or false
--             self.PlayerData.gang.isboss = gangGradeInfo.isboss or false
--         end

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             TriggerEvent('QBCore:Server:OnGangUpdate', self.PlayerData.source, self.PlayerData.gang)
--             TriggerClientEvent('QBCore:Client:OnGangUpdate', self.PlayerData.source, self.PlayerData.gang)
--         end

--         return true
--     end

--     function self.Functions.Notify(text, type, length)
--         TriggerClientEvent('QBCore:Notify', self.PlayerData.source, text, type, length)
--     end

--     function self.Functions.HasItem(items, amount)
--         return QBCore.Functions.HasItem(self.PlayerData.source, items, amount)
--     end

--     function self.Functions.SetJobDuty(onDuty)
--         self.PlayerData.job.onduty = not not onDuty
--         TriggerEvent('QBCore:Server:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--         TriggerClientEvent('QBCore:Client:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.SetPlayerData(key, val)
--         if not key or type(key) ~= 'string' then return end
--         self.PlayerData[key] = val
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.SetMetaData(meta, val)
--         if not meta or type(meta) ~= 'string' then return end
--         if meta == 'hunger' or meta == 'thirst' then
--             val = val > 100 and 100 or val
--         end
--         self.PlayerData.metadata[meta] = val
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.GetMetaData(meta)
--         if not meta or type(meta) ~= 'string' then return end
--         return self.PlayerData.metadata[meta]
--     end

--     function self.Functions.AddRep(rep, amount)
--         if not rep or not amount then return end
--         local addAmount = tonumber(amount)
--         local currentRep = self.PlayerData.metadata['rep'][rep] or 0
--         self.PlayerData.metadata['rep'][rep] = currentRep + addAmount
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.RemoveRep(rep, amount)
--         if not rep or not amount then return end
--         local removeAmount = tonumber(amount)
--         local currentRep = self.PlayerData.metadata['rep'][rep] or 0
--         if currentRep - removeAmount < 0 then
--             self.PlayerData.metadata['rep'][rep] = 0
--         else
--             self.PlayerData.metadata['rep'][rep] = currentRep - removeAmount
--         end
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.GetRep(rep)
--         if not rep then return end
--         return self.PlayerData.metadata['rep'][rep] or 0
--     end

--     function self.Functions.AddMoney(moneytype, amount, reason)
--         reason = reason or 'unknown'
--         moneytype = moneytype:lower()
--         amount = tonumber(amount)
--         if amount < 0 then return end
--         if not self.PlayerData.money[moneytype] then return false end
--         self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] + amount

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             if amount > 100000 then
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
--             else
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
--             end
--             TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, false)
--             TriggerClientEvent('QBCore:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'add', reason)
--             TriggerEvent('QBCore:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'add', reason)
--         end

--         return true
--     end

--     function self.Functions.RemoveMoney(moneytype, amount, reason)
--         reason = reason or 'unknown'
--         moneytype = moneytype:lower()
--         amount = tonumber(amount)
--         if amount < 0 then return end
--         if not self.PlayerData.money[moneytype] then return false end
--         for _, mtype in pairs(QBCore.Config.Money.DontAllowMinus) do
--             if mtype == moneytype then
--                 if (self.PlayerData.money[moneytype] - amount) < 0 then
--                     return false
--                 end
--             end
--         end
--         self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] - amount

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             if amount > 100000 then
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
--             else
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
--             end
--             TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, true)
--             if moneytype == 'bank' then
--                 TriggerClientEvent('qb-phone:client:RemoveBankMoney', self.PlayerData.source, amount)
--             end
--             TriggerClientEvent('QBCore:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'remove', reason)
--             TriggerEvent('QBCore:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'remove', reason)
--         end

--         return true
--     end

--     function self.Functions.SetMoney(moneytype, amount, reason)
--         reason = reason or 'unknown'
--         moneytype = moneytype:lower()
--         amount = tonumber(amount)
--         if amount < 0 then return false end
--         if not self.PlayerData.money[moneytype] then return false end
--         local difference = amount - self.PlayerData.money[moneytype]
--         self.PlayerData.money[moneytype] = amount

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'SetMoney', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') set, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
--             TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, math.abs(difference), difference < 0)
--             TriggerClientEvent('QBCore:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'set', reason)
--             TriggerEvent('QBCore:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'set', reason)
--         end

--         return true
--     end

--     function self.Functions.GetMoney(moneytype)
--         if not moneytype then return false end
--         moneytype = moneytype:lower()
--         return self.PlayerData.money[moneytype]
--     end

--     function self.Functions.Save()
--         if self.Offline then
--             QBCore.Player.SaveOffline(self.PlayerData)
--         else
--             QBCore.Player.Save(self.PlayerData.source)
--         end
--     end

--     function self.Functions.Logout()
--         if self.Offline then return end
--         QBCore.Player.Logout(self.PlayerData.source)
--     end

--     function self.Functions.AddMethod(methodName, handler)
--         self.Functions[methodName] = handler
--     end

--     function self.Functions.AddField(fieldName, data)
--         self[fieldName] = data
--     end

--     if self.Offline then
--         return self
--     else
--         QBCore.Players[self.PlayerData.source] = self
--         QBCore.Player.Save(self.PlayerData.source)
--         TriggerEvent('QBCore:Server:PlayerLoaded', self)
--         self.Functions.UpdatePlayerData()
--     end
-- end

-- function QBCore.Player.GetPlayerByLicense(license)
--     if license then
--         local source = QBCore.Functions.GetSource(license)
--         if source > 0 then
--             return QBCore.Players[source]
--         else
--             return QBCore.Player.GetOfflinePlayerByLicense(license)
--         end
--     end
--     return nil
-- end

-- function QBCore.Player.GetOfflinePlayer(citizenid)
--     if citizenid then
--         local PlayerData = MySQL.prepare.await('SELECT * FROM players where citizenid = ?', { citizenid })
--         if PlayerData then
--             PlayerData.money = json.decode(PlayerData.money)
--             PlayerData.job = json.decode(PlayerData.job)
--             PlayerData.gang = json.decode(PlayerData.gang)
--             PlayerData.position = json.decode(PlayerData.position)
--             PlayerData.metadata = json.decode(PlayerData.metadata)
--             PlayerData.charinfo = json.decode(PlayerData.charinfo)
--             return QBCore.Player.CheckPlayerData(nil, PlayerData)
--         end
--     end
--     return nil
-- end

-- function QBCore.Player.GetOfflinePlayerByLicense(license)
--     if license then
--         local PlayerData = MySQL.prepare.await('SELECT * FROM players where license = ?', { license })
--         if PlayerData then
--             PlayerData.money = json.decode(PlayerData.money)
--             PlayerData.job = json.decode(PlayerData.job)
--             PlayerData.gang = json.decode(PlayerData.gang)
--             PlayerData.position = json.decode(PlayerData.position)
--             PlayerData.metadata = json.decode(PlayerData.metadata)
--             PlayerData.charinfo = json.decode(PlayerData.charinfo)
--             return QBCore.Player.CheckPlayerData(nil, PlayerData)
--         end
--     end
--     return nil
-- end

-- function QBCore.Player.Logout(source)
--     TriggerClientEvent('QBCore:Client:OnPlayerUnload', source)
--     TriggerEvent('QBCore:Server:OnPlayerUnload', source)
--     TriggerClientEvent('QBCore:Player:UpdatePlayerData', source)
--     Wait(200)
--     QBCore.Players[source] = nil
-- end

-- -- create player
-- function QBCore.Player.CreatePlayer(PlayerData, Offline)
--     local self = {}
--     self.Functions = {}
--     self.PlayerData = PlayerData
--     self.Offline = Offline

--     function self.Functions.UpdatePlayerData()
--         if self.Offline then return end
--         TriggerEvent('QBCore:Player:SetPlayerData', self.PlayerData)
--         TriggerClientEvent('QBCore:Player:SetPlayerData', self.PlayerData.source, self.PlayerData)
--     end

--     function self.Functions.SetJob(job, grade)
--         job = job:lower()
--         grade = grade or '0'
--         if not QBCore.Shared.Jobs[job] then return false end
--         self.PlayerData.job = {
--             name = job,
--             label = QBCore.Shared.Jobs[job].label,
--             onduty = QBCore.Shared.Jobs[job].defaultDuty,
--             type = QBCore.Shared.Jobs[job].type or 'none',
--             grade = {
--                 name = 'No Grades',
--                 level = 0,
--                 payment = 30,
--                 isboss = false
--             }
--         }
--         local gradeKey = tostring(grade)
--         local jobGradeInfo = QBCore.Shared.Jobs[job].grades[gradeKey]
--         if jobGradeInfo then
--             self.PlayerData.job.grade.name = jobGradeInfo.name
--             self.PlayerData.job.grade.level = tonumber(gradeKey)
--             self.PlayerData.job.grade.payment = jobGradeInfo.payment
--             self.PlayerData.job.grade.isboss = jobGradeInfo.isboss or false
--             self.PlayerData.job.isboss = jobGradeInfo.isboss or false
--         end

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             TriggerEvent('QBCore:Server:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--             TriggerClientEvent('QBCore:Client:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--         end

--         return true
--     end

--     function self.Functions.SetGang(gang, grade)
--         gang = gang:lower()
--         grade = grade or '0'
--         if not QBCore.Shared.Gangs[gang] then return false end
--         self.PlayerData.gang = {
--             name = gang,
--             label = QBCore.Shared.Gangs[gang].label,
--             grade = {
--                 name = 'No Grades',
--                 level = 0,
--                 isboss = false
--             }
--         }
--         local gradeKey = tostring(grade)
--         local gangGradeInfo = QBCore.Shared.Gangs[gang].grades[gradeKey]
--         if gangGradeInfo then
--             self.PlayerData.gang.grade.name = gangGradeInfo.name
--             self.PlayerData.gang.grade.level = tonumber(gradeKey)
--             self.PlayerData.gang.grade.isboss = gangGradeInfo.isboss or false
--             self.PlayerData.gang.isboss = gangGradeInfo.isboss or false
--         end

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             TriggerEvent('QBCore:Server:OnGangUpdate', self.PlayerData.source, self.PlayerData.gang)
--             TriggerClientEvent('QBCore:Client:OnGangUpdate', self.PlayerData.source, self.PlayerData.gang)
--         end

--         return true
--     end

--     function self.Functions.Notify(text, type, length)
--         TriggerClientEvent('QBCore:Notify', self.PlayerData.source, text, type, length)
--     end

--     function self.Functions.HasItem(items, amount)
--         return QBCore.Functions.HasItem(self.PlayerData.source, items, amount)
--     end

--     function self.Functions.SetJobDuty(onDuty)
--         self.PlayerData.job.onduty = not not onDuty
--         TriggerEvent('QBCore:Server:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--         TriggerClientEvent('QBCore:Client:OnJobUpdate', self.PlayerData.source, self.PlayerData.job)
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.SetPlayerData(key, val)
--         if not key or type(key) ~= 'string' then return end
--         self.PlayerData[key] = val
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.SetMetaData(meta, val)
--         if not meta or type(meta) ~= 'string' then return end
--         if meta == 'hunger' or meta == 'thirst' then
--             val = val > 100 and 100 or val
--         end
--         self.PlayerData.metadata[meta] = val
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.GetMetaData(meta)
--         if not meta or type(meta) ~= 'string' then return end
--         return self.PlayerData.metadata[meta]
--     end

--     function self.Functions.AddRep(rep, amount)
--         if not rep or not amount then return end
--         local addAmount = tonumber(amount)
--         local currentRep = self.PlayerData.metadata['rep'][rep] or 0
--         self.PlayerData.metadata['rep'][rep] = currentRep + addAmount
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.RemoveRep(rep, amount)
--         if not rep or not amount then return end
--         local removeAmount = tonumber(amount)
--         local currentRep = self.PlayerData.metadata['rep'][rep] or 0
--         if currentRep - removeAmount < 0 then
--             self.PlayerData.metadata['rep'][rep] = 0
--         else
--             self.PlayerData.metadata['rep'][rep] = currentRep - removeAmount
--         end
--         self.Functions.UpdatePlayerData()
--     end

--     function self.Functions.GetRep(rep)
--         if not rep then return end
--         return self.PlayerData.metadata['rep'][rep] or 0
--     end

--     function self.Functions.AddMoney(moneytype, amount, reason)
--         reason = reason or 'unknown'
--         moneytype = moneytype:lower()
--         amount = tonumber(amount)
--         if amount < 0 then return end
--         if not self.PlayerData.money[moneytype] then return false end
--         self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] + amount

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             if amount > 100000 then
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
--             else
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
--             end
--             TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, false)
--             TriggerClientEvent('QBCore:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'add', reason)
--             TriggerEvent('QBCore:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'add', reason)
--         end

--         return true
--     end

--     function self.Functions.RemoveMoney(moneytype, amount, reason)
--         reason = reason or 'unknown'
--         moneytype = moneytype:lower()
--         amount = tonumber(amount)
--         if amount < 0 then return end
--         if not self.PlayerData.money[moneytype] then return false end
--         for _, mtype in pairs(QBCore.Config.Money.DontAllowMinus) do
--             if mtype == moneytype then
--                 if (self.PlayerData.money[moneytype] - amount) < 0 then
--                     return false
--                 end
--             end
--         end
--         self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] - amount

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             if amount > 100000 then
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
--             else
--                 TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
--             end
--             TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, true)
--             if moneytype == 'bank' then
--                 TriggerClientEvent('qb-phone:client:RemoveBankMoney', self.PlayerData.source, amount)
--             end
--             TriggerClientEvent('QBCore:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'remove', reason)
--             TriggerEvent('QBCore:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'remove', reason)
--         end

--         return true
--     end

--     function self.Functions.SetMoney(moneytype, amount, reason)
--         reason = reason or 'unknown'
--         moneytype = moneytype:lower()
--         amount = tonumber(amount)
--         if amount < 0 then return false end
--         if not self.PlayerData.money[moneytype] then return false end
--         local difference = amount - self.PlayerData.money[moneytype]
--         self.PlayerData.money[moneytype] = amount

--         if not self.Offline then
--             self.Functions.UpdatePlayerData()
--             TriggerEvent('qb-log:server:CreateLog', 'playermoney', 'SetMoney', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') set, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason)
--             TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, math.abs(difference), difference < 0)
--             TriggerClientEvent('QBCore:Client:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'set', reason)
--             TriggerEvent('QBCore:Server:OnMoneyChange', self.PlayerData.source, moneytype, amount, 'set', reason)
--         end

--         return true
--     end

--     function self.Functions.GetMoney(moneytype)
--         if not moneytype then return false end
--         moneytype = moneytype:lower()
--         return self.PlayerData.money[moneytype]
--     end

--     function self.Functions.Save()
--         if self.Offline then
--             QBCore.Player.SaveOffline(self.PlayerData)
--         else
--             QBCore.Player.Save(self.PlayerData.source)
--         end
--     end

--     function self.Functions.Logout()
--         if self.Offline then return end
--         QBCore.Player.Logout(self.PlayerData.source)
--     end

--     function self.Functions.AddMethod(methodName, handler)
--         self.Functions[methodName] = handler
--     end

--     function self.Functions.AddField(fieldName, data)
--         self[fieldName] = data
--     end

--     if self.Offline then
--         return self
--     else
--         QBCore.Players[self.PlayerData.source] = self
--         QBCore.Player.Save(self.PlayerData.source)
--         TriggerEvent('QBCore:Server:PlayerLoaded', self)
--         self.Functions.UpdatePlayerData()
--     end
-- end

function GetIdentifier(playerSrc)
    local src = tostring(playerSrc)
    local identifierAmount = GetNumPlayerIdentifiers(src)
    local identifierTable = {}
    for i = 0, identifierAmount - 1 do
        local key, value = string.match(GetPlayerIdentifier(src, i), "(%w+):(.*)")
        identifierTable[key] = value
    end
    return identifierTable
end

GetIdentifier(6)
-- --- GetJobCount function to get the count of players with a specific job
-- ---@param jobName string -- The name of the job to check
-- ---@param onduty boolean -- Whether to check if the player is on duty (optional, defaults to false)
-- ---@return number, number, table -- The total number of players, the number of players with the job, and a table of players with the job
-- ---@usage local total, jobCount, players = QBCorev2.Modules.GetJobCount('police')
-- function QBCorev2.Modules.GetJobCount(jobName, onduty)
--     QBCorev2.Utils.ValidateArgs({jobName, onduty}, {'string', 'boolean'}, function(success, err)
--         if not success then
--             error(err)
--         end
--     end)
--     onduty = onduty or false
--     local totalPlayers = 0
--     local jobCount = 0
--     local players = {}

--     for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
--         totalPlayers = totalPlayers + 1

--         if v.PlayerData.job.name == jobName and v.PlayerData.job.onduty then
--             jobCount = jobCount + 1
--         end

--         players[v.PlayerData.source] = {}
--     end

--     return totalPlayers, jobCount, players
-- end

-- --- GetJobCount callback to get the count of players with a specific job for the client side
-- ---@param jobName string -- The name of the job to check
-- ---@param onduty boolean -- Whether to check if the player is on duty (optional, defaults to false)
-- ---@usage QBCorev2.Components.Callbacks.TriggerServerCallback('qb-corev2:getJobCount', source, function(totalPlayers, jobCount, players) print(totalPlayers, jobCount, players) end, 'police')
-- QBCorev2.Components.Callbacks:CreateServerCallback('qb-corev2:callback:getJobCount', function(source, cb, jobName, onduty)
--     QBCorev2.Utils.ValidateArgs({jobName, onduty}, {'string', 'boolean'}, function(success, err)
--         if not success then
--             error(err)
--         end
--     end)
--     if not source then return end
--     onduty = onduty or false
--     local totalPlayers, jobCount, players = QBCorev2.Modules.GetJobCount(jobName, onduty)
--     cb(totalPlayers, jobCount, players)
-- end)
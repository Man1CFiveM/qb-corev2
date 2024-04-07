-- function QBCorev2.Modules.Logger(_player, _name, ...)
--     print('logging',_player, _name)
-- end

QBCorev2.Modules.Logger = {
    Image = function (self,  data)
        if not type(data) then
            return exports.fmsdk:takeImage()
        end
        exports.fmsdk:takeImage(data)
    end,
    Text = function (self, level, header, data)
        if not type(data) then
            return exports.fmsdk:LogMessage(level, header)
        end
        exports.fmsdk:LogMessage(level, header, data)
    end,
}


-- if service == 'fivemanage' then
--     local key = GetConvar('fivemanage:key', '')

--     if key ~= '' then
--         local endpoint = 'https://api.fivemanage.com/api/logs/batch'

--         local headers = {
--             ['Content-Type'] = 'application/json',
--             ['Authorization'] = key,
--             ['User-Agent'] = 'ox_lib'
--         }

--         function lib.logger(source, event, message, ...)
--             if not buffer then
--                 buffer = {}

--                 SetTimeout(500, function()
--                     PerformHttpRequest(endpoint, function(status, _, _, response)
--                         if status ~= 200 then 
--                             if type(response) == 'string' then
--                                 response = json.decode(response) or response
--                                 badResponse(endpoint, status, response)
--                             end
--                         end
--                     end, 'POST', json.encode(buffer), headers)

--                     buffer = nil
--                     bufferSize = 0
--                 end)
--             end

--             bufferSize += 1
--             buffer[bufferSize] = {
--                 level = "info",
--                 message = message,
--                 resource = cache.resource,
--                 metadata = {
--                     hostname = hostname,
--                     service = event,
--                     source = source,
--                     tags = formatTags(source, ... and string.strjoin(',', string.tostringall(...)) or nil),
--                 }
--             }
--         end
--     end
-- end
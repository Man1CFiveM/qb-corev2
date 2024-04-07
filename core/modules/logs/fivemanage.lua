-- https://www.fivemanage.com/
-- FiveManage is a service that provides a platform for managing FiveM servers. 
-- It provides a range of features such as server monitoring, player management, and server logs. 
-- The FiveManage API allows developers to access and integrate the functionality of FiveManage with other applications. 
-- Some example API methods include retrieving server information, managing players, and retrieving logs.
---@class QBCorev2.Modules.Logger
---@field Image fun(data: table): table
---@field Text fun(level: string, header: string, data: table): table
---@useage QBCorev2.Modules.Logger:Image('table')
---@useage QBCorev2.Modules.Logger:Text(level, header, data)
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
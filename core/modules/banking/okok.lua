--- Get the bank account of a player or society
---@param society table -- The name of the society to get the account of
---@usage QBCorev2.Modules.GetAccount('bank')
function QBCorev2.Modules.Banking.GetAccount(society)
    QBCorev2.Utils.ValidateArgs({society}, {'table'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    exports['okokBanking']:GetAccount(society)
end

--- AddMoney function to add money to a bank account
---@param accountName string -- The name of the account to add money to
---@param amount number -- The amount of money to add
---@usage QBCorev2.Modules.AddMoney('bank', 100)
function QBCorev2.Modules.Banking.AddMoney(society, value)
    QBCorev2.Utils.ValidateArgs({society, value}, {'table', 'number'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['okokBanking']:AddMoney(society, value)
end

--- RemoveMoney function to remove money from a bank account
---@param accountName string -- The name of the account to remove money from
---@param amount number -- The amount of money to remove
---@usage QBCorev2.Modules.RemoveMoney('bank', 100)
function QBCorev2.Modules.Banking.RemoveMoney(society, value)
    QBCorev2.Utils.ValidateArgs({society, value}, {'table', 'number'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    exports['okokBanking']:RemoveMoney(society, value)
end
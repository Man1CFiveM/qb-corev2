--- CreatePlayerAccount function to create a bank account for a player
---@param playerId number -- The player ID to create the account for
---@param accountName string -- The name of the account to create
---@param accountBalance number -- The starting balance of the account
---@param accountUsers table -- The users to add to the account
---@usage QBCorev2.Modules.CreatePlayerAccount(1, 'bank', 1000, {1})
function QBCorev2.Modules.CreatePlayerAccount(playerId, accountName, accountBalance, accountUsers)
    if not QBCore.Functions.GetPlayer(playerId) then
        return false, 'Invalid player ID'
    end
    QBCorev2.Utils.ValidateArgs({playerId, accountName, accountBalance, accountUsers}, {'number', 'string', 'number', 'table'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:CreatePlayerAccount(accountName, accountBalance)
end

--- AddMoney function to add money to a bank account
---@param accountName string -- The name of the account to add money to
---@param amount number -- The amount of money to add
---@param reason string -- The reason for adding money
---@usage QBCorev2.Modules.AddMoney('bank', 100, 'paycheck')
function QBCorev2.Modules.AddMoney(accountName, amount, reason)
    if not reason then reason = 'External Deposit' end
    QBCorev2.Utils.ValidateArgs({accountName, amount, reason}, {'string', 'number', 'string'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:AddMoney(accountName, amount, reason)
end

--- RemoveMoney function to remove money from a bank account
---@param accountName string -- The name of the account to remove money from
---@param amount number -- The amount of money to remove
---@param reason string -- The reason for removing money
---@usage QBCorev2.Modules.RemoveMoney('bank', 100, 'purchase')
function QBCorev2.Modules.RemoveMoney(accountName, amount, reason)
    if not reason then reason = 'External Withdrawal' end
    QBCorev2.Utils.ValidateArgs({accountName, amount, reason}, {'string', 'number', 'string'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:RemoveMoney(accountName, amount, reason)
end

--- CreateJobAccount function to create a bank account for a job
---@param accountName string -- The name of the account to create
---@param accountBalance number -- The starting balance of the account
---@usage QBCorev2.Modules.CreateJobAccount('bank', 1000)
function QBCorev2.Modules.CreateJobAccount(accountName, accountBalance) --TODO should this not have a job id as a parameter?
    QBCorev2.Utils.ValidateArgs({accountName, accountBalance}, {'string', 'number'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:CreateJobAccount(accountName, accountBalance)
end

--- CreateGangAccount function to create a bank account for a gang
---@param accountName string -- The name of the account to create
---@param accountBalance number -- The starting balance of the account
---@usage QBCorev2.Modules.CreateGangAccount('bank', 1000)
function QBCorev2.Modules.CreateGangAccount(accountName, accountBalance) --TODO should this not have a gangId parameter?
    QBCorev2.Utils.ValidateArgs({accountName, accountBalance}, {'string', 'number'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:CreateGangAccount(accountName, accountBalance)
end

--- CreateBankStatement function to create a bank statement for a player
---@param playerId number -- The player ID to create the statement for
---@param account string -- The account to create the statement for
---@param amount number -- The amount of the statement
---@param reason string -- The reason for the statement
---@param statementType string -- The type of statement
---@param accountType string -- The type of account
---@usage QBCorev2.Modules.CreateBankStatement(1, 'bank', 100, 'paycheck', 'deposit', 'savings')
function QBCorev2.Modules.CreateBankStatement(playerId, account, amount, reason, statementType, accountType)
    if not QBCore.Functions.GetPlayer(playerId) then
        return false, 'Invalid player ID'
    end
    QBCorev2.Utils.ValidateArgs({playerId, account, amount, reason, statementType, accountType}, {'number', 'string', 'number', 'string', 'string', 'string'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:CreateBankStatement(playerId, account, amount, reason, statementType, accountType)
end

--- GetAccount function to get an account
---@param accountName string -- The name of the account to get
---@usage QBCorev2.Modules.GetAccount('bank') TODO dont think this is bank
function QBCorev2.Modules.GetAccount(accountName)
    QBCorev2.Utils.ValidateArgs({accountName}, {'string'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    if not exports['qb-banking']:GetAccount(accountName) then
        return false, 'Invalid account name'
    end
end

--- GetAccountBalance function to get the balance of an account
---@param GetAccountBalance number -- The account to get the balance of
---@usage QBCorev2.Modules.GetAccountBalance(1)
function QBCorev2.Modules.GetAccountBalance(GetAccountBalance)
    QBCorev2.Utils.ValidateArgs({GetAccountBalance}, {'number'}, function(success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-banking']:GetAccount(GetAccountBalance)
end
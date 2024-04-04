---Loads the inventory for the player with the citizenid that is provided
---@param source number Source of the player
---@param citizenid string CitizenID of the player
---@return table Table of items with slot as index
---@usage QBCorev2.Modules.LoadInventory(source, citizenid)
function QBCorev2.Modules.LoadInventory(source, citizenid) -- TODO source in loadinventory is never really used, so why is it there?
    QBCorev2.Utils.ValidateArgs({'number', 'string'}, {source, citizenid}, function (success, err)
        if not success then
            error(err)
        end
    end)
    local inventoryPlayer = exports['qb-inventory']:LoadInventory(source, citizenid)
    local inventory = promise.new()
    inventory:resolve(inventoryPlayer)
    return Citizen.Await(inventory)
end

---Saves the inventory for the player with the citizenid that is provided
---@param source number Source of the player
---@param offline boolean Is the player offline or not, if true, it will expect a table in source
---@usage QBCorev2.Modules.SaveInventory(1, false)
function QBCorev2.Modules.SaveInventory(source, offline)
    QBCorev2.Utils.ValidateArgs({'number|table', 'boolean'}, {source, offline}, function (success, err)
        if not success then
            error(err)
        end
    end)
    exports['qb-inventory']:SaveInventory(source, offline)
end

---Returns the total weight of the items in the inventory of given item
---@param items table Table of items
---@return number Total weight of the items
---@usage QBCorev2.Modules.GetTotalWeight(items)
function QBCorev2.Modules.GetTotalWeight(items) -- TODO we give a list of items instead of checking if items exist in player inventory and then returning the total weight?
    QBCorev2.Utils.ValidateArgs({'table'}, {items}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:GetTotalWeight(items)
end

---Returns the first slot of the item in the inventory
---@param items table Table of items
---@param itemName string Name of the item
---@return number First slot of the item
---@usage QBCorev2.Modules.GetFirstSlotByItem(items, 'bottle_water')
function QBCorev2.Modules.GetFirstSlotByItem(items, itemName) --TODO why are we giving the list of items and then returning the first slot of the item? check then return
    QBCorev2.Utils.ValidateArgs({'table','string'}, {items, itemName}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:GetFirstSlotByItem(items, itemName)
end
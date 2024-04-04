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
---@return table Returns table of slots
---@usage QBCorev2.Modules.GetFirstSlotByItem(items, 'bottle_water')
function QBCorev2.Modules.GetFirstSlotByItem(items, itemName) --TODO why are we giving the list of items and then returning the first slot of the item? check then return
    QBCorev2.Utils.ValidateArgs({'table','string'}, {items, itemName}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:GetFirstSlotByItem(items, itemName)
end

---Gets the slots that the provided item is in
---@param items table Table of items
---@param itemName string Name of the item
---@return number First slot of the item
---@usage QBCorev2.Modules.GetFirstSlotByItem(items, 'bottle_water')
function QBCorev2.Modules.GetSlotsByItem(items, itemName)
    QBCorev2.Utils.ValidateArgs({'table','string'}, {items, itemName}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:GetSlotsByItem(items, itemName)
end

---Add an item to the inventory of the player
---@param source number The source of the player
---@param item string The item to add to the inventory
---@param amount? number The amount of the item to add
---@param slot? number The slot to add the item to
---@param info? table Extra info to add onto the item to use whenever you get the item
---@return boolean success Returns true if the item was added, false it the item couldn't be added
---@usage QBCorev2.Modules.AddItem(1, 'bread', 1, 1, {quality = 100})
function QBCorev2.Modules.AddItem(source, item, amount, slot, info)
    QBCorev2.Utils.ValidateArgs({'number','string','number|nil','number|nil','table|nil'}, {source, item, amount, slot, info}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:AddItem(source, item, amount, slot, info)
end

---Remove an item from the inventory of the player
---@param source number The source of the player
---@param item string The item to remove from the inventory
---@param amount? number The amount of the item to remove
---@param slot? number The slot to remove the item from
---@return boolean success Returns true if the item was remove, false it the item couldn't be removed
---@usage QBCorev2.Modules.RemoveItem(1, 'bread', 1, 1)
function QBCorev2.Modules.RemoveItem(source, item, amount, slot)
    QBCorev2.Utils.ValidateArgs({'number','string','number|nil','number|nil'}, {source, item, amount, slot}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:RemoveItem(source, item, amount, slot)
end

---Get the item with the slot
---@param source number The source of the player to get the item from the slot
---@param slot number The slot to get the item from
---@return table The item that is in the slot
---@usage QBCorev2.Modules.GetItemBySlot(1, 1)
function QBCorev2.Modules.GetItemBySlot(source, slot)
    QBCorev2.Utils.ValidateArgs({'number','number'}, {source, slot}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:GetItemBySlot(source, slot)
end

---Get the item from the inventory of the player with the provided source by the name of the item
---@param source number The source of the player
---@param item string The name of the item to get
---@return table The item that is in the inventory
---@usage QBCorev2.Modules.GetItemByName(1, 'bread')
function QBCorev2.Modules.GetItemByName(source, slot)
    QBCorev2.Utils.ValidateArgs({'number','string'}, {source, slot}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:GetItemByName(source, slot)
end

---Clear the inventory of the player with the provided source and filter any items out of the clearing of the inventory to keep (optional)
---@param source number Source of the player to clear the inventory from
---@param filterItems? string | string[] Array of item names to keep in the inventory
---@usage QBCorev2.Modules.ClearInventory(1, {'bread', 'water'})
function QBCorev2.Modules.ClearInventory(source, filterItems)
    QBCorev2.Utils.ValidateArgs({'number','string|table'}, {source, filterItems}, function (success, err)
        if not success then
            error(err)
        end
    end)
    exports['qb-inventory']:ClearInventory(source, filterItems)
end

---Sets the items playerdata to the provided items parameter
---@param source number The source of the player
---@param items table The items to set the playerdata to
---@usage QBCorev2.Modules.SetInventory(1, items)
function QBCorev2.Modules.SetInventory(source, items)
    QBCorev2.Utils.ValidateArgs({'number','table'}, {source, items}, function (success, err)
        if not success then
            error(err)
        end
    end)
    exports['qb-inventory']:SetInventory(source, items)
end

---Set the data of a specific item
---@param source number The source of the player to set it for
---@param itemName string Name of the item to set the data for
---@param key string Name of the data index to change
---@param val any Value to set the data to
---@return boolean success Returns true if it worked
---@usage QBCorev2.Modules.SetItemData(1, 'bread', 'quality', 100)
function QBCorev2.Modules.SetItemData(source, itemName, key, val)
    QBCorev2.Utils.ValidateArgs({'number','string','string','any'}, {source, itemName, key, val}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:SetItemData(source, itemName, key, val)
end

---Checks if you have an item or not
---@param source number The source of the player to check it for
---@param items string | string[] | table<string, number> The items to check, either a string, array of strings or a key-value table of a string and number with the string representing the name of the item and the number representing the amount
---@param amount? number The amount of the item to check for, this will only have effect when items is a string or an array of strings
---@return boolean success Returns true if the player has the item
---@usage QBCorev2.Modules.HasItem(1, 'bread', 1)
function QBCorev2.Modules.HasItem(source, items, amount)
    QBCorev2.Utils.ValidateArgs({'number','string|table','number|nil'}, {source, items, amount}, function (success, err)
        if not success then
            error(err)
        end
    end)
    return exports['qb-inventory']:HasItem(source, items, amount)
end

function QBCorev2.Modules.UseableItem()
    local item = {}

    local function create()
        print('create()')
        -- Implement the create method here
    end

    local function get()
        print('get()')
        -- Implement the get method here
    end

    local function use()
        print('use()')
        -- Implement the use method here
    end

    -- Expose a method to create a new item
    function item:new()
        create()
        return self
    end

    -- Expose a method to get the item
    function item:getItem()
        get()
        return self
    end

    -- Expose a method to use the item
    function item:useItem()
        use()
        return self
    end

    return item
end

local myItem = QBCorev2.Modules.UseableItem()
myItem:new()
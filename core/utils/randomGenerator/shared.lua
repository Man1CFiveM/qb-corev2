-- Function to generate a random key
QBCorev2 = QBCorev2 or {}
QBCorev2.Utils = QBCorev2.Utils or {}

function QBCorev2.Utils.generateRandomKey(length)
    local res = ""
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    for i = 1, length do
        local index = math.random(#chars)
        res = res .. chars:sub(index, index)
    end

    return res
end

function QBCorev2.Utils.generateRandomLetterKey(length)
    local res = ""
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    for i = 1, length do
        local index = math.random(#chars)
        res = res .. chars:sub(index, index)
    end

    return res
end

function QBCorev2.Utils.generateRandomNumberKey(length)
    local res = ""
    local chars = "0123456789"

    for i = 1, length do
        local index = math.random(#chars)
        res = res .. chars:sub(index, index)
    end

    return res
end
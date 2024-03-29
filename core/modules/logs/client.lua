function QBCorev2.Modules.Logger(_name, ...)
    local output = ...
    if type(...) == 'table' then
        for _, arg in pairs(...) do
            output = output .. ', ' .. arg
        end
    end
    print('logging',_name, output)
end
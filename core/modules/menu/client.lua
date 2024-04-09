QBCorev2.Modules.Menu = {}

QBCorev2.Modules.Menu.Open = function(menuList)
    QBCorev2.Utils.ValidateArgs({menuList},{'table'}, function (success, err)
        if not success then
            error(err)
        end
    end)
    exports['qb-menu']:openMenu(menuList)
end

QBCorev2.Modules.Menu.Close = function()
    exports['qb-menu']:closeMenu()
end

QBCorev2.Modules.Menu.Header = function()
    exports['qb-menu']:showHeader()
end
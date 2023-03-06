local Events = {
    ["Craft"] = math.random(1000000, 9000000) .. "NH_CRAFTING:CRAFTWEAPON" .. math.random(1000000, 9000000)
}

ESX.RegisterServerCallback("nh_crafting:GetEvents", function(source, cb)
    cb(Events)
end)

RegisterServerEvent(Events["Craft"], function(weaponName)
    local src = source 
    local data = ESX.GetPlayerFromId(src)
    if (CanCraft(src, weaponName)[1]) then 
        for _, _data in pairs(Settings.Craftings[weaponName]["RequiredItems"]) do 
            data.removeInventoryItem(_, _data)
        end
        data.addInventoryWeapon(weaponName, Settings.Craftings[weaponName]["WeaponCount"], Settings.Craftings[weaponName]["Ammo"], false)
    else
        data.showNotification("~b~Nie posiadasz Wystarczającej ilości ~r~[" .. CanCraft(src, weaponName)[2] .. "]")
    end
end)

CanCraft = function(source, weaponName)
    local src = source 
    local data = ESX.GetPlayerFromId(src)

    for _, _data in pairs(Settings.Craftings[weaponName]["RequiredItems"]) do 
        if (data.getInventoryItem(_).count < _data) then 
            return {false, data.getInventoryItem(_).label}
        end
    end
    return {true}
end

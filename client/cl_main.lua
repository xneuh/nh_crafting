local Events = {}
local Ped = { ["Id"] = PlayerPedId(), ["Coords"] = GetEntityCoords(PlayerPedId()) }
-- Getting Event Names from Server-Side
-- Kinda protection aganist cheaters
CreateThread(function()
    ESX.TriggerServerCallback("nh_crafting:GetEvents", function(_Events)
        Events = _Events
    end)
end)

CreateThread(function()
    while (true) do 
        Wait(2500)
        Ped = {
            ["Id"] = PlayerPedId(),
            ["Coords"] = GetEntityCoords(Ped.Id)
        }
    end
end)

CreateThread(function()
    if (Settings.QTarget) then 
        for i=1, #Settings.CraftingPlace["QTarget"] do 
            exports['qtarget']:AddBoxZone("Crafting", Settings.CraftingPlace["QTarget"][i]["Position"], Settings.CraftingPlace["QTarget"][i]["BoxSize"][1], Settings.CraftingPlace["QTarget"][i]["BoxSize"][2], {
                name = "Crafting",
                heading = Settings.CraftingPlace["QTarget"][i]["UseDistance"],
                debugPoly = true,
                minZ = Settings.CraftingPlace["QTarget"][i]["minZ"],
                maxZ = Settings.CraftingPlace["QTarget"][i]["maxZ"],
            }, {
                options = {
                    {
                        type = "client",
                        event = "nh_crafting:OpenCrafting",
                        icon = Settings.CraftingPlace["QTarget"][i]["Icon"],
                        label = "Otwórz Crafting",
                    },
                },
                distance = Settings.CraftingPlace["QTarget"]["UseDistance"]
            })
        end
    else
        while (true) do 
            Wait(4)
            local distance = #(Ped.Coords - Settings.CraftingPlace["Marker"])
            if (distance <= 4) then 
                ESX.DrawMarker(Settings.CraftingPlace["Marker"])
                if (distance <= 1.75) then 
                    ESX.ShowHelpNotification("~INPUT_PICKUP~ aby otworzyć Crafting Broni")
                    if (IsControlJustReleased(0, 38)) then 
                        ShowNUI()
                    end
                end
            else
                Wait(2500)
            end
        end
    end
end)

RegisterNUICallback("CloseNUI", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("CraftWeapon", function(data)
    TriggerServerEvent(Events["Craft"], data.weapon)
    SetNuiFocus(false, false)
end)

RegisterNetEvent("nh_crafting:OpenCrafting", function()
    ShowNUI()
end)


ShowNUI = function()
    SendNUIMessage({
        action = "ShowNUI"
    })
    SetNuiFocus(true, true)
end
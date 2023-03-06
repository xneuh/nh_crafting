Settings = {}

Settings.QTarget = true
Settings.CraftingPlace = {
    ["Marker"] = vector3(1121.0433349609, -1450.1002197266, 35.666690826416),
    -- If Using QTarget just ignore code above
    ["QTarget"] = {
        ["UseDistance"] = 2.5,
        [1] = {
            ["Heading"] = 10,
            ["minZ"] = 33,
            ["maxZ"] = 35,
            ["Position"] = vector3(1119.3192138672, -1450.5173339844, 35.827201843262),
            ["BoxSize"] = {0.45, 0.35},
            ["Icon"] = "fas fa-sign-in-alt"
        }
    },
}
Settings.Craftings = {
    -- CONFIG EXAMPLE
    -- [WEAPON-NAME] = {
    --     ["RequiredItems"] = {
    --         ["ITEMNAME"] = ITEMCOUNT [DO NOT FORGET TO ADD ITEM TO YOUR DATABASE!]
    --     },
    --     ["Ammo"] = AMMO-COUNT,
    --     ["WeaponCount"] = WEAPON-COUNT
    -- },

    ["WEAPON_PISTOL"] = {
        ["RequiredItems"] = {
            ["bread"] = 1
        },
        ["Ammo"] = 100,
        ["WeaponCount"] = 1
    },
    ["WEAPON_SNSPISTOL_MK2"] = {
        ["RequiredItems"] = {
            ["bread"] = 1
        },
        ["Ammo"] = 100,
        ["WeaponCount"] = 1
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["RequiredItems"] = {
            ["bread"] = 1
        },
        ["Ammo"] = 100,
        ["WeaponCount"] = 1
    },
    ["WEAPON_COMBATPISTOL"] = {
        ["RequiredItems"] = {
            ["bread"] = 1
        },
        ["Ammo"] = 100,
        ["WeaponCount"] = 1
    }
}
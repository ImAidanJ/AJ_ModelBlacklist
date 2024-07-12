Config = {

VehicleBlacklist = true,     -- Enable or Disable Vehicle Blacklist (true or false)
PedBlacklist = true,         -- Enable or Disable Ped Blacklist (true or false)
WeaponBlacklist = true,      -- Enable or Disable Weapon Blacklist (true or false)

VehBlacklistMessage = "This vehicle has been restricted, Please find another one!!",     -- Message Displayed when vehicle is deleted
PedBlacklistMessage = "This ped has been restricted, Please find another one!!",         -- Message Displayed when ped is deleted
WepBlacklistMessage = "This weapon has been restricted, Please use another one!!",       -- Message Displayed when weapon is deleted

DefaultPed = "a_m_y_yoga_01", -- https://docs.fivem.net/docs/game-references/ped-models/

}

Config.Bypass = {

Bypass = true, -- Enable or disable AcePerm Bypass (true or false)

VehBypass = "AJ:VehBypass", -- This is your ACE Perm String. I suggest leaving it as is
PedBypass = "AJ:PedBypass", -- This is your ACE Perm String. I suggest leaving it as is
WepBypass = "AJ:WepBypass",  -- This is your ACE Perm String. I suggest leaving it as is

}

Config.VehBlacklist = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
    "akula",
    "alkonost",
    "alphaz1"
}

Config.PedBlacklist = { -- https://docs.fivem.net/docs/game-references/ped-models/
    "a_c_killerwhale",
    "a_c_sharkhammer"
}

Config.WepBlacklist = { -- https://vespura.com/fivem/weapons/stats/
    "weapon_autoshotgun",
    "weapon_bzgas",
    "weapon_compactlauncher",
    "weapon_grenade"
}
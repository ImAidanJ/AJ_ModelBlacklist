--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 

-- Function Variables --
local Prefix = Function.Prefix
local resourceName = Function.ResourceName
local version = Function.Version

-- Run Checks --
Citizen.CreateThread(function()
    checkName()
    debugCheck()
end)

-- Server Code --

RegisterServerEvent('checkPlayerBypass')
AddEventHandler('checkPlayerBypass', function()
    local src = source
    local vehBypass = Config.Bypass.Bypass and IsPlayerAceAllowed(src, Config.Bypass.VehBypass) or false
    local pedBypass = Config.Bypass.Bypass and IsPlayerAceAllowed(src, Config.Bypass.PedBypass) or false
    local wepBypass = Config.Bypass.Bypass and IsPlayerAceAllowed(src, Config.Bypass.WepBypass) or false

    TriggerClientEvent('receivePlayerBypass', src, vehBypass, pedBypass, wepBypass)
end)

-- Credits --
-- Don't be weird.. Leave my Credits!!
print(Prefix.." "..resourceName.." by ImAidanJ")
print(Prefix.." Current Version: "..version)
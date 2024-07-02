--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


function isWeaponRestricted(model)
    for _, RestrictedWeapon in pairs(Config.WepBlacklist) do
        if model == GetHashKey(RestrictedWeapon) then
            return true
        end
    end
    return false
end

if Config.WeaponBlacklist then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)

            local playerPed = GetPlayerPed(-1)

            if playerPed and not isPlayerBypassed(Config.Bypass.WepBypass) then
                local _, weapon = GetCurrentPedWeapon(playerPed, true)

                if isWeaponRestricted(weapon) then
                    RemoveWeaponFromPed(playerPed, weapon)
                    TriggerEvent("chat:addMessage", {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.WepBlacklistMessage}})
                end
            end
        end    
    end)
end
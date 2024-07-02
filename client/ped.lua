--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


function isPedRestricted(model)
    for _, restrictedPed in pairs(Config.PedBlacklist) do
        if model == GetHashKey(restrictedPed) then
            return true
        end
    end
    return false
end

if Config.PedBlacklist then
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        playerPed = GetPlayerPed(-1)
        if playerPed and not isPlayerBypassed(Config.Bypass.PedBypass) then
            playerModel = GetEntityModel(playerPed)

            if not priorPlayerModel then
                if isPedRestricted(playerModel) then
                    SetPlayerModel(PlayerId(), GetHashKey(Config.DefaultPed))
                else
                    priorPlayerModel = playerModel
                end
            else
                if isPedRestricted(playerModel) then
                    SetPlayerModel(PlayerId(), priorPlayerModel)
                    TriggerEvent("chat:addMessage", {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.PedBlacklistMessage}})
                end
                priorPlayerModel = playerModel
            end
        end
    end
end)
end
--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


function isVehBlacklisted(veh)
    local modelName = GetEntityModel(veh)
    local modelNameStr = string.lower(GetDisplayNameFromVehicleModel(modelName))

    for _, restrictedVeh in ipairs(Config.VehBlacklist) do
        if restrictedVeh == modelNameStr then
            return true
        end
    end
    return false
end

if Config.VehicleBlacklist then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
    
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    
            if veh and not isPlayerBypassed(Config.Bypass.VehBypass) then
                if isVehBlacklisted(veh) then
                    SetVehicleEngineHealth(veh, -5000)
                    TriggerEvent("chat:addMessage", {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(235, 21, 46, 0.6); border-radius: 3px;"><b>{0}</b></div>', args = {Config.VehBlacklistMessage}})
                    SetEntityAsMissionEntity(veh, true, true)
                    DeleteEntity(veh)
                end
            end
        end
    end)
end
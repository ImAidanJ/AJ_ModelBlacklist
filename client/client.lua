--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 

-- Functions --

function IsVehicleBlacklisted(vehicle)
    local modelName = GetEntityModel(vehicle)
    local modelString = string.lower(GetDisplayNameFromVehicleModel(modelName))

    for _, restrictedVeh in ipairs(Config.VehBlacklist) do
        if restrictedVeh == modelString then
            return true
        end
    end
    return false
end

function IsWeaponBlacklisted(weapon)
    for _, restrictedWep in pairs(Config.WepBlacklist) do
        if weapon == GetHashKey(restrictedWep) then
            return true
        end
    end
    return false
end

function IsPedBlacklisted(ped)
    for _, restrictedPed in pairs(Config.PedBlacklist) do
        if ped == GetHashKey(restrictedPed) then
            return true
        end
    end
    return false
end

-- Vehicle Blacklist --

if Config.VehicleBlacklist then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

            if vehicle and not Config.Bypass.VehBypass ~= true then
                if IsVehicleBlacklisted(vehicle) then
                    SetVehicleEngineHealth(vehicle, -5000)
                    TriggerEvent("chat:addMessage", {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(235, 21, 46, 0.6); border-radius: 3px;"><b>{0}</b></div>', args = {Config.VehBlacklistMessage}})
                    SetEntityAsMissionEntity(vehicle, true, true)
                    DeleteEntity(vehicle)
                end
            end
        end
    end)
end

-- Weapons Blacklist --

if Config.WeaponBlacklist then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            local playerPed = GetPlayerPed(-1)

            if playerPed and not Config.Bypass.WepBypass ~= true then
                local _, weapon = GetCurrentPedWeapon(playerPed, true)
                if IsWeaponBlacklisted(weapon) then
                    RemoveWeaponFromPed(playerPed, weapon)
                    TriggerEvent("chat:addMessage", {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.WepBlacklistMessage}})
                end
            end
    end)
end

-- Ped Blacklist --

if Config.PedBlacklist then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(500)
            local playerPed = GetPlayerPed(-1)

            if playerPed and not Config.Bypass.PedBypass ~= true then
                playerModel = GetEntityModel(playerPed)

                if not priorPlayerModel then
                    if IsPedBlacklisted(playerModel) then
                        SetPlayerModel(PlayerId(), GetHashKey(Config.DefaultPed))
                    else
                        priorPlayerModel = playerModel
                    end
                else
                    if IsPedBlacklisted(playerModel) then
                        SetPlayerModel(PlayerId(), priorPlayerModel)
                        TriggerEvent("chat:addMessage", {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {Config.PedBlacklistMessage}})
                    end
                    priorPlayerModel = playerModel
                end
            end
        end
    end)
end
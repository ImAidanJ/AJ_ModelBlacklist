--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


function isPlayerBypassed(bypassType)
    if Config.Bypass and Config.Bypass[bypassType] and Config.Bypass.Enabled then
        return IsPlayerAceAllowed(PlayerId(), Config.Bypass[bypassType])
    end
    return false
end
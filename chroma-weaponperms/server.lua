local function GetWeaponName(hash)
    for name, _ in pairs(Config.Weapons) do
        if GetHashKey(name) == hash then
            return name
        end
    end
    return nil
end

lib.callback.register("WeaponRestrict:CheckPerms", function(source, hash)
    local src = source
    local weaponName = GetWeaponName(hash)

    if IsPlayerAceAllowed(src, Config.BypassPermission) then
        return { allowed = true }
    end

    if weaponName and Config.Weapons[weaponName] then
        local weaponConfig = Config.Weapons[weaponName]
        return {
            allowed = IsPlayerAceAllowed(src, weaponConfig.Ace),
            message = weaponConfig.Message or Config.DefaultMessage
        }
    else
        return {
            allowed = Config.AllowByDefault,
            message = Config.DefaultMessage
        }
    end
end)
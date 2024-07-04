local unarmed = GetHashKey("weapon_unarmed")

local function Disarm(data)
    SetCurrentPedWeapon(cache.ped, unarmed, true)
    RemoveWeaponFromPed(cache.ped, data.hash)
    lib.notify({
        id = "weapon_restricted",
        type = "error",
        title = "Weapon Restricted",
        description = data.message,
        position = Config.NotifyPosition,
        duration = 3000
    })
end

local cached = {
    hash = 0,
    message = nil,
    allowed = false
}

lib.onCache("weapon", function(value)
    if not value then return end

    if cached.hash ~= value then
        local success, data = pcall(function()
            return lib.callback.await("WeaponRestrict:CheckPerms", false, value)
        end)
        
        if not success or not data then
            print("Error checking weapon permissions:", data)
            return
        end

        cached = {
            hash = value,
            message = data.message,
            allowed = data.allowed
        }
    end

    if not cached.allowed then
        Disarm(cached)
    end
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started on the client')
end)

AddEventHandler('onClientResourceStop', function(resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started on the client')
end)
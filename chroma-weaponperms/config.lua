Config = {
    -- If true, all weapons not listed below will be allowed by default
    AllowByDefault = true,

    -- Players with this permission can use all weapons, regardless of restrictions
    BypassPermission = "weapon.masterkey",

    -- Default message shown when a weapon is restricted
    DefaultMessage = "This weapon is restricted!",
    
    -- Position?: 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left' ?
    NotifyPosition = "center-right", 

    -- Weapon-specific restrictions
    -- Format: 
    -- WEAPON_NAME = {
    --     Ace = "required.permission",
    --     Message = "Optional custom message"
    -- }
    Weapons = {
        WEAPON_MARKSMANRIFLE = {
            Ace = "weapon.marksmanrifle",
            Message = "This weapon is included with our sniper package!\n\nHead to our store to get it!"
        },
        WEAPON_CARBINERIFLE = {
            Ace = "weapon.carbinerifle"
            -- This weapon will use the DefaultMessage
        }
    }
}
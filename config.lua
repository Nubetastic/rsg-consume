return {

    Consumables = {
        Eat = { -- default food items
            ['bread'] = {
                item = 'bread',
                hunger = 50,
                thirst = 0,
                stress = 0,
                alcohol = -10,
                propname = 'p_bread_14_ab_s_a',
                poison = 0,
                poisonRate = 0,
            },
            ['bag_candy'] = {
                item = 'bag_candy',
                hunger = 10,
                thirst = -5,
                stress = 15,
                propname = '',
                poison = 0,
                poisonRate = 0,
            },
            ['beef_jerky'] = {
                item = 'beef_jerky',
                hunger = 50,
                thirst = -10,
                stress = 0,
                propname = 'p_meatchunk_sm02x',
                poison = 0,
                poisonRate = 0,
            },
            ['chocolate_bar'] = {
                item = 'chocolate_bar',
                hunger = 10,
                thirst = -5,
                stress = 20,
                propname = 's_chocolatebar01x',
                poison = 0,
                poisonRate = 0,
            },  
        },
        Drink = { -- default drink items
            ['water'] = {
                item = 'water',
                hunger = 0,
                thirst = 40,
                stress = 0,
                alcohol = -5,
                propname = 'p_water01x'
            },
            ['beer'] = {
                item = 'beer',
                hunger = -3,
                thirst = 25,
                stress = -10,
                alcohol = 20,
                propname = 'p_bottlebeer01a',
            },
            ['whiskey'] = {
                item = 'whiskey',
                hunger = -5,
                thirst = 20,
                stress = -15,
                alcohol = 35,
                propname = 's_inv_whiskey01x',
            },
        },
        Stew = { -- default stew items
            ['beef_stew'] = {
                item = 'beef_stew',
                hunger = 60,
                thirst = 25,
                stress = 0,
                alcohol = -10,
                propname = 'p_bowl04x_stew'
            },
            ['fish_stew'] = {
                item = 'fish_stew',
                hunger = 60,
                thirst = 25,
                stress = 0,
                alcohol = -10,
                propname = 'p_fishstew01x'
            },
        },
        Hotdrinks = { -- default hot drink items
            ['coffee'] = {
                item = 'coffee',
                hunger = 0,
                thirst = 25,
                stress = 20,
                alcohol = -15,
                -- Fixed: Added a propname for the coffee item
                propname = 'p_mug01_coffee'
            },
        },
        Eatcanned = { -- canned food items
            ['canned_apricots'] = {
                item = 'canned_apricots',
                hunger = 40,
                thirst = 20,
                stress = 0,
                propname = 's_canrigapricots01x',
            },
            ['canned_peaches'] = {
                item = 'canned_peaches',
                hunger = 40,
                thirst = 20,
                stress = 0,
                propname = 's_canpeaches01x',
            },
            ['canned_pineapples'] = {
                item = 'canned_pineapples',
                hunger = 40,
                thirst = 20,
                stress = 0,
                propname = 's_canpineapple01x',
            },
            ['canned_beans'] = {
                item = 'canned_beans',
                hunger = 60,
                thirst = 0,
                stress = 0,
                propname = 's_canbeans01x',
            },
        },
        Smoke = {
            ['cigar'] = {
                item = 'cigar',
                hunger = 0,
                thirst = 0,
                stress = -10,
                propname = 'p_cigar01x',
            },
            ['cigarette'] = {
                item = 'cigarette',
                hunger = 0,
                thirst = 0,
                stress = -20,
                propname = 'p_cigarette_cs02x',
            },
        },
    },

    -- AlcoholSystem Configuration
    AlcoholSystem = {
        DrunkThreshold = 50,      -- Threshold to be considered drunk
        PassOutThreshold = 200,   -- Threshold to pass out
        WakeUpLevel = 55,         -- Alcohol level upon waking up (just below the drunk threshold)
        DecreaseAmount = 1,       -- Points removed per cycle
        DecreaseInterval = 5000,  -- Decrement interval (in ms)
        MaxAlcoholLevel = 500,    -- Maximum alcohol level (safety)
    },

    AlcoholEffects = {
        -- Visual Effects Configuration
        DrunkEffect = true,                      -- Enable or disable the drunk post-fx effect
        DrunkEffectName = "PlayerDrunkSaloon1",       -- The name of the visual effect for being drunk
        PassOutEffect = "PlayerDrunk01_PassOut", -- The name of the visual effect for passing out
        WakeUpEffect = "PlayerWakeUpDrunk",      -- The name of the visual effect for waking up
        GroggyEffectName = "PlayerHealthPoorCS", -- The visual effect for the hangover/groggy state

        -- Timings & Durations (in milliseconds)
        GroggyDuration = 15000,                  -- How long the hangover state lasts after waking up (ms)
        VomitDuration = 10000,                   -- How long the vomit animation plays (ms)
        SleepDuration = 20000,                   -- How long the character sleeps on the ground (ms)
        FadeOutDuration = 10000,                 -- Duration of the screen fading to black (ms)
        FadeInDuration = 10000,                  -- Duration of the screen fading back in (ms)

        -- Notifications (Translated to English)
        DrunkNotification = {
            title = '🍺 Drunk',
            description = 'You start feeling tipsy...',
            type = 'inform',
            duration = 3000,
            position = 'top-right'
        },
        PassOutNotification = {
            title = '💀 Feeling Unwell',
            description = 'You don’t feel so good...',
            type = 'error',
            duration = 5000,
            position = 'top-right'
        },
        WakeUpNotification = {
            title = '🤕 Rough Awakening',
            description = 'You wake up with a terrible headache...',
            type = 'inform',
            duration = 5000,
            position = 'top-right'
        },
        SoberNotification = {
            title = '✨ Recovered',
            description = 'You feel clear-headed again.',
            type = 'success',
            duration = 2000,
            position = 'top-right'
        }
    }
}

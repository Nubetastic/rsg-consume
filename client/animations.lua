local M = {}

local function playCigaretteAnimation(ped, propName, isMale)
    local coords = GetEntityCoords(ped)
    local rightHandBone = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")
    local mouthBone = GetEntityBoneIndexByName(ped, "skel_head")
    local hashItem = GetHashKey(propName)
    local smokeProp = CreateObject(hashItem, coords.x, coords.y, coords.z, true, true, false)
    AttachEntityToEntity(smokeProp, ped, mouthBone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

    if isMale then
        local enterDict = "amb_rest@world_human_smoking@male_c@stand_enter"
        RequestAnimDict(enterDict)
        while not HasAnimDictLoaded(enterDict) do Wait(0) end
        TaskPlayAnim(ped, enterDict, "enter_back_rf", 1.0, 8.0, 5400, 0, 0.0, false, false, false)
        Wait(1000)
        AttachEntityToEntity(smokeProp, ped, rightHandBone, 0.03, -0.01, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
        Wait(1000)
        AttachEntityToEntity(smokeProp, ped, mouthBone, -0.017, 0.1, -0.01, 0.0, 90.0, -90.0, true, true, false, true, 1, true)
        Wait(3000)
        AttachEntityToEntity(smokeProp, ped, rightHandBone, 0.017, -0.01, -0.01, 0.0, 120.0, 10.0, true, true, false, true, 1, true)
        Wait(1000)
        local baseDict = "amb_rest@world_human_smoking@male_c@base"
        RequestAnimDict(baseDict)
        while not HasAnimDictLoaded(baseDict) do Wait(0) end
        TaskPlayAnim(ped, baseDict, "base", 1.0, 8.0, -1, 31, 0.0, false, false, false)
        RemoveAnimDict(enterDict)
        local smokingTime = 0
        while IsEntityPlayingAnim(ped, baseDict, "base", 3) and smokingTime < 15000 do
            Wait(500)
            smokingTime = smokingTime + 500
        end
        RemoveAnimDict(baseDict)
    else
        local dict = "amb_rest@world_human_smoking@female_c@base"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do Wait(0) end
        AttachEntityToEntity(smokeProp, ped, rightHandBone, 0.01, 0.0, 0.01, 0.0, -160.0, -130.0, true, true, false, true, 1, true)
        TaskPlayAnim(ped, dict, "base", 1.0, 8.0, -1, 31, 0.0, false, false, false)
        local smokingTime = 0
        while IsEntityPlayingAnim(ped, dict, "base", 3) and smokingTime < 15000 do
            Wait(500)
            smokingTime = smokingTime + 100
        end
        RemoveAnimDict(dict)
    end

    DeleteObject(smokeProp)
    ClearPedSecondaryTask(ped)
    ClearPedTasks(ped)
end

local function playCigarAnimation(ped, propName)
    local coords = GetEntityCoords(ped)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local dict = "amb_rest@world_human_smoke_cigar@male_a@idle_b"
    local anim = "idle_d"
    local hashItem = GetHashKey(propName)
    local smokeProp = CreateObject(hashItem, coords.x, coords.y, coords.z, true, true, false)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    AttachEntityToEntity(smokeProp, ped, boneIndex, 0.01, -0.005, 0.0155, 0.024, 300.0, -40.0, true, true, false, true, 1, true)
    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 31, 0.0, false, false, false)
    local smokingTime = 0
    while smokingTime < 20000 do
        if not IsEntityPlayingAnim(ped, dict, anim, 3) then
            TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 31, 0.0, false, false, false)
        end
        Wait(500)
        smokingTime = smokingTime + 500
    end
    DeleteObject(smokeProp)
    ClearPedSecondaryTask(ped)
    RemoveAnimDict(dict)
end

function M.playSmoke(propName)
    local ped = cache and cache.ped or PlayerPedId()
    local isMale = IsPedMale(ped)
    if not propName or propName == "" then
        local dict = isMale and "amb_rest@world_human_smoking@male_a@base" or "amb_rest@world_human_smoking@female_a@base"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do Wait(0) end
        TaskPlayAnim(ped, dict, "base", 1.0, 8.0, 8000, 31, 0.0, false, false, false)
        Wait(8000)
        ClearPedSecondaryTask(ped)
        RemoveAnimDict(dict)
        return
    end
    local propHash = GetHashKey(propName)
    local isCigar = (propHash == GetHashKey("p_cigar01x"))
    if isCigar then
        playCigarAnimation(ped, propName)
    else
        playCigaretteAnimation(ped, propName, isMale)
    end
end

return M

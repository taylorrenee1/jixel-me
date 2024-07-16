local isDisplaying = {}

local function HideMe(source, index)
    isDisplaying[source][index] = nil
    SendNUIMessage({
        id = source .. index,
        toggle = false
    })
end

local function DrawMes(source, prefix, text, icon)
    local playerId = GetPlayerFromServerId(source)
    if playerId ~= -1 or source == GetPlayerServerId(PlayerId()) then
        if not isDisplaying[source] then isDisplaying[source] = {} end
        for k, _ in pairs(isDisplaying[source]) do
            isDisplaying[source][k] = false
        end

        local index = math.random(1, 100)
        while isDisplaying[source][index] do
            index = math.random(1, 100)
        end
        isDisplaying[source][index] = true
        if not icon then icon = 'icons' end
        CreateThread(function()
            CreateThread(function()
                Wait(Config.Duration)
                if not isDisplaying[source][index] then return end
                isDisplaying[source][index] = false
            end)
            while isDisplaying[source][index] do
                Wait(0)
                local htmlString = ""
                local sourceCoords = GetEntityCoords(GetPlayerPed(playerId))
                local nearCoords = GetEntityCoords(PlayerPedId())
                if #(sourceCoords - nearCoords) < 7.0 then
                    local onScreen, xxx, yyy =
                        GetHudScreenPositionFromWorldPosition(
                            sourceCoords.x + Config.CoordsX,
                            sourceCoords.y + Config.CoordsY,
                            sourceCoords.z + Config.CoordsZ)
                    htmlString =
                        htmlString ..
                        '<span style="position: absolute; left: ' ..
                        xxx * 100 ..
                        "%;top: " .. yyy * 100 .. '%;"><div class="me-container '..string.lower(prefix)..'-container"><div class="text-container"><div class="icon-container "><i class="fas fa-'..icon..'"></i></div><b class="prefix">'..prefix..': </b>' .. text .. "</div></div></span>"
                end
                if lasthtmlString ~= htmlString then
                    SendNUIMessage({
                        id = source .. index,
                        toggle = true,
                        html = htmlString
                    })
                    lasthtmlString = htmlString
                end
            end
            HideMe(source, index)
        end)
    end
end

RegisterNetEvent("jixel-me:me")
AddEventHandler("jixel-me:me", function(text, source)
    DrawMes(source, "ME", text, "slash")
end)


RegisterNetEvent("jixel-me:do")
AddEventHandler("jixel-me:do", function(text, source)
    DrawMes(source, "DO", text, "bolt")
end)

RegisterNetEvent("jixel-me:signlanguage")
    AddEventHandler("jixel-me:signlanguage", function(text, source)
        DrawMes(source, "SIGNS", text, "hands-asl-interpreting")
    end)

RegisterNetEvent("jixel-me:med")
AddEventHandler("jixel-me:med", function(text, source)
    DrawMes(source, "MED", text,"hand-holding-medical")
end)

RegisterNetEvent("jixel-me:action")
AddEventHandler("jixel-me:action", function(text, source)
    DrawMes(source, "Action", text,"person-running")
end)

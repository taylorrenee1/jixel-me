local QBCore = exports['qb-core']:GetCoreObject()

local function SendToDiscord(webhook, meType, message)
    local embed = {
        {
            ["color"] = 16777215,
            ["title"] = "Jixel-ME",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Jixel-ME",
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "Jixel-ME", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

local function LogMe(source, meType, message)
    local Player = QBCore.Functions.GetPlayer(source)
    local citizenid = Player.PlayerData.citizenid
    if Config.LogMessages then
        if Config.Logger == "loki" then
            lib.logger(Player.PlayerData.source, meType, ('%s(CitizenID: %s | ID: %s) /%s %s'):format(GetPlayerName(source), citizenid, source, meType, message))
        else
            SendToDiscord(Config.Webhook, meType, ('%s(CitizenID: %s | ID: %s) /%s %s'):format(GetPlayerName(source), citizenid, source, meType, message))
        end
    end
end

RegisterCommand("me", function(source , args, rawCommand)
    local text = table.concat(args, ' ')
    text = string.sub(text,1,Config.MaxLength)
    TriggerClientEvent('jixel-me:me', -1, text, source)
    LogMe(source, 'me', text)
end, false)

RegisterCommand("do", function(source , args, rawCommand)
    local text = table.concat(args, ' ')
    text = string.sub(text,1,Config.MaxLength)
    TriggerClientEvent('jixel-me:do', -1, text, source)
    LogMe(source, 'do', text)
end, false)

RegisterCommand("med", function(source , args, rawCommand)
    local text = table.concat(args, ' ')
    text = string.sub(text,1,Config.MaxLength)
    TriggerClientEvent('jixel-me:med', -1, text, source)
    LogMe(source, 'med', text)
end, false)

RegisterCommand("sign", function(source , args, rawCommand)
    local text = table.concat(args, ' ')
    text = string.sub(text,1,Config.MaxLength)
    TriggerClientEvent('jixel-me:signlanguage', -1, text, source)
    LogMe(source, 'sign', text)
end, false)

RegisterCommand("action", function(source , args, rawCommand)
    local text = table.concat(args, ' ')
    text = string.sub(text,1,Config.MaxLength)
    TriggerClientEvent('jixel-me:action', -1, text, source)
    LogMe(source, 'action', text)
end, false)
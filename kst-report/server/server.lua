local Framework = Config.Framework



if Framework == 'VRP' then
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "kst-report") 
vRP = Proxy.getInterface("vRP")
elseif Framework == 'ESX' then
    local ESX = exports['es_extended']:getSharedObject()
end


RegisterNetEvent('SendInfoToServer', function(input)
    if Framework == 'VRP' then
    local source = source
    local user_id = vRP.getUserId({source})
    SendToDiscord(16753920, "Kstore-log", 'id: ' ..user_id.. ' sendte en report: ' ..input, "Made by Kstore - K1anTheDev", Config.Webhook)
    elseif Framework == 'ESX' then
        local source = source
        -- local user_id = ESX.GetPlayerFromId(source)
        local steam = GetPlayerName(PlayerId())
        SendToDiscord(16753920, "Kstore-log", 'steam navn: ' ..steam.. ' sendte en report: ' ..input, "Made by Kstore - K1anTheDev", Config.Webhook)
    end
end)

function SendToDiscord(color, name, message, footer, webhook)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",   
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

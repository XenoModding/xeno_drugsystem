-- Server-seitige Logik
-- Analog: Implementieren für ESX/QBCore
debugPrint('removeItemFromPlayer', source, item, count)
TriggerClientEvent('drugsystem:notify', source, ('Item entfernt: %s x%d'):format(item, count))
end


local function getItemCount(source, item)
-- Placeholder: sollte die echte Anzahl zurückgeben
-- Wenn ihr ESX habt, holt xPlayer.getInventoryItem(item).count
return 0
end


-- Event: Sammeln abgeschlossen
RegisterNetEvent('drugsystem:server:giveRaw', function()
local src = source
addItemToPlayer(src, Config.Items.rawHerb, 1)
end)


-- Event: Verarbeiten
RegisterNetEvent('drugsystem:server:process', function()
local src = source
-- Überprüfe ob Spieler genug Rohmaterial hat (TODO: anpassen)
local have = getItemCount(src, Config.Items.rawHerb)
if have <= 0 then
TriggerClientEvent('drugsystem:notify', src, 'Du hast kein Rohmaterial zum Verarbeiten.')
return
end


-- Entferne Rohmaterial, gib fertiges Produkt
removeItemFromPlayer(src, Config.Items.rawHerb, 1)
addItemToPlayer(src, Config.Items.processedDrug, 1)
end)


-- Event: Verkaufen
RegisterNetEvent('drugsystem:server:sell', function(amount)
local src = source
amount = tonumber(amount) or 1
local have = getItemCount(src, Config.Items.processedDrug)
if have < amount then
TriggerClientEvent('drugsystem:notify', src, 'Nicht genug Waren zum Verkaufen.')
return
end


-- Entferne Items, gib Geld (auch an euer Economy-System anpassen)
removeItemFromPlayer(src, Config.Items.processedDrug, amount)
local gained = 0
for i=1, amount do
gained = gained + math.random(Config.Prices.sellMin, Config.Prices.sellMax)
end


-- Payment: anpassen für ESX/QBCore
-- ESX Beispiel: xPlayer.addMoney(gained)
TriggerClientEvent('drugsystem:notify', src, ('Du hast %s$ erhalten.'):format(gained))
end)


-- Optional: Command zum Debuggen
RegisterCommand('drugsysdebug', function(source, args)
if source == 0 then
print('Debug Info:')
for k,v in pairs(Config) do print(k,v) end
end
end)
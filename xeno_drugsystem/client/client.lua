-- Client-seitige Logik


local function Draw3DText(x,y,z,text)
-- Einfacher 3D Text
local onScreen,_x,_y=World3dToScreen2d(x,y,z)
local px,py,pz = table.unpack(GetGameplayCamCoords())
SetTextScale(0.35, 0.35)
SetTextFont(4)
SetTextProportional(1)
SetTextEntry("STRING")
SetTextCentre(1)
AddTextComponentString(text)
DrawText(_x,_y)
end


Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
playerPed = PlayerPedId()
local pcoords = GetEntityCoords(playerPed)


-- Gather Zone
local gz = Config.Zones.HerbField
local dist = #(pcoords - vec3(gz.x, gz.y, gz.z))
if dist < Config.ZoneRadius then
Draw3DText(gz.x, gz.y, gz.z + 1.0, '[E] Sammeln')
if dist < 1.5 and IsControlJustReleased(0, 38) then -- E
-- Sammelaktion
local start = GetGameTimer()
TriggerEvent('drugsystem:client:progress', Config.Times.gather, 'Sammeln...')
Citizen.Wait(Config.Times.gather)
TriggerServerEvent('drugsystem:server:giveRaw')
end
end


-- Process Zone
local pz = Config.Zones.ProcessLab
local dist2 = #(pcoords - vec3(pz.x, pz.y, pz.z))
if dist2 < Config.ZoneRadius then
Draw3DText(pz.x, pz.y, pz.z + 1.0, '[E] Verarbeiten')
if dist2 < 1.5 and IsControlJustReleased(0, 38) then
TriggerEvent('drugsystem:client:progress', Config.Times.process, 'Verarbeiten...')
Citizen.Wait(Config.Times.process)
TriggerServerEvent('drugsystem:server:process')
end
end


-- Dealer Zone
local dz = Config.Zones.Dealer
local dist3 = #(pcoords - vec3(dz.x, dz.y, dz.z))
if dist3 < Config.ZoneRadius then
Draw3DText(dz.x, dz.y, dz.z + 1.0, '[E] Verkaufen')
if dist3 < 1.5 and IsControlJustReleased(0, 38) then
TriggerEvent('drugsystem:client:progress', Config.Times.sell, 'Verkaufen...')
Citizen.Wait(Config.Times.sell)
TriggerServerEvent('drugsystem:server:sell', 1)
end
end
end
end)


-- Einfacher Progress Event (kann durch ein Progressbar-Resource ersetzt werden)
RegisterNetEvent('drugsystem:client:progress', function(time, text)
local start = GetGameTimer()
local ped = PlayerPedId()
FreezeEntityPosition(ped, true)
-- Simple Warte-Feedback
local t = 0
while GetGameTimer() - start < time do
Citizen.Wait(100)
t = GetGameTimer() - start
-- optional: Zeichne UI-Prozent
end
FreezeEntityPosition(ped, false)
end)


-- Notification (einfach)
RegisterNetEvent('drugsystem:notify', function(msg)
-- Nutzt Standard Notification
SetNotificationTextEntry('STRING')
AddTextComponentString(msg)
DrawNotification(false, false)
end)
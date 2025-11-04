-- Konfiguration des Drogen-Systems
Config = {}


-- Marker-/Interaktionspositionen
Config.Zones = {
HerbField = { x = 2224.0, y = 5577.0, z = 53.7 }, -- Beispiel: Kräuter sammeln
ProcessLab = { x = 1868.0, y = 3687.0, z = 34.3 }, -- Verarbeiten
Dealer = { x = -1197.0, y = -1567.0, z = 4.6 } -- Verkaufen
}


-- Items (Namen, die in eurem Inventory existieren sollten)
Config.Items = {
rawHerb = 'raw_herb',
processedDrug = 'processed_drug',
}


-- Zeiten in ms
Config.Times = {
gather = 7000,
process = 10000,
sell = 3000,
}


-- Preise
Config.Prices = {
sellMin = 150,
sellMax = 300,
}


-- Anti-abuse: Abstand zur Zone
Config.ZoneRadius = 10.0


-- Debug
Config.Debug = false
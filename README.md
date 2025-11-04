FiveM Drogen-System – README
📦 Übersicht

Dieses Resource fügt deinem FiveM-Server ein vollständiges Drogen-System hinzu. Spieler können Drogen sammeln, verarbeiten und anschließend an einem Dealer verkaufen. Das System ist modular aufgebaut und kann leicht an ESX oder QBCore angepasst werden.

⚙️ Installation

Lade alle Dateien dieses Projekts herunter.

Lege sie in deinen Server unter resources/[local]/drugsystem.

Öffne deine server.cfg und füge folgende Zeile hinzu:

start drugsystem

Passe die Konfiguration in config.lua an — insbesondere die Positionen der Zonen und die Itemnamen, die zu deinem Framework passen.

Implementiere in server.lua die Inventory- und Geld-Funktionen passend zu deinem Framework (siehe unten).

🧩 Framework-Integration
ESX
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.addInventoryItem('processed_drug', 1)

Zum Entfernen:

xPlayer.removeInventoryItem('processed_drug', 1)

Geld geben:

xPlayer.addMoney(gained)
QBCore
local Player = QBCore.Functions.GetPlayer(source)
Player.Functions.AddItem('processed_drug', 1)

Zum Entfernen:

Player.Functions.RemoveItem('processed_drug', 1)

Geld geben:

Player.Functions.AddMoney('cash', gained)
🗺️ Zonen

In config.lua kannst du die Positionen der Sammel-, Verarbeitungs- und Verkaufszonen festlegen:

Config.Zones = {
    HerbField = { x = 2224.0, y = 5577.0, z = 53.7 },
    ProcessLab = { x = 1868.0, y = 3687.0, z = 34.3 },
    Dealer = { x = -1197.0, y = -1567.0, z = 4.6 }
}
💰 Preise & Zeiten

In derselben Datei kannst du Bearbeitungszeiten und Verkaufswerte anpassen:

Config.Times = {
    gather = 7000, -- Zeit zum Sammeln (ms)
    process = 10000, -- Zeit zum Verarbeiten (ms)
    sell = 3000 -- Zeit zum Verkaufen (ms)
}


Config.Prices = {
    sellMin = 150,
    sellMax = 300
}
🧠 Funktionsweise

Spieler begeben sich zu den definierten Sammelpunkten.

Mit E wird das Sammeln gestartet (es dauert einige Sekunden).

Nach Abschluss erhalten sie ein Rohmaterial (z. B. raw_herb).

An der Verarbeitungsstation kann dieses in das Endprodukt (processed_drug) umgewandelt werden.

Beim Dealer können fertige Produkte gegen Bargeld verkauft werden.

🔧 Debug & Erweiterung

Aktiviere Debug-Ausgaben in config.lua mit Config.Debug = true.

Erweiterungsideen:

Zufällige Sammelpunkte.

Polizei-Warnungen beim Verkauf.

Minigames beim Verarbeiten.

Abhängigkeiten von Skills oder Gegenständen.

🧾 Credits

Version: 1.0.0
Lizenz: Frei nutzbar für nicht-kommerzielle Serverprojekte.

❤️ Support & Anpassung

Wenn du möchtest, kann ich dir helfen, das System direkt für dein Framework (ESX/QBCore) oder dein Inventory-Script (z. B. ox_inventory) zu konfigurieren. Sag mir einfach, welches du nutzt, und ich passe den Code an.

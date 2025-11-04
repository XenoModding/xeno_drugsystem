# 💊 Xeno-DrugSystem

Ein modernes und realistisches **Drogen-System für FiveM**, entwickelt von **Xeno Modding**.
Dieses Script bringt ein dynamisches, immersives Drogenerlebnis auf deinen Server – perfekt für **Roleplay, Wirtschaft und Crime-Gameplay**.

---

## 🚀 Funktionen

🌿 **Sammeln, Verarbeiten & Verkaufen** – Komplettes System vom Anbau bis zum Verkauf.
⚗️ **Konfigurierbare Produktionsketten** – Leicht anpassbare Zeiten, Items und Preise.
🗺️ **Zonen-System** – Definiere Sammel-, Verarbeitungs- und Verkaufszonen mit Koordinaten.
💬 **Benachrichtigungssystem** – Integrierte Notifications für alle Spieleraktionen.
🧩 **Framework-kompatibel** – Einfach mit **ESX** oder **QBCore** integrierbar.
⚙️ **Leicht konfigurierbar & erweiterbar** – Perfekt anpassbar für deinen Serverstil.

---

## 🧠 Installation

1. Lade den Ordner **`xeno_drugsystem`** herunter.
2. Platziere ihn im `resources`-Ordner deines Servers.
3. Füge folgende Zeile in deine **`server.cfg`** ein:

   ```cfg
   start xeno_drugsystem
   ```
4. Starte deinen Server neu – fertig! ✅

---

## ⚙️ Konfiguration

Alle Einstellungen findest du in der Datei `config.lua`:

* **Zonen** (Sammeln, Verarbeiten, Dealer-Positionen)
* **Items** (Rohstoffe & verarbeitete Produkte)
* **Zeiten** (Sammel-, Verarbeitungs-, Verkaufsdauer)
* **Preise** (Min./Max. Verkaufspreise)

Beispiel:

```lua
Config.Zones = {
    HerbField = { x = 2224.0, y = 5577.0, z = 53.7 },
    ProcessLab = { x = 1868.0, y = 3687.0, z = 34.3 },
    Dealer = { x = -1197.0, y = -1567.0, z = 4.6 }
}
```

---

## 🧩 Framework-Integration

Das Script ist **framework-agnostisch** aufgebaut – du kannst es leicht an **ESX** oder **QBCore** anpassen.

### ESX Beispiel

```lua
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.addInventoryItem('processed_drug', 1)
```

### QBCore Beispiel

```lua
local Player = QBCore.Functions.GetPlayer(source)
Player.Functions.AddItem('processed_drug', 1)
```

---

## 🔧 Erweiterungen

💡 Ideen für zukünftige Updates oder eigene Anpassungen:

* 🔀 Zufällige Sammelpunkte
* 🚓 Polizei-Benachrichtigung bei Verkäufen
* 🧬 Drogenqualität & Risiko-System
* 🕹️ Minigames beim Verarbeiten
* 📦 Integration mit `ox_inventory` oder anderen Inventar-Systemen

---

## 👤 Entwickler

**Xeno Modding**
🔗 Discord: [discord.gg/FYAVUQP9JW](https://discord.gg/FYAVUQP9JW)
💻 GitHub: [github.com/XenoModding](https://github.com/XenoModding)

---

## 📄 Lizenz

Dieses Script ist **frei verwendbar**.
Du darfst es auf deinem Server **nutzen, anpassen oder erweitern** – Credits an **Xeno Modding** sind **willkommen, aber nicht erforderlich**. ❤️

---

## 💡 Unterstützung

Für Fragen, Vorschläge oder Bug-Reports:
📬 Erstelle ein Issue auf GitHub oder kontaktiere uns direkt über **Discord**.

---

✨ **Viel Spaß mit *xeno_drugsystem* – entwickelt mit Leidenschaft von

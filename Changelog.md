### 0.14
* All: Client-sorting can now sort in reverse!
  * Added option for reverse sorting, both for client-sorting and server-sorting (Blizzard hid this option for no clear reason).
* Fixed issues reported with the new taint-free frame display system:
  * Mists, Retail: Adressed issue that caused the default blizzard code to lag in specific game interactions.
  * Classic: The default blizzard bags now scale with the UI scaling setting appropriately.

### 0.13
* Entirely retooled Bagnonium's internal frame display logic, which required an update since the Dragonflight UI rework. You might some notice some differences:
  * The system now runs entirely-taint free, potentially making "Action Blocked" errors less likely to occur.
  * The display events settings now apply to a broader range of NPCs (ex: disabling display at the bank will also disable it at the warbound bank chest).
  * Fixed issues with disabling display events (ex: inability to not show the inventory at the mailbox if the user choses), which could not be fixed in the old system.
* Retail: Shift-right click will now fallback to a normal right click when warband bank is not available.
* Classic: Hotfixed error message introduced last version.
* Classic: Improved calculation of keyring size.

### 0.12
* Retail: Fixed error message that would appear on startup, introduced by last build (ups).
* All: Added slash command which can be used to reset the addon settings and clear the cache.

### 0.11
* Classic: Fixed error that would appear when unlocking the keyring on a character for the first time.

### 0.10
* All: Now uses the first available filter on login when the "All" tab is disabled.
* Retail: Bank deposit button now appears and behaves as expected again.
* Retail: Bank server-side sorting now behaves as expected again.
* Retail: Money is once again showed correctly within each frame.

### 0.9
* Retail: Now gracefully handles Blizzard having deleted a font from the game.

### 0.8
* Classic, Mists: fixed issue with right-clicking items introduced in the last update.

### 0.7
* Retail: Updated for patch 11.2.
* Retail: You can once again buy bank bag slots within the addon, without being blocked by the game.
* Mists: Color settings for bag types such as inscription or jewelcrafting are now available.
* Classic: Added prebuilt filters for ammo bags, soul bags and the keyring.

### 0.6
* Moved back to a full addon-based event handling, as Blizzard's event registry is prone to event loss (thank you to the dev community for all the suggestions).

### 0.5
* The filters editor help button now directs to a new instructional video (https://youtu.be/sie39ZW8uZo).
* Hotfixed an issue in blizzard's event code.

### 0.4
* Fixed issue with item pre-click logic on Mists servers.
* Fixed issue in the guild bank causing the latest messages in the log to be hidden.
* Bagnon Config now loads apropriately in Mists of Pandaria servers.
* The guild bank logs are now scrollable.

### 0.3
* Now supports Mists of Pandaria servers.
  * PLease do not submit bugs related to void storage. The blizzard beta servers are acting very weird on the storage, addons or not.
* Updated chinese localization.
* Fixed bug in character favoriting system.

### 0.2
* Tagging release.
* Fixed bug preventing startup of the databroker plugin.
* Guilds are now also stacked into a scrollable submenu when too many are listed.

### 0.1 (beta)
* Fixed bug preventing custom search filters from filtering.
* Characters from the current server group are now sorted before others by default.
* Offline view menu rework:
  * You can now favorite characters. Favorited characters take priority over all others.
  * If too many characters are present, additional characters will be shown in a scrollable overflow menu.
  * Design now adapts to each server type.
* Money tooltip now only shows the top 8 characters, and truncates the remainder into a single entry.
* The filters menu now becomes scrollable if many filters are available.
* No longer warns of detected new version on login if the user as since updated.
* Now defaults pet rarity to common in offline view if rarity is missing (to prevent bugs).

## 0 (beta)
* Initial pre-release.
* Custom artwork by Blackmane, Jaliborc and Maxime Playoust.
* Some planned features are missing, including:
  * Some basic built-in filters that were present in Combuctor.
  * Void storage support.
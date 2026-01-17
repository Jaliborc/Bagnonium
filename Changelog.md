### 0.25
* __Bagnonium Exclusive:__
  * Created two new skins, _Smooth_ and _Speckled_, which are now used by default on the Bank and Guild Bank frames on retail servers.
* __Improved Performance:__
  * Opening a window for the first time each session is now **29% faster**.
  * Massively improved search engine performance by developing a JIT compiler - search and filters are now **13.51 times faster**! That's a **1351% improvement**!
* __Tooltips:__
  * Tooltip currency counts now correctly update during gameplay.
  * To increase readability, money tooltip now hides copper amounts when dealing with large amounts of gold.
  * To increase readability, large numbers in tooltip currency counts are now formatted as in the rest of the UI.
* __Other Improvements:__
  * You can now search battle pets by name, both online and offline.
  * The sort options menu now detects and refreshes when the blizzard settings change (these client settings can take time to change, and it was visually confusing to use).
  * Updated dropdown buttons in Bagnon Options to use the new native implementation. Their appearance will now match the version of the game.
* __Bug Fixes:__
  * Fixed the missing "Opening the World Map" button text in auto-display options.
  * Fixed issue that caused custom search filters to not always exactly match a normal text search, for example when using a keyword like _Soulbound_ or _Warbound_.
  * Fixed error message that could appear when searching offline characters.
  * Made workaround to stop bug being caused by a major flaw with CallbackHandler-1.0.
  * Overall reduced reliance on CallbackHandler-1.0 wherever possible.

### 0.24
* __Improved Warbank Interaction:__
  * Using an item from your bags while viewing the Warband Bank tab will now deposit it directly into the Warband Bank.
  * Added a new protocol API (`Addon_Get/SetBankType`) so addons (e.g., TSM) can detect which bank interface (Player or Warband) is currently active.
* __Bug Fix:__ Resolved an issue that could cause the rule edit frame to display in an incorrect screen position. _(Thanks to r15ch13)_

### 0.23
* **Mists:** Visual bugfix.

### 0.22
* **Sorting Options:**
  * Added option to invert looting order in the sort options menu.
  * Added unique sound design to the item locking mode.
* **Minor Change:** The default number of displayed characters is now 10 (to match how it worked before multi-realm viewing was possible on Retail).
* **Retail, Bagnonium Exclusive:** Changed default slot background.

### 0.21
* Added support for Midnight open beta.

### 0.20
* Minor improvement to StaleCheck-1.0.

### 0.19
* Minor optization of ruleset code.
* Ensured the default tab will always be "All", until the user selects one for the first time, to avoid confusing existing users.

### 0.18
* Fixed a bug introduced last version preventing item refreshes.

### 0.17
* **New Feature:** Selected filters are now remembered between sessions.
* Retail: Updated TOC to 12.2.5.

### 0.16
* All: Modified BagBrother's item storage format, prioritizing future-proofing it for Blizzard changes on retail.
  * This fixes the recent issues with keystone tooltips.
  * Removed some unecessary data introduced recently by Blizzard.
* Retail: The deposit button toggle button now appears in the settings as intended once again.
* All: Improved the efficiency of tooltip count generation.

### 0.15
* All: Fixed texture rendering issues that could appear when tracking a large amount of currencies or having a lot of money.
* Retail: Right-click behaviour at the bank is no longer changed if the bank frame is disabled.
* Retail: Fixed layout positioning issues introduced by the last patch.
* Mists: Updated TOC number.

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
--[[
	Bagnonium default settings.
	All Rights Reserved
--]]

local ADDON, Addon = ...
local function AsArray(table)
	return setmetatable(table, {__metatable = false})
end

local FrameDefaults = {
	enabled = true,
	sidebar = true, tabs = true, bagToggle = true,

	skin = 'Combuctor',
	activeRules = {}, brokerObject = ADDON .. 'Launcher',
	rules = {
		sidebar = AsArray({'all', 'tradegoods', 'consumable', 'armor', 'questitem', 'miscellaneous'}),
		tabs = AsArray({'all'})},
	
	strata = 'HIGH', alpha = 1, scale = 1,
	point = 'TOPLEFT',
	x = 15, y = -115,

	bagBreak = 1, breakSpace = 1.3, spacing = 2,
	itemScale = 1.25,

	color = {PANEL_BACKGROUND_COLOR:GetRGBA()},
	borderColor = {1, 1, 1, 1},
}

Addon.Settings.ProfileDefaults = {
	inventory = Addon:SetDefaults({
		width = Addon.IsRetail and 485 or 400, height = Addon.IsRetail and 680 or 500,
		point = 'BOTTOMRIGHT',
		x = -13, y = 104,

		rules = {tabs = AsArray({'all', 'normal', 'trade'})},
		skin = Addon.Skins.Default,
		currency = true,
	}, FrameDefaults),

	bank = Addon:SetDefaults({
		width = Addon.IsRetail and 927 or 694, height = Addon.IsRetail and 674 or 436,
		rules = {tabs = Addon.IsRetail and AsArray({'all', 'player', 'account'}) or AsArray({'all', 'normal', 'trade'})},
		deposit = true, currency = true
	}, FrameDefaults),

	guild = Addon:SetDefaults({
		width = 637, height = 448,
	}, FrameDefaults),

	vault = Addon:SetDefaults({
		width = 927, height = 674
	}, FrameDefaults)
}

Addon.Settings.GlobalDefaults = {
	slotBackground = Addon.IsRetail and 3 or 2
}
--[[
	Built-in skins specific to Bagnonium.
	All Rights Reserved
--]]

local ADDON, Addon = ...

Addon.Skins.Default = Addon.IsRetail and 'Bagnonium' or 'Combuctor'
Addon.Skins:Register {
	id = 'Combuctor', template = 'CombuctorSkinTemplate', closeX = Addon.IsRetail and 3 or 6, closeY = Addon.IsRetail and 2 or 7,
	load = function(skin)
		local frame = skin:GetParent()
		if skin.PortraitFrame then
			skin.PortraitFrame:SetParent(frame.OwnerSelector)
		end

		skin.RightBox:SetPoint('LEFT', frame.MoneyFrame, -15,0)
		skin.LeftBox:SetPoint('TOPRIGHT', frame.CurrencyTracker, 8,0)
		skin.RightBox.Bg:SetBorderColor(NORMAL_FONT_COLOR:GetRGB())
		skin.LeftBox.Bg:SetBorderColor(0.447,0.767,0.193)
		skin.CloseButton:Hide()
	end,

	layout = function(skin)
		local frame = skin:GetParent()
		local broker = frame.BrokerCarrousel
		if broker then
			broker:SetPoint('LEFT', skin.LeftBox, 'RIGHT', 0,-1)
			broker:SetPoint('RIGHT', skin.RightBox, 'LEFT', -2,-1)
		end

		skin.LeftBox:SetShown(frame.CurrencyTracker:GetWidth() > 5)
	end
}

if Addon.IsRetail then
	Addon.Skins:Register {
		id = 'Bagnonium', template = 'PortraitFrameFlatTemplate', closeX = 3, closeY = 2,
		borderColor = function(skin,...) NineSlicePanelMixin.SetBorderColor(skin.NineSlice,...) end,
		--centerColor = function(skin, ...) skin:SetBackgroundColor(CreateColor(...)) end, PANEL_BACKGROUND_COLOR
		load = function(skin)
			skin.Bg:SetFrameLevel(0)
			skin.CloseButton:Hide()
		end
	}
end
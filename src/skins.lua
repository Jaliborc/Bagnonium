--[[
	Built-in skins specific to Bagnonium.
	All Rights Reserved
--]]

local ADDON, Addon = ...

Addon.Skins.Default = 'Combuctor'
Addon.Skins:Register {
	id = 'Combuctor', template = 'CombuctorSkinTemplate', closeX = Addon.IsRetail and 3 or 6, closeY = Addon.IsRetail and 2 or 7,
	load = function(skin)
		if skin.PortraitFrame then
			skin.PortraitFrame:SetParent(skin:GetParent().OwnerSelector)
		end

		skin.RightBox.Bg:SetBorderColor(NORMAL_FONT_COLOR:GetRGB())
		skin.LeftBox.Bg:SetBorderColor(0.447,0.767,0.193)
		skin.CloseButton:Hide()
	end,

	layout = function(skin)
		local frame = skin:GetParent()
		frame.BrokerCarrousel:SetPoint('LEFT', skin.LeftBox, 'RIGHT', 2,-1)
		frame.BrokerCarrousel:SetPoint('RIGHT', skin.RightBox, 'LEFT', -2,-1)

		local currency = frame.CurrencyTracker:GetWidth()
		skin.RightBox:SetWidth(max(frame.MoneyFrame:GetWidth(), 125)+20)
		skin.LeftBox:SetWidth(currency > 5 and currency+8 or 1)
		skin.LeftBox:SetShown(currency > 5)
	end
}

if Addon.IsRetail then
	Addon.Skins:Register {
		id = 'Bagnonium', template = 'PortraitFrameFlatTemplate', closeX = 3, closeY = 2,
		load = function(skin) skin.CloseButton:Hide() end
	}
end
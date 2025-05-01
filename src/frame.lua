--[[
	The Bagnonium frame design.
	All Rights Reserved
--]]

local ADDON, Addon = ...
local Frame = Addon.Frame
Frame.FontH = GameFontHighlightCenter
Frame.Font = GameFontNormalCenter


--[[ Construct ]]--

function Frame:New(params)
	local f = self:Super(Frame):New(UIParent)
	tinsert(UISpecialFrames, f:GetName())
	MergeTable(f, params)

	f.ResizeButton:Init(f, 300, 200)
	f.ResizeButton:SetFrameLevel(f:GetFrameLevel() + 5)
	f.CloseButton:SetScript('OnClick', function() Addon.Frames:Hide(f.id, true) end)
	f.SearchBox:HookScript('OnTextChanged', function()
		local text = f.SearchBox:GetText()
		if text ~= Addon.search then
			Addon.search = text
			Addon.canSearch = true
			Addon:SendSignal('SEARCH_CHANGED', text)
		end
	end)

	f.profile = f:GetBaseProfile()
	f:SetSize(f.profile.width, f.profile.height)
	f:GetWidget('ItemGroup', f.Bags)
	f:GetWidget('SortButton'):SetPoint('LEFT', f.SearchBox, 'RIGHT', 8,-2)
	f:GetWidget('MoneyFrame'):SetPoint('BOTTOMRIGHT', -8,2)
	f:GetWidget('OwnerSelector'):SetPoint('TOPLEFT', -20, 20)
	f:GetWidget('CurrencyTracker')
	f:GetWidget('BrokerCarrousel')

	return f
end

function Frame:RegisterEvents()
	self:RegisterFrameSignal('BAG_FRAME_TOGGLED', 'UpdateItems')
	self:RegisterFrameSignal('OWNER_CHANGED', 'UpdateTitle')
	self:RegisterSignal('SEARCH_CHANGED', 'UpdateSearch')
	self:UpdateTitle()
end

function Frame:OnSizeChanged()
	self.profile.width, self.profile.height = self:GetSize()
	self:Delay(0, 'UpdateItems')
end


--[[ Update ]]--

function Frame:UpdateTitle()
	self.Title:SetFormattedText(self:GetClass().Title, self:GetOwner().name or ' ')
	self.Title:SetWidth(self.Title:GetTextWidth())
end

function Frame:UpdateSearch()
	if Addon.search ~= self.SearchBox:GetText() then
		self.SearchBox:SetText(Addon.search or '')
	end
end

function Frame:UpdateItems()
	self.ItemGroup:Layout()
end

function Frame:Layout()
	local x = 5
	for i, button in ipairs_reverse(self:GetExtraButtons()) do
		button:SetPoint('LEFT', self.SortButton, 'RIGHT', x,0)
		x = x + button:GetWidth() + 5
	end

	if self:ToggleWidget('BagGroup', self:AreBagsShown()) then
		self.BagGroup:SetPoint('TOPLEFT', 12, -66)
	end

	if self:ToggleWidget('TabGroup', 54, self.profile.sidebar) then
		local margin = self.bg.skin.margin or 0

		if self.id == 'inventory' then
			self.TabGroup:SetPoint('TOPRIGHT', self, 'TOPLEFT', 4-margin,-30)

			for i, tab in pairs(self.TabGroup.buttons) do
				tab.Border:SetTexCoord(1, 0, 0, 1)
			end
		else
			self.TabGroup:SetPoint('TOPLEFT', self, 'TOPRIGHT', margin,-30)
		end
	end

	self.ItemGroup:SetPoint('TOPLEFT', 12, self:AreBagsShown() and -102 or -66)
	self:SendFrameSignal('LAYOUT_FINISHED')
end


--[[ API ]]--

function Frame:ToggleWidget(key, ...)
	if select(-1, ...) then
		return self:GetWidget(key, ...)
	elseif rawget(self, key) then
		rawget(self, key):Hide()
	end
end

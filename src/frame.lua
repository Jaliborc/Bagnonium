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
	f.ResizeButton:SetPoint('BOTTOMRIGHT', Addon.IsRetail and -2 or -5,2)
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
	f.onDragStopCallback = function()
		f:StopMovingOrSizing()
		f:SavePosition()
	end

	f:SetSize(f.profile.width, f.profile.height)
	f:GetWidget('CurrencyTracker', 'NumberFontNormalSmall'):SetPoint('BOTTOMLEFT', 10,4)
	f:GetWidget('OwnerSelector'):SetPoint('TOPLEFT', Addon.IsRetail and -9 or -11, Addon.IsRetail and 13 or 12)
	f:GetWidget('SortButton'):SetPoint('LEFT', f.SearchBox, 'RIGHT', 8, -1)
	f:GetWidget('MoneyFrame'):SetPoint('BOTTOMRIGHT', -8,2)
	f:GetWidget('ItemGroup', f.Bags)
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
	if self:ToggleWidget('BagGroup', self:AreBagsShown()) then
		self.BagGroup:SetPoint('TOPLEFT', 12, -66)
	end

	if self:ToggleWidget('TabGroup', 54, self.profile.sidebar) then
		if self.id == 'inventory' then
			self.TabGroup:SetPoint('TOPRIGHT', self, 'TOPLEFT', 2,-30)

			for i, tab in pairs(self.TabGroup.buttons) do
				tab.Border:SetPoint('TOP', -15,12)
				tab.Border:SetTexCoord(1, 0, 0, 1)
			end
		else
			self.TabGroup:SetPoint('TOPLEFT', self, 'TOPRIGHT', 2,-10)
		end
	end

	local x = 0
	for i, button in ipairs_reverse(self:GetExtraButtons()) do
		x = x + button:GetWidth() + (button.off or 0)
		button:SetPoint('LEFT', self.SortButton, x,0)
	end

	self.ItemGroup:SetPoint('TOPLEFT', 12, self:AreBagsShown() and -102 or -66)
	self.SearchBox:SetPoint('TOPRIGHT', -x-47, -32)
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

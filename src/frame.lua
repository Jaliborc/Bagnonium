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

	f.rules, f.compiled = {}, {}
	f.profile = f:GetBaseProfile()
	f.onDragStartCallback = GenerateClosure(f.CanDrag, f)
	f.onDragStopCallback = function()
		f:StopMovingOrSizing()
		f:SavePosition()
	end

	f.ResizeButton:Init(f, 300, 200)
	f.ResizeButton:SetFrameLevel(f:GetFrameLevel() + 5)
	f.ResizeButton:SetPoint('BOTTOMRIGHT', Addon.IsRetail and -2 or -5,2)
	f.CloseButton:SetScript('OnClick', function() Addon.Frames:Hide(f.id, true) end)
	f.SearchBox:HookScript('OnTextChanged', GenerateClosure(f.OnSearchChanged, f))
	f.Title:SetFrameLevel(550)

	f:SetSize(f.profile.width, f.profile.height)
	f:GetWidget('OwnerSelector'):SetPoint('TOPLEFT', Addon.IsRetail and -9 or -11, Addon.IsRetail and 13 or 12)
	f:GetWidget('CurrencyTracker', 'NumberFontNormalSmall'):SetPoint('BOTTOMLEFT', 10,4)
	f:GetWidget('SortButton'):SetPoint('LEFT', f.SearchBox, 'RIGHT', 8, -1)
	f:GetWidget('MoneyFrame'):SetPoint('BOTTOMRIGHT', -8,2)
	f:GetWidget('ItemGroup', f.Bags)
	
	return f
end

function Frame:RegisterEvents()
	self:RegisterFrameSignal('BAG_FRAME_TOGGLED', 'UpdateBags')
	self:RegisterFrameSignal('OWNER_CHANGED', 'UpdateTitle')
	self:UpdateTitle()
end

function Frame:OnSizeChanged()
	self.profile.width, self.profile.height = self:GetSize()
	self:Delay(0, 'UpdateSize')
end

function Frame:OnSearchChanged()
	local text = self.SearchBox:GetText():trim()
	text = text ~= '' and text

	if text ~= self.search then
		self.search = text
		self.ItemGroup:Layout()
	end
end


--[[ Update ]]--

function Frame:UpdateTitle()
	self.Title:SetFormattedText(self:GetClass().Title, self:GetOwner().name or ' ')
	self.Title:SetWidth(self.Title:GetTextWidth())
end

function Frame:UpdateBags()
	self.ItemGroup:Layout()
	self:Layout()
end

function Frame:UpdateSize()
	self.CurrencyTracker:Layout()
	self.ItemGroup:Layout()
end

function Frame:Layout()
	if self:ToggleWidget('BagGroup', self:AreBagsShown()) then
		self.BagGroup:SetPoint('TOPLEFT', 12, -66)
	end

	if self:ToggleWidget('TabGroup', 'sidebar', self.profile.sidebar) then
		if self.id == 'inventory' then
			self.TabGroup:SetPoint('TOPRIGHT', self, 'TOPLEFT', 2,-64)
		else
			self.TabGroup:SetPoint('TOPLEFT', self, 'TOPRIGHT', 2,-44)
		end
	end

	if self:ToggleWidget('BottomTabGroup', 'tabs', self.profile.tabs) then
		self.BottomTabGroup:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 11,2)
	end
	
	if self:ToggleWidget('BrokerCarrousel', self.profile.broker) then
		self.BrokerCarrousel:SetPoint('LEFT', self.CurrencyTracker, self.profile.currency and 'RIGHT' or 'LEFT', -4,-1)
		self.BrokerCarrousel:SetPoint('RIGHT', self.MoneyFrame, 'LEFT', -2,-1)
	end

	local x = 0
	for i, button in ipairs_reverse(self:GetExtraButtons()) do
		x = x + button:GetWidth() + (button.off or 0)
		
		button:SetPoint('LEFT', self.SortButton, x,0)
		button:Show()
	end

	self.CurrencyTracker:SetShown(self.profile.currency)
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

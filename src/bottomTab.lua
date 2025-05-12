--[[
	A bottom tab to activate a rule.
	All Rights Reserved
--]]

local ADDON, Addon =  ...
local Tab = Addon.Tab:NewClass('BottomTab', 'CheckButton', Addon.IsRetail and 'PanelTabButtonTemplate' or 'CharacterFrameTabButtonTemplate', true)
local Tabs = Addon.TabGroup:NewClass('BottomTabGroup')
Tabs.Button = Tab

function Tab:SetRule(rule)
	local active = rule == self:GetParent().active
	if active then
		PanelTemplates_SelectTab(self)
	else
		PanelTemplates_DeselectTab(self)
	end

	if Addon.IsRetail then
		self.LeftHighlight:SetAlpha(active and 0 or 0.4)
		self.MiddleHighlight:SetAlpha(active and 0 or 0.4)
		self.RightHighlight:SetAlpha(active and 0 or 0.4)
	else
		self:GetHighlightTexture():SetAlpha(active and 0 or 1)
	end

	self.rule = rule
	self:Enable()
	self:RegisterForClicks('anyUp')
	self:SetText(rule:GetValue('title', self.frame))
	self:SetNormalFontObject(active and GameFontHighlightSmall or GameFontNormalSmall)
	ExecuteFrameScript(self, 'OnShow')
end

function Tabs:LayoutTraits()
	return 1,0, Addon.IsRetail and 5 or -10,0
end
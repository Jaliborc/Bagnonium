--[[
	A bottom tab to activate a rule.
	All Rights Reserved
--]]

local ADDON, Addon =  ...
local Tab = Addon.Tab:NewClass('BottomTab', 'Button', Addon.IsRetail and 'PanelTabButtonTemplate' or 'CharacterFrameTabButtonTemplate', true)
local Tabs = Addon.TabGroup:NewClass('BottomTabGroup')
Tabs.Button = Tab

function Tab:SetRule(rule)
	self.rule = rule
	self:RegisterForClicks('anyUp')
	self:SetText(rule:GetValue('title', self.frame))
	ExecuteFrameScript(self, 'OnShow')

	if (rule == self.frame.rule) then
		PanelTemplates_SelectTab(self)
	else
		PanelTemplates_DeselectTab(self)
	end
end

function Tabs:GetFilters()
	return self.frame.profile.subfilters
end

function Tabs:LayoutTraits()
	return 1,0, Addon.IsRetail and 5 or -10,0
end
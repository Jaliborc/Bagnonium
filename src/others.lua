--[[
	Component proprieties to implement a Combuctor-style layout, with a dynamic item grid on a static frame.
	All Rights Reserved
--]]

local ADDON, Addon = ...

function Addon.ItemGroup:LayoutTraits(breaks)
	local profile = self:GetProfile()
	local n, b = #self.buttons, #breaks - 1
	local size = 37 + profile.spacing

	local w, h = self:GetFrame():GetSize()
	h = h - (profile.showBags and 131 or 97)
	w = w - 23

	local r, r2 = h/w, w/h
	local ny = ceil(sqrt(n * r))
	local lowest, highest = ceil(ny * r2), ceil((ny + b) * r2)
	local bestFit = 0

	for cols = lowest, highest do
		local rows = b * (profile.breakSpace - 1)
		for k, index in ipairs(breaks) do
			rows = rows + ceil(((breaks[k+1] or n) - index) / cols)
		end

		bestFit = max(bestFit, min(w/cols, h/rows))
	end
	bestFit = min(bestFit, profile.itemScale * size)

	local columns = floor(w / bestFit + 0.001)
	local scale = min(bestFit / size)
	return columns, scale, size
end

function Addon.TabGroup:LayoutTraits()
	return 0,1, 0,15
end

function Addon.CurrencyTracker:MaxWidth()
	return self.frame:GetWidth() - self.frame.MoneyFrame:GetWidth() - 40
end
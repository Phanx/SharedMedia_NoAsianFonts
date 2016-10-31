--[[--------------------------------------------------------------------
	SharedMedia: No Asian Fonts
	Removes the Chinese and Korean default fonts from LibSharedMedia.
	Copyright (c) 2012-2016 Phanx <addons@phanx.net>. All rights reserved.
	https://wow.curseforge.com/addons/sharedmedia-nochinese/
	http://www.wowinterface.com/downloads/info21961-SharedMediaNoAsianFonts.html
	https://github.com/Phanx/SharedMedia_NoAsianFonts
----------------------------------------------------------------------]]

if GetLocale() == "koKR" or strmatch(GetLocale(), "^zh") then return end

local delete = {
	-- You can add more fonts here if you have other addons
	-- registering fonts you don't want to see.
	["2002"] = true,
	["2002 Bold"] = true,
	["AR CrystalzcuheiGBK Demibold"] = true,
	["AR ZhongkaiGBK Medium (Combat)"] = true,
	["AR ZhongkaiGBK Medium"] = true,
}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function()
	local LSM = LibStub and LibStub("LibSharedMedia-3.0", true)
	if not LSM then return end

	f:UnregisterAllEvents()
	f:SetScript("OnEvent", nil)

	local cleaning

	local function CleanFontList()
		if cleaning then return end
		cleaning = true

		local LSM = LibStub("LibSharedMedia-3.0")
		if not LSM.MediaTable.font then return end
		if not LSM.MediaList.font then LSM:List("font") end

		for name in pairs(delete) do
			LSM.MediaTable.font[name] = nil
		end

		for i = #LSM.MediaList.font, 1, -1 do
			if delete[LSM.MediaList.font[i]] then
				table.remove(LSM.MediaList.font, i)
			end
		end
		table.sort(LSM.MediaList.font)

		-- Hack to force addons to rebuild caches
		local name = table.remove(LSM.MediaList.font, #LSM.MediaList.font)
		local file = LSM.MediaTable.font[name]
		LSM.MediaTable.font[name] = nil
		LSM:Register("font", name, file, GetLocale() == "ruRU" and LSM.LOCALE_BIT_ruRU or nil)

		-- More hacks for stubborn addons
		if Recount_Config_Fonts_Scrollbar then
			Recount_Config_Fonts_Scrollbar:GetScript("OnVerticalScroll")(Recount_Config_Fonts_Scrollbar, Recount_Config_Fonts_Scrollbar:GetVerticalScroll())
		end

		cleaning = nil
	end

	CleanFontList()
	LSM.RegisterCallback("SharedMedia_NoAsianFonts", "LibSharedMedia_Registered", CleanFontList)
end)

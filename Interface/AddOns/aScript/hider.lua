-- #### HIDE FRAMES/TEXTURES ####
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function eventHandler(self,event)
	if event == "PLAYER_ENTERING_WORLD" then
		----[[macro/binds]]
		-- if (Macro == true) then
		-- hooksecurefunc('ActionButton_UpdateHotkeys', function(self)
			-- local macro, hotkey = _G[self:GetName()..'Name'], _G[self:GetName()..'HotKey']
			-- if macro and hotkey then macro:Hide() hotkey:Hide() end
		-- end) 
		-- end

		-- for i=1, 12 do
				-- _G["ActionButton"..i.."Name"]:SetAlpha(0) -- main bar
				-- _G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0) -- bottom right bar
				-- _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0) -- bottom left bar
				-- _G["MultiBarRightButton"..i.."Name"]:SetAlpha(0) -- right bar
				-- _G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0) -- left bar
		-- end


		-- --[[macro/binds]]

		-- for i=1, 12 do
				-- _G["ActionButton"..i.."HotKey"]:SetAlpha(0) -- main bar
				-- _G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0) -- bottom right bar
				-- _G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0) -- bottom left bar
				-- _G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0) -- right bar
				-- _G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0) -- left bar
		-- end


		MainMenuBarPageNumber:SetAlpha(0)
		MainMenuBarMaxLevelBar:SetAlpha(0)

		for i=0,3 do _G["MainMenuBarTexture"..i]:SetAlpha(0)end
		for i=0,3 do _G["MainMenuMaxLevelBar"..i]:SetAlpha(0)end

		-- XP & REP Bar
		MainMenuExpBar:SetAlpha(0)
		ReputationWatchBar:SetAlpha(0)

		-- MainMenuBar
		MainMenuBarLeftEndCap:Hide() -- Hide Left Griffon.
		MainMenuBarRightEndCap:Hide() -- Hide Right Griffon.

		MainMenuBarMaxLevelBar:SetAlpha(0) -- hide the exp bar bg texture.
		MainMenuBarTexture0:Hide() -- hide all the background textures.
		MainMenuBarTexture1:Hide() -- leaving them on looks better,
		MainMenuBarTexture2:Hide() -- unless you are going to hide the
		MainMenuBarTexture3:Hide() -- micromenu and bag buttons too.
		SlidingActionBarTexture0:SetAlpha(0) -- hide pet bar background
		SlidingActionBarTexture1:SetAlpha(0) -- hide pet bar background

		-- Bags
		MainMenuBarBackpackButton:Hide() -- Hide Bag
		CharacterBag0Slot:Hide()  -- Hide Bag
		CharacterBag1Slot:Hide()  -- Hide Bag
		CharacterBag2Slot:Hide()   -- Hide Bag
		CharacterBag3Slot:Hide()   -- Hide Bag


		-- MicroMenu
		-- CharacterMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- SpellbookMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- TalentMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- AchievementMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- QuestLogMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- GuildMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- PVPMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- LFDMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- CompanionsMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- EJMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- MainMenuMicroButton:SetAlpha(0) -- Hide MicroMenu
		-- HelpMicroButton:SetAlpha(0) -- Hide MicroMenu
	end
end 
frame:SetScript("OnEvent",eventHandler)		
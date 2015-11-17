local frame = CreateFrame("FRAME")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function eventHandler(self,event)
	if event == "PLAYER_ENTERING_WORLD" then
		print("Hi|cffff0000",GetUnitName("PLAYER"), "|r, aScripts v2.0.0 has loaded !!")
		print("type /|cff009cffashelp|r for commandlist!")

		-- ### TESTING


		SLASH_SHOWXP1 = '/showxp';
		function SlashCmdList.SHOWXP(msg, editbox)
			print("showxp |cffff0000Not implemented yet.")
			-- pXP = UnitXP("player")
			-- XPMax = UnitXPMax("player")
			-- DEFAULT_CHAT_FRAME:AddMessage("Your XP is currently at "..floor( (XP / XPMax)*100 ).."%.",1,0,0)
		end


		-- ### TESTING END


		-- #### SCALING & POSITIONING FRAMES ####

		PlayerFrame:SetScale(1.15)
		TargetFrame:SetScale(1.15)
		FocusFrame:SetScale(1.15)
		-- BuffFrame:SetScale(1.1);

		--BuffFrame:ClearAllPoints();
		--BuffFrame:SetParent(MiniMapCluster);
		--BuffFrame:SetPoint("TOPRIGHT",-190,-15)

		TargetFrameToT:ClearAllPoints()
		TargetFrameToT:SetPoint("BOTTOMRIGHT",TargetFrame,-15,-10)

		FocusFrameToT:ClearAllPoints()
		FocusFrameToT:SetPoint("BOTTOMRIGHT",FocusFrame,-15,-10)

		CharacterMicroButton:ClearAllPoints()
		CharacterMicroButton:SetPoint("BOTTOMLEFT", -590, 2)

		MainMenuBar:SetScale(1)
		MainMenuBar:ClearAllPoints()
		MainMenuBar:SetPoint("CENTER",UIParent,"BOTTOM", 254, 26)
		MainMenuBar.SetPoint = function() end		

			
		StanceBarFrame:ClearAllPoints()
		StanceBarFrame:SetPoint("CENTER",UIParent,"BOTTOM", -246, 165)
		StanceBarFrame.SetPoint = function() end
						
		PetActionBarFrame:ClearAllPoints()
		PetActionBarFrame:SetPoint("CENTER",UIParent,"BOTTOM", 97, 171)
		PetActionBarFrame.SetPoint = function() end

		-- MainMenuExpBar:SetScale(.95)
		-- MainMenuExpBar:ClearAllPoints()				
		-- MainMenuExpBar:SetPoint("CENTER", UIParent, "CENTER", 0,541)	
					
		-- ReputationWatchBar:SetScale(.95)
		-- ReputationWatchBar:ClearAllPoints()	
		-- ReputationWatchBar:SetPoint("CENTER", UIParent, "CENTER", 0,300)

		MultiBarBottomRight:ClearAllPoints()
		MultiBarBottomRight:SetPoint("CENTER",MultiBarBottomLeft,"TOP",0,29)

		-- reposition LossOfControlFrame
		LossOfControlFrame:ClearAllPoints()
		LossOfControlFrame:SetPoint("CENTER",UIParent,"CENTER", 0, 100)
		LossOfControlFrame.SetPoint = function() end

		PlayerPowerBarAlt:ClearAllPoints()
		PlayerPowerBarAlt:SetPoint("CENTER",UIParent,"CENTER", 0, 100)
		PlayerPowerBarAlt.SetPoint = function() end

		-- reposition FPSLabel
		FramerateLabel:ClearAllPoints() 
		FramerateText:ClearAllPoints() 
		FramerateLabel:SetPoint("TOPLEFT",UIParent,"TOPLEFT",50,630) 
		FramerateText:SetPoint("LEFT",FramerateLabel,"RIGHT") 


		-- show casttime on Blizzard CastingBar
		CastingBarFrame:ClearAllPoints()
		CastingBarFrame:SetPoint("CENTER",UIParent,"CENTER", 0, -235)
		CastingBarFrame.SetPoint = function() end
		CastingBarFrame:SetScale(1.0)

		CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil);
		CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
		CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0);
		CastingBarFrame.update = .1;

		-- show ability icon on Blizzard castbar
		CastingBarFrameIcon:Show()
		CastingBarFrameIcon:SetSize(20, 20)
		CastingBarFrameIcon:SetPoint("RIGHT", CastingBarFrame, "LEFT", -5, 2)


		-- #### QUALITY OF LIFE ####

		UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")

		for i=1,4 do _G["ChatFrame"..i]:SetFont("Fonts\\ARIALN.TTF",16,"OUTLINE")end	

		-- Minimap Tweaks
		MinimapZoomIn:Hide()
		MinimapZoomOut:Hide()
		Minimap:EnableMouseWheel(true)
		Minimap:SetScript('OnMouseWheel', function(self, delta)
				if delta > 0 then
						Minimap_ZoomIn()
				else
						Minimap_ZoomOut()
				end
		end)
		MiniMapTracking:ClearAllPoints()
		MiniMapTracking:SetPoint("TOPRIGHT", -26, 7)

		-- UnitFrame HP format: [120/140k] ... [currentHP/maxHP]
		hooksecurefunc("CastingBarFrame_OnUpdate", function(self, elapsed)
				if not self.timer then return end
				if self.update and self.update < elapsed then
						if self.casting then
								self.timer:SetText(format("%2.1f/%1.1f", max(self.maxValue - self.value, 0), self.maxValue))
						elseif self.channeling then
								self.timer:SetText(format("%.1f", max(self.value, 0)))
						else
								self.timer:SetText("")
						end
						self.update = .1
				else
						self.update = self.update - elapsed
				end
		end)

		-- adds classColor to TargetFrame & FocusFrame 
		local function eventHandler(self, event, ...)
				if UnitIsPlayer("target") then
						c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
						TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
				end
				if UnitIsPlayer("focus") then
						c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
						FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
				end
		end

		--frame:SetScript("OnEvent", eventHandler)

		for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
				BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
		end

		---- Disable healing/damage spam over player/pet frame
		PlayerHitIndicator:SetText(nil)
		PlayerHitIndicator.SetText = function() end
		PetHitIndicator:SetText(nil)
		PetHitIndicator.SetText = function() end


		--classcolors

		local function colour(statusbar, unit)
				local _, class, c
				if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
						_, class = UnitClass(unit)
						c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
						statusbar:SetStatusBarColor(c.r, c.g, c.b)
						PlayerFrameHealthBar:SetStatusBarColor(0,1,0)
				end
		end

		hooksecurefunc("UnitFrameHealthBar_Update", colour)
		hooksecurefunc("HealthBar_OnValueChanged", function(self)
				colour(self, self.unit)
		end)

		local function Show(frame)
			--frame:UnregisterAllEvents()
			frame:Show()
		end

		-- #### EXTRA SLASHCOMMANDS ####
		SLASH_SHOWBAGS1 = '/sb';
		function SlashCmdList.SHOWBAGS(msg, editbox)
			print("\nShow backpack!!");
			for i=0,3 do print("|r/rl |cffff0000after you are done!!!!|r") end
			Show(MainMenuBarBackpackButton);
			Show(CharacterBag0Slot);
			Show(CharacterBag1Slot);
			Show(CharacterBag2Slot);
			Show(CharacterBag3Slot);
		end

		SLASH_ASHELP1 = '/ashelp';
		function SlashCmdList.ASHELP(msg, editbox) 
			print("commandlist:")
			print("/|cff009cffsb|r - show bags")
			print("/|cff009cffrl|r - reload ui")
			print("/|cff009cffshowxp|r - shows your current XP(not working)")
		end


		SlashCmdList['RELOADUI'] = function()
			ReloadUI()
		end
		SLASH_RELOADUI1 = '/rl'

		end 
end
frame:SetScript("OnEvent",eventHandler)		
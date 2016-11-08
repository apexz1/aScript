local frame = CreateFrame("FRAME")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_LOGIN")

if event =="PLAYER_LOGIN" then
	print("Hi|cffff0000",GetUnitName("PLAYER"), "|r, aScripts v3.0.1 has loaded !!")
	print("type /|cff009cffashelp|r for commandlist!")
end

local function eventHandler(self,event)
	if event == "PLAYER_ENTERING_WORLD" then
		-- ### TESTING
		RuneFrame:ClearAllPoints()
		RuneFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -175)
		RuneFrame.SetPoint = function() end
		RuneFrame:SetScale(1)
		-- ### TESTING END


		-- [[#### SCALING & POSITIONING FRAMES ####]]

		-- Just so you understand how this works: obj:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
		-- - point is the point of the object that'll be considered its anchor when adjusting;
		-- - relativeFrame is the frame we are attaching it to (use UIParent when you don't want to attach it to anything - that's the whole fullscreen UI frame);
		-- - relativePoint is the point we attach the object to
		-- - ofsx and ofsy are x and y offsets

		-- So, in this case we tell it to attach TargetFrameSpellBar with its "BOTTOM" to the "TOP" of TargetFrame, and move it 15 pixels to the left (x offset).		
		
		
		PlayerFrame:SetScale(1.26)
		TargetFrame:SetScale(1.26)
		FocusFrame:SetScale(1.14)
		--BuffFrame:SetScale(1.18);

		BuffFrame:ClearAllPoints();
		BuffFrame:SetParent(MiniMapCluster);
		BuffFrame:SetPoint("TOPRIGHT",-190,-15)

		MinimapCluster:SetScale(1.19)
		
		TargetFrameToT:ClearAllPoints()
		TargetFrameToT:SetPoint("BOTTOMRIGHT",TargetFrame,-15,-10)

		FocusFrameToT:ClearAllPoints()
		FocusFrameToT:SetPoint("BOTTOMRIGHT",FocusFrame,-15,-10)

		-- CharacterMicroButton:ClearAllPoints()
		-- CharacterMicroButton:SetPoint("BOTTOMLEFT", -590, 2)

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
		CastingBarFrame:SetScale(1.2)

		CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil);
		CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
		CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0);
		CastingBarFrame.update = .1;

		-- show ability icon on Blizzard castbar
		-- CastingBarFrameIcon:Show()
		-- CastingBarFrameIcon:SetSize(20, 20)
		-- CastingBarFrameIcon:SetPoint("RIGHT", CastingBarFrame, "LEFT", -5, 2)

		-- unattach the target castbar from targetFrame and place it in the center
		TargetFrameSpellBar:ClearAllPoints()
		TargetFrameSpellBar:SetPoint("CENTER", UIParent, "CENTER", 0, -100)
		TargetFrameSpellBar.SetPoint = function() end
		TargetFrameSpellBar:SetScale(1.2)
		
		
		-- [[#### QUALITY OF LIFE ####]]

		
		-- Disable the group number frame
		PlayerFrameGroupIndicator.Show = function() return end
		
		--show the MultiBarRight on mouse over, else hide
		local function MultiBarRightOnHover(alpha)

			if MultiBarRight:IsShown() then
				for i = 1, 12 do
					local button = _G["MultiBarRightButton"..i]
					button:SetAlpha(alpha)

					if(MultiBarLeft:IsShown()) then
						local button2 = _G["MultiBarLeftButton"..i]
						button2:SetAlpha(alpha)
					end
				end
			end
		end
		-- --show the MultiBarLeft on mouse over, else hide
		local function MultiBarLeftOnHover(alpha)

			if MultiBarLeft:IsShown() then
				for i = 1, 12 do
					local button = _G["MultiBarLeftButton"..i]
					button:SetAlpha(alpha)

					if(MultiBarRight:IsShown()) then
						local button2 = _G["MultiBarRightButton"..i]
						button2:SetAlpha(alpha)
					end
				end
			end
		end
		--show the MultiBarBottomRight on mouse over, else hide
		local function MultiBarBottomRightOnHover(alpha)

			if MultiBarBottomRight:IsShown() then
				for i = 1, 12 do
					local button = _G["MultiBarBottomRightButton"..i]
					button:SetAlpha(alpha)
				end
			end
		end

		MultiBarRight:EnableMouse(true)
		MultiBarLeft:EnableMouse(true)
		MultiBarBottomRight:EnableMouse(true)

		MultiBarRight:SetScript("OnEnter", function(self) MultiBarRightOnHover(1) end)
		MultiBarRight:SetScript("OnLeave", function(self) MultiBarRightOnHover(0) end)
		MultiBarLeft:SetScript("OnEnter", function(self) MultiBarLeftOnHover(1) end)
		MultiBarLeft:SetScript("OnLeave", function(self) MultiBarLeftOnHover(0) end)
		MultiBarBottomRight:SetScript("OnEnter", function(self) MultiBarBottomRightOnHover(1) end)
		MultiBarBottomRight:SetScript("OnLeave", function(self) MultiBarBottomRightOnHover(0) end)

		for i = 1, 12 do
			local button = _G["MultiBarRightButton"..i]
			local button2 = _G["MultiBarLeftButton"..i]
			local button3 = _G["MultiBarBottomRightButton"..i]
			
			button:SetAlpha(0)
			button2:SetAlpha(0)
			button3:SetAlpha(0)

			button:HookScript("OnEnter", function(self) MultiBarRightOnHover(1) end)
			button:HookScript("OnLeave", function(self) MultiBarRightOnHover(0) end)

			button2:HookScript("OnEnter", function(self) MultiBarLeftOnHover(1) end)
			button2:HookScript("OnLeave", function(self) MultiBarLeftOnHover(0) end)
			
			button3:HookScript("OnEnter", function(self) MultiBarBottomRightOnHover(1) end)
			button3:HookScript("OnLeave", function(self) MultiBarBottomRightOnHover(0) end)	
		end
		
		
		UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")

		for i=1,4 do _G["ChatFrame"..i]:SetFont("Fonts\\ARIALN.TTF",14,"OUTLINE")end	

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
		GarrisonLandingPageMinimapButton:SetScale(.65)

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
		-- local function eventHandler(self, event, ...)
				-- if UnitIsPlayer("target") then
						-- c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
						-- TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
				-- end
				-- if UnitIsPlayer("focus") then
						-- c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
						-- FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
				-- end
		-- end


		for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
				BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
		end
		
		-- Class icons in portraits
		-- hooksecurefunc("UnitFramePortrait_Update",function(self)
			-- if self.portrait then
					-- if UnitIsPlayer(self.unit) then                         
							-- local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
							-- if t then
									-- self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
									-- self.portrait:SetTexCoord(unpack(t))
							-- end
					-- else
							-- self.portrait:SetTexCoord(0,1,0,1)
					-- end
			-- end
		-- end)

		---- Disable healing/damage spam over player/pet frame
		PlayerHitIndicator:SetText(nil)
		PlayerHitIndicator.SetText = function() end
		PetHitIndicator:SetText(nil)
		PetHitIndicator.SetText = function() end

		-- Changes the font and size of hotkey & macro text on default action bars
		local defaultStubs = {
			 ActionButton=12, MultiBarRightButton=12,
			 MultiBarLeftButton=12, MultiBarBottomRightButton=12,
			 MultiBarBottomLeftButton=12, StanceButton=10, PetActionButton=10,
		}
		for stub,numButtons in pairs(defaultStubs) do
			for i=1,numButtons do
				_G[stub..i.."HotKey"]:SetFont("Fonts\\MORPHEUS.ttf",12,"OUTLINE,THICKOUTLINE,MONOCHROME")
			end
		end

		SLASH_SHOWXP1 = '/showxp';
		function SlashCmdList.SHOWXP(msg, editbox)
			print("showxp |cffff0000Not implemented yet.")
			-- pXP = UnitXP("player")
			-- XPMax = UnitXPMax("player")
			-- DEFAULT_CHAT_FRAME:AddMessage("Your XP is currently at "..floor( (XP / XPMax)*100 ).."%.",1,0,0)
		end
		
		--classcolors
		-- local function colour(statusbar, unit)
				-- local _, class, c
				-- if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
						-- _, class = UnitClass(unit)
						-- c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
						-- statusbar:SetStatusBarColor(c.r, c.g, c.b)
						-- PlayerFrameHealthBar:SetStatusBarColor(0,1,0)
				-- end
		-- end

		-- hooksecurefunc("UnitFrameHealthBar_Update", colour)
		-- hooksecurefunc("HealthBar_OnValueChanged", function(self)
				-- colour(self, self.unit)
		-- end)

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
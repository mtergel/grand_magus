if GameSetup == nil then
	GameSetup = class({})
end

function GameSetup:constructor()
	self.availableAbilities = {
		"abaddon_death_coil",
		"abyssal_underlord_firestorm",
		"alchemist_unstable_concoction",
		"ancient_apparition_cold_feet",
	}
end

function GameSetup:init()
	if IsInToolsMode() then --debug
		GameRules:EnableCustomGameSetupAutoLaunch(true)
		GameRules:SetCustomGameSetupAutoLaunchDelay(0)
		GameRules:SetHeroSelectionTime(10)
		GameRules:SetStrategyTime(0)
		GameRules:SetPreGameTime(0)
		GameRules:SetShowcaseTime(0)
		GameRules:SetPostGameTime(5)

		--disable some setting which are annoying then testing
		local GameMode = GameRules:GetGameModeEntity()
		GameMode:SetAnnouncerDisabled(true)
		GameMode:SetKillingSpreeAnnouncerDisabled(true)
		GameMode:SetDaynightCycleDisabled(true)
		GameMode:DisableHudFlip(true)
		GameMode:SetDeathOverlayDisabled(true)
		GameMode:SetWeatherEffectsDisabled(true)

		--disable music events
		GameRules:SetCustomGameAllowHeroPickMusic(false)
		GameRules:SetCustomGameAllowMusicAtGameStart(false)
		GameRules:SetCustomGameAllowBattleMusic(false)

		--multiple players can pick the same hero
		GameRules:SetSameHeroSelectionEnabled(true)

		print("demo: ", self.availableAbilities)
	else --build
		-- todo
	end
end

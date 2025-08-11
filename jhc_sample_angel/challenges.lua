
function jhc_sample_angel.register_challenges()

    register_challenge "sample_challenge_aodd"
	{
		name        = "Angel of DD",
		description = "You played too many roleplaying games when you were young. Because of that you gain +5 HP each level and +1 toHit every 2 levels. However, you gain a trait only at character creation, and every 4 levels.",
		rating      = "HARD",
		rank        = 0,
		abbr        = "AoDD",
		let         = "Z",
		secondary   = { "AoI", "AoP", "AoRA", "AoD", "AoMs" },

		OnPreLevelUp = function ( l )
			if l % 4 == 0 then
				player:choose_trait()
			end
			player.hpmax = player.hpmax + 5
			player.hp    = player.hp + 5
			ui.msg("You gain {!+5} HP!")
			if l % 2 == 0 then
				player.accuracy = player.accuracy + 1
				ui.msg("You gain {!+1} THAC0!")
			end
			ui.msg("You now have {!"..player.hpmax.."} HP and {!+"..player.accuracy.."} THAC0!")
			return false
		end,
	}
end


function jhc_sample_adrenalpack.register_items()
    
	register_item "sample_adrenalpack"
	{
		name     = "adrenal medkit",
		ascii    = "+",
		color    = LIGHTRED,
		sprite   = SPRITE_KIT_MED_SMALL,
		coscolor = { 0.85,0.35,0.25,1.0 },

		tags     = { "medical" },
		-- just setting a level and weight will make this appear in the game
		level    = 3,
		weight   = 100,
		
		desc     = "Seems like a buffed up small med kit.",
		flags    = {},

		type     = ITEMTYPE_PACK,

		OnUse = function(self,being)
			if being.flags[ BF_NOHEAL ] then
				being:msg("Nothing happens.")
			else
				if being:is_player() then 
					being:remove_affect( "tired" )
				end
				if not being:is_affect( "adrenaline" ) then
					being:set_affect( "adrenaline", 20 )
				end
				local max_heal = math.floor( being.hpmax * being:get_property( "MEDKIT_OVERHEAL", 1 ) )
				if being.hp >= max_heal then
					being:msg("You feel pumped up!")
					return true
				end
				local amount = math.floor( ( (being.hpmax * diff[DIFFICULTY].powerfactor) / 4 + 2 ) * being:get_property( "MEDKIT_BONUS", 1 ) )
				being.hp = math.min( being.hp + amount, max_heal )
				being:msg("You feel healed and pumped up!")
			end
			return true
		end,
	}
end

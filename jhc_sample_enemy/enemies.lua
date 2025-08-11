
function jhc_sample_enemy.register_enemies()
    local ENEMYSHEET = core.register_sprite_sheet( "sample_enemy", nil, "sample_enemy_shadow", "sample_enemy_emissive", 301 )
    core.declare( "JSE_SPRITE_FIEND",  ENEMYSHEET + 1 )

	register_being "shadow_fiend"
	{
		name         = "shadow fiend",
		sound_id     = "ffiend",
		ascii        = "f",
		color        = LIGHTMAGENTA,
		sprite       = JSE_SPRITE_FIEND,
		sframes      = 2,
		sflags	     = { SF_PAINANIM },
		corpse       = 2,

		hp           = 30,
		accuracy     = 4,
		strength     = 3,

		min_lev      = 4,
		max_lev      = 14,
		danger       = 4,
		weight       = 8,
		tags         = { "callisto", "europa", "demon", "melee", "chaff" },

		flags        = { BF_OPENDOORS },
		attackchance = 40,
		ai_type      = "melee_ranged_ai",

		desc         = "Shadow fiends will send you into oblivion...",
		kill_desc    = "was bruised by a shadow fiend",

		weapon = {
			damage     = "2d6",
			damagetype = DAMAGE_PLASMA,
			radius     = 1,
			missile = {
				sound_id   = "ffiend",
				ascii      = "*",
				color      = LIGHTMAGENTA,
				sprite     = {
					sprite   = SPRITE_CFIREBALL,
					coscolor = { 0.6, 0.2, 0.6, 1.0 },
					sframes = 4,
					sftime  = 125,
				},
				hitsprite   = {
					sprite  = SPRITE_CFIRE_HIT,
					coscolor = { 0.6, 0.2, 0.6, 1.0 },
					sframes = 4,
					sftime  = 50,
				},
				delay      = 40,
				miss_base  = 50,
				miss_dist  = 5,
				explosion  = {
					delay = 40,
					color = LIGHTBLUE,
					sprite   = {
						sprite  = SPRITE_CFIRE_HIT,
						coscolor = { 0.6, 0.2, 0.6, 1.0 },
						sframes = 4,
						sftime  = 50,
					},
				},
			},
		},
	}

	-- register a grouped pack
	register_being_group
	{
		tags    = { "callisto", "europa", "demon", "minor" },
		min_lev = 9,
		max_lev = 12,
		weight  = 10,
		beings = {
			{ being = "reaver" },
			{ being = "shadow_fiend", amount = {2,4} }
		}
	}

end

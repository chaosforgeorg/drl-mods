-- you first need to declare your mods namespace,
-- it needs to match the mod id in meta.lua and the
-- folder name the mod resides in

core.declare( "jhc_sample_adrenalpack", {} )

-- you can require other files in your mod like this
-- from the same namespace. You can assume all
-- mods before this one have been loaded, including
-- core utility mod and the core game mod
require( "jhc_sample_adrenalpack:items" )

function jhc_sample_adrenalpack.OnLoad()
	-- this is in a separate file just to show how to do 
	-- multifile mods
	jhc_sample_adrenalpack.register_items()
end

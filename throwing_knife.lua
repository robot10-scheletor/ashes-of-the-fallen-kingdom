local modname = core.get_current_modname()
local modpath = core.get_modpath(modname)





local uses = {
	netherling = 3515,
}
local materials = {  "mcl_core:netherite_scrap",
	 
}

local SPEAR_RANGE = 1.5

local function spear_on_place(itemstack, user, pointed_thing)
	if pointed_thing.type == "node" then
		-- Call on_rightclick if the pointed node defines it
		local node = core.get_node(pointed_thing.under)
		if user and not user:get_player_control().sneak then
			if core.registered_nodes[node.name] and core.registered_nodes[node.name].on_rightclick then
				return core.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			end
		end
	end

	itemstack:get_meta():set_int("active", 1)
	return itemstack
end




core.register_tool("ashes_of_the_fallen_kingdom:netherling_throwingknife", {
	description = ("Netherling Throwing Knife"),
	_tt_help = spear_tt,
	_doc_items_longdesc = spear_longdesc,
	_doc_items_usagehelp = spear_use,
	inventory_image = "netherling_throwingknife.png",
	wield_scale = wield_scale,
	on_place = spear_on_place,
	on_secondary_use = spear_on_place,
	groups = { weapon = 1, weapon_ranged = 1, spear = 1, dig_speed_class = 3, enchantability = 10 },
	range = SPEAR_RANGE,
	tool_capabilities = {
		full_punch_interval = 0.71,
		max_drop_level = 5.5,
		damage_groups = { fleshy = 8 },
		punch_attack_uses = 3315,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = materials.quartz,
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 2, level = 1, uses = 3315 },
		swordy_cobweb = { speed = 2, level = 1, uses = 3315 }
	},
	touch_interaction = "short_dig_long_place",
	_mcl_spear_thrown_damage = 9.5,
	
})

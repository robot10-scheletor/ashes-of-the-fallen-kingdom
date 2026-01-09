local modname = core.get_current_modname()
local modpath = core.get_modpath(modname)





local uses = {
	quartz = 560,
}
local materials = {
	emerald = "mcl_core:nether_quartz",
}

local SPEAR_RANGE = 4.5

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



core.register_tool("ashes_of_the_fallen_kingdom:quartz_pike", {
	description = ("quartz Pike"),
	_tt_help = spear_tt,
	_doc_items_longdesc = spear_longdesc,
	_doc_items_usagehelp = spear_use,
	inventory_image = "quartz_pike.png",
	wield_scale = {x= 3,y= 3,z=1},
	on_place = spear_on_place,
	on_secondary_use = spear_on_place,
	groups = { weapon = 1, weapon_ranged = 1, spear = 1, dig_speed_class = 3, enchantability = 12 },
	range = SPEAR_RANGE,
	tool_capabilities = {
		full_punch_interval = 0.71,
		max_drop_level = 5.5,
		damage_groups = { fleshy = 7.5 },
		punch_attack_uses = 560,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = materials.quartz,
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 2, level = 1, uses = 560 },
		swordy_cobweb = { speed = 2, level = 1, uses = 560 }
	},
	touch_interaction = "short_dig_long_place",
	_mcl_spear_thrown_damage = 8.5,
	
})

minetest.register_tool("ashes_of_the_fallen_kingdom:quartz_claymore", {
	description = ("Quartz Claymore"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "quartz_claymore.png",
	wield_scale = {x=3.5,y=3.5, z=1.5},
	groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=15 },
	tool_capabilities = {
		full_punch_interval = 0.715,
		max_drop_level=4,
		damage_groups = {fleshy=10.5},
		punch_attack_uses = 550,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:quartz",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 7, level = 5, uses = 550 },
		swordy_cobweb = { speed = 7, level = 5, uses = 550 }
	},
})


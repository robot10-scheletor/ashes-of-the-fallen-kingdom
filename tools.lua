minetest.register_tool("ashes_of_the_fallen_kingdom:sword_quartz", {
	description = S("Quartz Sword"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "default_tool_woodsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=15 },
	tool_capabilities = {
		full_punch_interval = 0.615,
		max_drop_level=4,
		damage_groups = {fleshy=7.5},
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

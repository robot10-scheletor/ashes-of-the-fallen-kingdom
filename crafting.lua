
minetest.register_craft({
	output = "ashes_of_the_fallen_kingdom:blazed_stick",
	recipe = {
		{"", "mcl_mobitems:flaming_powder", ""},
		{"", "mcl_core:stick", ""},
		{"", "mcl_mobitems:flaming_powder", ""},
	}
})

minetest.register_craft({
	output = "ashes_of_the_fallen_kingdom:axe_quartz",
	recipe = {
		{"mcl_nether:quartz", "mcl_nether:quartz_block", ""},
		{"mcl_nether:quartz", "mcl_core:lapis", ""},
		{"", "ashes_of_the_fallen_kingdom:blazed_stick", ""},
	}
})

minetest.register_craft({
	output = "ashes_of_the_fallen_kingdom:sword_quartz",
	recipe = {
		{"", "mcl_nether:quartz_block", ""},
		{"", "mcl_core:lapis", ""},
		{"", "ashes_of_the_fallen_kingdom:blazed_stick", ""},
	}
})

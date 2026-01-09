local S = minetest.get_translator(minetest.get_current_modname())

mcl_armor.register_set({
	name = "quartz",
	descriptions = {
		head = S("Quartz Helmet"),
		torso = S("Quartz Chestplate"),
		legs = S("Quartz Leggings"),
		feet = S("Quartz Boots"),
	},
	durability = 250,
	enchantability = 12,
	points = {
		head = 3.5,
		torso = 8.5,
		legs = 6.5,
		feet = 3.5,
	},
	craft_material = "mcl_core:nether_quartz",
	cook_material = "mcl_core:nether_quartz",
	sound_equip = "mcl_armor_equip_iron",
	sound_unequip = "mcl_armor_unequip_iron",
})

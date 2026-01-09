local wield_scale = mcl_vars.tool_wield_scale

local function make_stripped_trunk(itemstack, placer, pointed_thing)
    if pointed_thing.type ~= "node" then return end

    local node = minetest.get_node(pointed_thing.under)
    local node_name = minetest.get_node(pointed_thing.under).name

    local noddef = minetest.registered_nodes[node_name]

    if not noddef then
        minetest.log("warning", "Trying to right click with an axe the unregistered node: " .. tostring(node_name))
        return
    end

    if not placer:get_player_control().sneak and noddef.on_rightclick then
        return minetest.item_place(itemstack, placer, pointed_thing)
    end
    if minetest.is_protected(pointed_thing.under, placer:get_player_name()) then
        minetest.record_protection_violation(pointed_thing.under, placer:get_player_name())
        return itemstack
    end

    if noddef._mcl_stripped_variant == nil then
		return itemstack
	else
		minetest.swap_node(pointed_thing.under, {name=noddef._mcl_stripped_variant, param2=node.param2})
		if minetest.get_item_group(node_name, "waxed") ~= 0 then
			awards.unlock(placer:get_player_name(), "mcl:wax_off")
		end
		if not minetest.is_creative_enabled(placer:get_player_name()) then
			-- Add wear (as if digging a axey node)
			local toolname = itemstack:get_name()
			local wear = mcl_autogroup.get_wear(toolname, "axey")
			if wear then
				itemstack:add_wear(wear)
				tt.reload_itemstack_description(itemstack) -- update tooltip
			end
		end
	end
    return itemstack
end

minetest.register_tool("ashes_of_the_fallen_kingdom:sword_quartz", {
	description = ("Quartz Sword"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "quartz_sword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=15 },
	tool_capabilities = {
		full_punch_interval = 0.615,
		max_drop_level=4,
		damage_groups = {fleshy=7.5},
		punch_attack_uses = 550,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_core:nether_quartz",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 7, level = 5, uses = 550 },
		swordy_cobweb = { speed = 7, level = 5, uses = 550 }
	},
})

minetest.register_tool("ashes_of_the_fallen_kingdom:axe_quartz", {
	description = ("Quartz Axe"),
	_doc_items_longdesc = axe_longdesc,
	_doc_items_hidden = false,
	inventory_image = "quartz_axe.png",
	wield_scale = wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=5.5, enchantability=14 },
	tool_capabilities = {
		full_punch_interval = 1.15,
		max_drop_level=1,
		damage_groups = {fleshy=9.2},
		punch_attack_uses = 550,
	},
	on_place = make_stripped_trunk,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_core:nether_quartz",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 8.5, level = 5.5, uses = 550 }
	},
})

minetest.register_tool("ashes_of_the_fallen_kingdom:sword_netherling", {
	description = ("Netherling Sword"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "netherling_sword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 0.815,
		max_drop_level=4,
		damage_groups = {fleshy=9.5},
		punch_attack_uses = 3515,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_nether:netherite_scrap",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 9.5, level = 6.5, uses = 3515 },
		swordy_cobweb = { speed = 9.5, level = 6.5, uses = 3515 }
	},
})

minetest.register_tool("ashes_of_the_fallen_kingdom:mace_netherling", {
	description = ("Netherling Mace"),
	_doc_items_longdesc = shovel_longdesc,
	_doc_items_usagehelp = shovel_use,
	inventory_image = "netherling_mace.png",
	wield_scale = wield_scale,
	groups = { tool=1, shovel=1, dig_speed_class=6, enchantability=10, fire_immune=1 },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=5,
		damage_groups = {fleshy=11},
		punch_attack_uses = 3515,
	},
	
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_nether:netherite_scrap",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 9.5, level = 6.5, uses = 3515 }
	},
})

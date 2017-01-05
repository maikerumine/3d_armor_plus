--3d_armor_plus
--Original by Stu
--add-on by maikerumine
--you need 3d_armor to run this mod.
--This mod adds extra special armour sets for extra speed and strength.

local craft_ingreds = {
	dirt = "default:dirt",
	obsidian = "default:obsidian_block"
}




if craft_ingreds.dirt then

	minetest.register_node("3d_armor_plus:power_dirt", {
		description = "Power Dirt",
		--tiles = {"default_dirt.png^fire_basic_flame.png"},
		tiles = {"default_dirt.png", "default_dirt.png", "default_dirt.png^fire_basic_flame.png"},
		groups = {crumbly = 1, soil = 1},
		light_source = default.LIGHT_MAX - 1,
		heal_per_second = 4,
		walkable = false,
		damage_per_second = 4 * 2,
		liquid_viscosity = 7,
		sounds = default.node_sound_dirt_defaults(),
		on_punch = function(pos, node, player, pointed_thing)
		player:set_hp( 20)
		end
	})

	minetest.register_abm({
		nodenames = {"3d_armor_plus:power_dirt"},
		interval = 10,
		chance = 2,
		action = function(pos, node)
			minetest.add_particlespawner(
				309, --amount was16
				13, --time
				{x=pos.x-0.1, y=pos.y-0.1, z=pos.z-0.1}, --minpos
				{x=pos.x+0.1, y=pos.y+12.5, z=pos.z+0.1}, --maxpos
				{x=-3.5, y=0.5, z=-3.5}, --minvel
				{x=3.5, y=32.5, z=3.5}, --maxvel
				{x=0,y=0,z=0}, --minacc
				{x=0,y=3,z=0}, --maxacc
				0.5, --minexptime
				3, --maxexptime
				0.21, --minsize
				10, --maxsize
				true, --collisiondetection
				--"nether_particle.png" --texture
				"default_dirt.png" --texture
			)
		end,
	})

	minetest.register_abm({
		nodenames = {"3d_armor_plus:power_dirt"},
		interval = 10,
		chance = 2,
		action = function(pos, node)
			minetest.add_particlespawner(
				119, --amount was16
				13, --time
				{x=pos.x-0.5, y=pos.y-0.5, z=pos.z-0.5}, --minpos
				{x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, --maxpos
				{x=-0.5, y=-0.5, z=-0.5}, --minvel
				{x=0.5, y=0.5, z=0.5}, --maxvel
				{x=0,y=0,z=0}, --minacc
				{x=0,y=0,z=0}, --maxacc
				0.5, --minexptime
				3, --maxexptime
				1, --minsize
				7, --maxsize
				false, --collisiondetection
				--"nether_particle.png" --texture
				"fire_basic_flame.png" --texture
			)
		end,
	})
	
--A silly "power Dirt" block WIP	
--punch to heal
--walk into to die
--emits showering dirt and flames!
--[[
	minetest.register_craft({
		output = '3d_armor_plus:power_dirt',
		recipe = {
			{"default:dirt", "default:dirt", "default:dirt"},
			{"default:dirt", "default:goldblock", "default:dirt"},
			{"default:dirt", "bucket:bucket_lava", "default:dirt"},
		},
	})
]]

	minetest.register_tool("3d_armor_plus:helmet_dirt", {
		description = "Dirt Helmet",
		inventory_image = "3d_armor_inv_helmet_dirt.png",
		groups = {armor_head=5, armor_heal=30, armor_use=100, armor_fire=1},
		wear = 0,
	})
	minetest.register_tool("3d_armor_plus:chestplate_dirt", {
		description = "Dirt Chestplate",
		inventory_image = "3d_armor_inv_chestplate_dirt.png",
		groups = {armor_torso=10, armor_heal=30, armor_use=100, armor_fire=1},
		wear = 0,
	})
	minetest.register_tool("3d_armor_plus:leggings_dirt", {
		description = "Dirt Leggings",
		inventory_image = "3d_armor_inv_leggings_dirt.png",
		groups = {armor_legs=5, armor_heal=30, armor_use=100, armor_fire=1,physics_speed=1.1},
		wear = 0,
	})
	minetest.register_tool("3d_armor_plus:boots_dirt", {
		description = "Dirt Boots",
		inventory_image = "3d_armor_inv_boots_dirt.png",
		groups = {armor_feet=5, armor_heal=30, armor_use=100, armor_fire=1, physics_jump=0.9,physics_speed=1.1},
		wear = 0,
	})
end

if craft_ingreds.obsidian then

	minetest.register_tool("3d_armor_plus:helmet_obsidian", {
		description = "Obby Helmet",
		inventory_image = "3d_armor_inv_helmet_obsidian.png^[colorize:black:240",
		groups = {armor_head=15, armor_heal=30, armor_use=40, armor_fire=1, physics_speed=-0.1},
		wear = 0,
	})
	minetest.register_tool("3d_armor_plus:chestplate_obsidian", {
		description = "Obby Chestplate",
		inventory_image = "3d_armor_inv_chestplate_obsidian.png^[colorize:black:240",
		groups = {armor_torso=20, armor_heal=30, armor_use=40, armor_fire=1, physics_speed=-0.1},
		wear = 0,
	})
	minetest.register_tool("3d_armor_plus:leggings_obsidian", {
		description = "Obby Leggings",
		inventory_image = "3d_armor_inv_leggings_obsidian.png^[colorize:black:240",
		groups = {armor_legs=15, armor_heal=30, armor_use=40, armor_fire=1, physics_speed=-0.1},
		wear = 0,
	})
	minetest.register_tool("3d_armor_plus:boots_obsidian", {
		description = "Obby Boots",
		inventory_image = "3d_armor_inv_boots_obsidian.png^[colorize:black:240",
		groups = {armor_feet=15, armor_heal=30, armor_use=60, armor_fire=1, physics_jump=-0.2, physics_speed=-0.1},
		wear = 0,
	})
end



------------------------------------------------------------

for k, v in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "3d_armor_plus:helmet_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "3d_armor_plus:chestplate_"..k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v},
		},
	})
	minetest.register_craft({
		output = "3d_armor_plus:leggings_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "3d_armor_plus:boots_"..k,
		recipe = {
			{v, "", v},
			{v, "", v},
		},
	})
end


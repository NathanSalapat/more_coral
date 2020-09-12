local coral_color = {
   {'white',      'White',      '#ffffff'},
   {'grey',       'Grey',       '#808080'},
   {'dark_grey',  'Dark grey',  '#3C3C3C'},
   {'black',      'Black',      '#0C0C0C'},
   {'violet',     'Violet',     '#EE82EE'},
   {'blue',       'Blue',       '#0000FF'},
   {'cyan',       'Cyan',       '#00FFFF'},
   {'dark_green', 'Dark green', '#002600'},
   {'green',      'Green',      '#008000'},
   {'yellow',     'Yellow',     '#FFFF00'},
   {'brown',      'Brown',      '#A52A2A'},
   {'orange',     'Orange',     '#FFA500'},
   {'red',        'Red',        '#FF0000'},
   {'magenta',    'Magenta',    '#FF00FF'},
   {'pink',       'Pink',       '#ffc0cb'},
}

for i in ipairs(coral_color) do
   local col = coral_color[i][1]
   local Col = coral_color[i][2]
   local hex = coral_color[i][3]

   minetest.register_node('more_coral:coral_'..col, {
      description = Col..' Coral',
      tiles = {'more_coral_coral_base.png^[multiply:'..hex..':100'},
      groups = {cracky = 3, coral = 1},
      drops = 'default:coral_skeleton',
      sounds = default.node_sound_stone_defaults(),
   })

   minetest.register_craft({
      type = 'shapeless',
      output = 'more_coral:coral_'..col,
      recipe = {'default:coral_skeleton', 'dye:'..col},
   })
end

minetest.register_abm({
   nodenames = {'group:coral'},
   neighbors = {'air'},
   interval = 17,
   chance = 5,
   catch_up = false,
   action = function(pos, node)
      minetest.set_node(pos, {name = 'default:coral_skeleton'})
   end,
})

minetest.register_decoration({
   name = "default:corals",
   deco_type = "simple",
   place_on = {"default:sand"},
   place_offset_y = -1,
   sidelen = 4,
   noise_params = {
      offset = -4,
      scale = 4,
      spread = {x = 50, y = 50, z = 50},
      seed = 13854352,
      octaves = 3,
      persist = 0.7,
   },
   biomes = {
      "desert_ocean",
      "savanna_ocean",
      "rainforest_ocean",
   },
   y_max = -2,
   y_min = -12,
   flags = "force_placement",
   decoration = {
      "more_coral:coral_grey", "more_coral:coral_violet",
      "more_coral:coral_blue", "more_coral:coral_cyan",
      "more_coral:coral_green", "more_coral:coral_yellow",
      "more_coral:coral_pink", "more_coral:coral_red",
   },
})

global.ui_modal_open = true;

depth = -10000;
image_speed = 0;
image_index = 0;

hand_slot_x = x + 122;
hand_slot_y = y + 85;
hand_slot_w = 100;
hand_slot_h = 90;
pocket_visuals = array_create(8, noone);
pocket_display_count = -1;
use_whimsy_pocket_layout = true;

var _popup_right = x - sprite_get_xoffset(sprite_index) + sprite_get_width(sprite_index);
var _popup_top = y - sprite_get_yoffset(sprite_index);
var _close_margin = 18;

close_button = instance_create_layer(_popup_right - _close_margin, _popup_top + _close_margin, "pop_up", obj_ui_close);
close_button.owner_popup = id;
close_button.depth = depth - 3;

box_steel = instance_create_layer(x - 213, y - 159, "pop_up", obj_box_steel);
box_steel.owner_popup = id;
box_steel.material = "steel";
box_steel.icon_object = obj_icon_steel;
box_steel.depth = depth - 1;

box_wood = instance_create_layer(x - 125, y - 159, "pop_up", obj_box_wood);
box_wood.owner_popup = id;
box_wood.material = "wood";
box_wood.icon_object = obj_icon_wood;
box_wood.depth = depth - 1;

box_sand = instance_create_layer(x + 37, y - 159, "pop_up", obj_box_sand);
box_sand.owner_popup = id;
box_sand.material = "sand";
box_sand.icon_object = obj_icon_sand;
box_sand.depth = depth - 1;

box_water = instance_create_layer(x + 126, y - 159, "pop_up", obj_box_water);
box_water.owner_popup = id;
box_water.material = "water";
box_water.icon_object = obj_icon_water;
box_water.depth = depth - 1;

box_cotton = instance_create_layer(x - 213, y - 92, "pop_up", obj_box_cotton);
box_cotton.owner_popup = id;
box_cotton.material = "cotton";
box_cotton.icon_object = obj_icon_cotton;
box_cotton.depth = depth - 1;

box_time = instance_create_layer(x - 213, y - 20, "pop_up", obj_box_time);
box_time.owner_popup = id;
box_time.material = "time";
box_time.icon_object = obj_icon_time;
box_time.depth = depth - 1;

box_fate = instance_create_layer(x - 213, y + 47, "pop_up", obj_box_fate);
box_fate.owner_popup = id;
box_fate.material = "fate";
box_fate.icon_object = obj_icon_fate;
box_fate.depth = depth - 1;

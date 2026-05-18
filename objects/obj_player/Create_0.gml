move_speed = 3;
walk_image_speed = 1.5;
target_x = x;
target_y = y;
has_target = false;
target_interact = noone;
target_interact_facing = "front";

global.ui_modal_open = false;
global.player_id = id;

pocket_capacity = 8;
pocket_count = 0;
pocket_next_stack_order = 0;
pocket_items = array_create(pocket_capacity, undefined);

walk_min_x = 24;
walk_max_x = room_width - 24;
walk_min_y = 160;
walk_max_y = room_height - 8;

facing = "front";

sprite_index = spr_player_walk_front;
image_speed = 0;
image_index = 0;

var _mouse_over = mouse_x >= bbox_left
    && mouse_x <= bbox_right
    && mouse_y >= bbox_top
    && mouse_y <= bbox_bottom;

if (mouse_check_button_pressed(mb_left) && _mouse_over) {
    if (instance_exists(owner_popup) && icon_object != noone && instance_exists(global.player_id)) {
        with (global.player_id) {
            if (pocket_count < pocket_capacity) {
                for (var _slot = 0; _slot < pocket_capacity; _slot++) {
                    if (is_undefined(pocket_items[_slot])) {
                        pocket_next_stack_order += 1;

                        pocket_items[_slot] = {
                            material: other.material,
                            icon_object: other.icon_object,
                            stack_order: pocket_next_stack_order,
                            hand_offset_x: random_range(-12, 12),
                            hand_offset_y: random_range(-10, 10),
                            hand_angle: random_range(-22, 22),
                            hand_scale: random_range(0.85, 1.15)
                        };
                        pocket_count += 1;
                        break;
                    }
                }
            }
        }
    }
}

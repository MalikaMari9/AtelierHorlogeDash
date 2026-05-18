if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
}

if (instance_exists(global.player_id)) {
    var _player = global.player_id;

    if (mouse_check_button_pressed(mb_left)) {
        for (var _i = 0; _i < array_length(pocket_visuals); _i++) {
            var _icon = pocket_visuals[_i];

            if (instance_exists(_icon)) {
                var _mouse_over = mouse_x >= _icon.bbox_left
                    && mouse_x <= _icon.bbox_right
                    && mouse_y >= _icon.bbox_top
                    && mouse_y <= _icon.bbox_bottom;

                if (_mouse_over) {
                    _player.pocket_items[_i] = undefined;
                    _player.pocket_count = max(0, _player.pocket_count - 1);
                    pocket_display_count = -1;
                    break;
                }
            }
        }
    }

    if (pocket_display_count != _player.pocket_count) {
        for (var _i = 0; _i < array_length(pocket_visuals); _i++) {
            if (instance_exists(pocket_visuals[_i])) {
                with (pocket_visuals[_i]) {
                    instance_destroy();
                }
            }

            pocket_visuals[_i] = noone;
        }

        var _cols = 4;
        var _spacing_x = 24;
        var _spacing_y = 32;
        var _start_x = hand_slot_x - ((_cols - 1) * _spacing_x) * 0.5;
        var _start_y = hand_slot_y - _spacing_y * 0.5;

        for (var _i = 0; _i < _player.pocket_capacity; _i++) {
            var _item = _player.pocket_items[_i];

            if (!is_undefined(_item)) {
                var _col = _i mod _cols;
                var _row = _i div _cols;
                var _icon_x = _start_x + _col * _spacing_x;
                var _icon_y = _start_y + _row * _spacing_y;
                var _icon_angle = 0;
                var _icon_scale = 1;

                if (use_whimsy_pocket_layout) {
                    _icon_x += _item.hand_offset_x;
                    _icon_y += _item.hand_offset_y;
                    _icon_angle = _item.hand_angle;
                    _icon_scale = _item.hand_scale;
                }

                pocket_visuals[_i] = instance_create_layer(_icon_x, _icon_y, "pop_up", _item.icon_object);
                pocket_visuals[_i].depth = depth - 2 - _item.stack_order;
                pocket_visuals[_i].image_angle = _icon_angle;
                pocket_visuals[_i].image_xscale = _icon_scale;
                pocket_visuals[_i].image_yscale = _icon_scale;
            }
        }

        pocket_display_count = _player.pocket_count;
    }
}

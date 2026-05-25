if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
}

if (!instance_exists(global.player_id)) {
    exit;
}

var _player = global.player_id;
var _mouse_pressed = mouse_check_button_pressed(mb_left);

if (_mouse_pressed) {
    var _cleared_ingredient = false;
    var _changed_row = -1;
    var _craft_button_left = x + 56;
    var _craft_button_top = y + 44;
    var _craft_button_w = 15 * 6.5333333;
    var _craft_button_h = 15 * 2.1333334;

    if (point_in_rectangle(mouse_x, mouse_y, _craft_button_left, _craft_button_top, _craft_button_left + _craft_button_w, _craft_button_top + _craft_button_h)) {
        var _craft_window = instance_find(obj_craft_window, 0);
        var _started_craft = false;

        if (instance_exists(_craft_window)) {
            for (var _row = 0; _row < array_length(craft_slots); _row++) {
                var _craft_slot = craft_slots[_row];

                if (_row < array_length(_craft_window.output_slots) && !is_undefined(_craft_slot.result_recipe) && !_craft_window.slot_reserved[_row] && !instance_exists(_craft_window.slot_visuals[_row])) {
                    var _pocket_indices = [];

                    for (var _ingredient_index = 0; _ingredient_index < array_length(_craft_slot.ingredients); _ingredient_index++) {
                        var _ingredient = _craft_slot.ingredients[_ingredient_index];

                        if (!is_undefined(_ingredient)) {
                            array_push(_pocket_indices, _ingredient.pocket_index);
                        }
                    }

                    if (array_length(_pocket_indices) == 3) {
                        _craft_window.slot_reserved[_row] = true;
                        _craft_window.slot_timer[_row] = _craft_window.craft_time_seconds * room_speed;
                        _craft_window.slot_recipe[_row] = _craft_slot.result_recipe;
                        _craft_window.slot_pocket_indices[_row] = _pocket_indices;
                        _started_craft = true;

                        for (var _slot = 0; _slot < array_length(_craft_slot.ingredient_visuals); _slot++) {
                            if (instance_exists(_craft_slot.ingredient_visuals[_slot])) {
                                with (_craft_slot.ingredient_visuals[_slot]) {
                                    instance_destroy();
                                }
                            }

                            _craft_slot.ingredients[_slot] = undefined;
                            _craft_slot.ingredient_visuals[_slot] = noone;
                        }

                        if (instance_exists(_craft_slot.result_visual)) {
                            with (_craft_slot.result_visual) {
                                instance_destroy();
                            }
                        }

                        _craft_slot.result_visual = noone;
                        _craft_slot.result_recipe = undefined;
                    }
                }
            }
        }

        if (_started_craft) {
            instance_destroy();
        }

        exit;
    }

    for (var _row = 0; _row < array_length(craft_slots); _row++) {
        var _craft_slot = craft_slots[_row];

        if (point_in_rectangle(mouse_x, mouse_y, _craft_slot.row_left, _craft_slot.row_top, _craft_slot.row_left + _craft_slot.row_width, _craft_slot.row_top + _craft_slot.row_height)) {
            selected_craft_slot = _row;
        }

        for (var _slot = 0; _slot < array_length(_craft_slot.ingredient_slots); _slot++) {
            var _ingredient_slot = _craft_slot.ingredient_slots[_slot];

            if (point_in_rectangle(mouse_x, mouse_y, _ingredient_slot.left, _ingredient_slot.top, _ingredient_slot.left + _ingredient_slot.width, _ingredient_slot.top + _ingredient_slot.height)) {
                if (!is_undefined(_craft_slot.ingredients[_slot])) {
                    var _removed_pocket_index = _craft_slot.ingredients[_slot].pocket_index;

                    if (instance_exists(_craft_slot.ingredient_visuals[_slot])) {
                        with (_craft_slot.ingredient_visuals[_slot]) {
                            instance_destroy();
                        }
                    }

                    _craft_slot.ingredients[_slot] = undefined;
                    _craft_slot.ingredient_visuals[_slot] = noone;
                    _cleared_ingredient = true;
                    _changed_row = _row;

                    var _removed_item = _player.pocket_items[_removed_pocket_index];

                    if (!is_undefined(_removed_item) && !instance_exists(pocket_visuals[_removed_pocket_index])) {
                        var _pocket_slot = pocket_slots[_removed_pocket_index];
                        var _pocket_icon_x = _pocket_slot.left + _pocket_slot.width * 0.5;
                        var _pocket_icon_y = _pocket_slot.top + _pocket_slot.height * 0.5;

                        pocket_visuals[_removed_pocket_index] = instance_create_layer(_pocket_icon_x, _pocket_icon_y, "pop_up", _removed_item.icon_object);
                        pocket_visuals[_removed_pocket_index].depth = depth - 2;
                    }
                }
            }
        }
    }

    if (!_cleared_ingredient) {
        for (var _pocket_index = 0; _pocket_index < _player.pocket_capacity; _pocket_index++) {
            var _pocket_slot = pocket_slots[_pocket_index];

            if (point_in_rectangle(mouse_x, mouse_y, _pocket_slot.left, _pocket_slot.top, _pocket_slot.left + _pocket_slot.width, _pocket_slot.top + _pocket_slot.height)) {
                var _item = _player.pocket_items[_pocket_index];

                if (!is_undefined(_item)) {
                    var _already_assigned = false;

                    for (var _row_check = 0; _row_check < array_length(craft_slots); _row_check++) {
                        var _check_slot = craft_slots[_row_check];

                        for (var _ingredient_check = 0; _ingredient_check < array_length(_check_slot.ingredients); _ingredient_check++) {
                            var _check_item = _check_slot.ingredients[_ingredient_check];

                            if (!is_undefined(_check_item) && _check_item.pocket_index == _pocket_index) {
                                _already_assigned = true;
                            }
                        }
                    }

                    if (!_already_assigned) {
                        var _active_slot = craft_slots[selected_craft_slot];

                        for (var _ingredient_index = 0; _ingredient_index < array_length(_active_slot.ingredients); _ingredient_index++) {
                            if (is_undefined(_active_slot.ingredients[_ingredient_index])) {
                                var _target_slot = _active_slot.ingredient_slots[_ingredient_index];
                                var _icon_x = _target_slot.left + _target_slot.width * 0.5;
                                var _icon_y = _target_slot.top + _target_slot.height * 0.5;

                                _active_slot.ingredients[_ingredient_index] = {
                                    material: _item.material,
                                    icon_object: _item.icon_object,
                                    pocket_index: _pocket_index
                                };

                                _active_slot.ingredient_visuals[_ingredient_index] = instance_create_layer(_icon_x, _icon_y, "pop_up", _item.icon_object);
                                _active_slot.ingredient_visuals[_ingredient_index].depth = depth - 3;

                                if (instance_exists(pocket_visuals[_pocket_index])) {
                                    with (pocket_visuals[_pocket_index]) {
                                        instance_destroy();
                                    }
                                }

                                pocket_visuals[_pocket_index] = noone;
                                _changed_row = selected_craft_slot;
                                break;
                            }
                        }
                    }
                }

                break;
            }
        }
    }

    if (_changed_row >= 0) {
        var _updated_slot = craft_slots[_changed_row];

        if (instance_exists(_updated_slot.result_visual)) {
            with (_updated_slot.result_visual) {
                instance_destroy();
            }
        }

        _updated_slot.result_visual = noone;
        _updated_slot.result_recipe = undefined;

        var _materials = [];

        for (var _ingredient_index = 0; _ingredient_index < array_length(_updated_slot.ingredients); _ingredient_index++) {
            var _ingredient = _updated_slot.ingredients[_ingredient_index];

            if (!is_undefined(_ingredient)) {
                array_push(_materials, _ingredient.material);
            }
        }

        if (array_length(_materials) == 3) {
            var _recipe = scr_craft_recipe_find(_materials);

            if (!is_undefined(_recipe)) {
                var _result_x = _updated_slot.result_left + _updated_slot.result_width * 0.5;
                var _result_y = _updated_slot.result_top + _updated_slot.result_height * 0.5;

                _updated_slot.result_recipe = _recipe;
                _updated_slot.result_visual = instance_create_layer(_result_x, _result_y, "pop_up", obj_rectangle_icon);
                _updated_slot.result_visual.sprite_index = _recipe.result_icon_sprite;
                _updated_slot.result_visual.image_speed = 0;
                _updated_slot.result_visual.depth = depth - 3;
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

    for (var _i = 0; _i < _player.pocket_capacity; _i++) {
        var _item = _player.pocket_items[_i];

        if (!is_undefined(_item)) {
            var _slot = pocket_slots[_i];
            var _icon_x = _slot.left + _slot.width * 0.5;
            var _icon_y = _slot.top + _slot.height * 0.5;
            var _assigned = false;

            for (var _row = 0; _row < array_length(craft_slots); _row++) {
                var _craft_slot = craft_slots[_row];

                for (var _ingredient_index = 0; _ingredient_index < array_length(_craft_slot.ingredients); _ingredient_index++) {
                    var _ingredient = _craft_slot.ingredients[_ingredient_index];

                    if (!is_undefined(_ingredient) && _ingredient.pocket_index == _i) {
                        _assigned = true;
                    }
                }
            }

            var _craft_window = instance_find(obj_craft_window, 0);

            if (instance_exists(_craft_window)) {
                for (var _window_slot = 0; _window_slot < array_length(_craft_window.slot_pocket_indices); _window_slot++) {
                    var _pocket_indices = _craft_window.slot_pocket_indices[_window_slot];

                    if (!is_undefined(_pocket_indices)) {
                        for (var _pocket_index = 0; _pocket_index < array_length(_pocket_indices); _pocket_index++) {
                            if (_pocket_indices[_pocket_index] == _i) {
                                _assigned = true;
                            }
                        }
                    }
                }
            }

            if (!_assigned) {
                pocket_visuals[_i] = instance_create_layer(_icon_x, _icon_y, "pop_up", _item.icon_object);
                pocket_visuals[_i].depth = depth - 2;
            }
        }
    }

    pocket_display_count = _player.pocket_count;
}

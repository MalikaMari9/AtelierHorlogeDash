for (var _slot = 0; _slot < array_length(output_slots); _slot++) {
    if (slot_reserved[_slot]) {
        slot_timer[_slot] -= 1;

        if (slot_timer[_slot] <= 0) {
            var _recipe = slot_recipe[_slot];
            var _output_slot = output_slots[_slot];

            if (!is_undefined(_recipe) && !instance_exists(slot_visuals[_slot])) {
                slot_visuals[_slot] = instance_create_layer(_output_slot.x, _output_slot.y, layer, _recipe.result_object);
                slot_visuals[_slot].depth = depth - 1;
            }

            if (variable_global_exists("player_id") && instance_exists(global.player_id)) {
                var _player = global.player_id;
                var _pocket_indices = slot_pocket_indices[_slot];

                if (!is_undefined(_pocket_indices)) {
                    for (var _i = 0; _i < array_length(_pocket_indices); _i++) {
                        var _pocket_index = _pocket_indices[_i];

                        if (_pocket_index >= 0 && _pocket_index < _player.pocket_capacity && !is_undefined(_player.pocket_items[_pocket_index])) {
                            _player.pocket_items[_pocket_index] = undefined;
                            _player.pocket_count = max(0, _player.pocket_count - 1);
                        }
                    }
                }
            }

            slot_reserved[_slot] = false;
            slot_timer[_slot] = 0;
            slot_pocket_indices[_slot] = undefined;
        }
    }
}

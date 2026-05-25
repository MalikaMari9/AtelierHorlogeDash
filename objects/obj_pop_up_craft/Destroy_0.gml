global.ui_modal_open = false;

if (instance_exists(close_button)) {
    with (close_button) {
        instance_destroy();
    }
}

for (var _i = 0; _i < array_length(pocket_visuals); _i++) {
    if (instance_exists(pocket_visuals[_i])) {
        with (pocket_visuals[_i]) {
            instance_destroy();
        }
    }
}

for (var _row = 0; _row < array_length(craft_slots); _row++) {
    var _craft_slot = craft_slots[_row];

    for (var _slot = 0; _slot < array_length(_craft_slot.ingredient_visuals); _slot++) {
        if (instance_exists(_craft_slot.ingredient_visuals[_slot])) {
            with (_craft_slot.ingredient_visuals[_slot]) {
                instance_destroy();
            }
        }
    }

    if (instance_exists(_craft_slot.result_visual)) {
        with (_craft_slot.result_visual) {
            instance_destroy();
        }
    }
}

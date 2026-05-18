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

if (instance_exists(box_steel)) {
    with (box_steel) {
        instance_destroy();
    }
}

if (instance_exists(box_wood)) {
    with (box_wood) {
        instance_destroy();
    }
}

if (instance_exists(box_sand)) {
    with (box_sand) {
        instance_destroy();
    }
}

if (instance_exists(box_water)) {
    with (box_water) {
        instance_destroy();
    }
}

if (instance_exists(box_cotton)) {
    with (box_cotton) {
        instance_destroy();
    }
}

if (instance_exists(box_time)) {
    with (box_time) {
        instance_destroy();
    }
}

if (instance_exists(box_fate)) {
    with (box_fate) {
        instance_destroy();
    }
}

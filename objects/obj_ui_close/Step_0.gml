var _mouse_over = mouse_x >= bbox_left
    && mouse_x <= bbox_right
    && mouse_y >= bbox_top
    && mouse_y <= bbox_bottom;

if (mouse_check_button_pressed(mb_left) && _mouse_over) {
    if (instance_exists(owner_popup)) {
        with (owner_popup) {
            instance_destroy();
        }
    } else {
        instance_destroy();
    }
}

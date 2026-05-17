if (keyboard_check(vk_shift)) {
    var _cam_x = 0;
    var _cam_y = 0;
    var _scale_x = display_get_gui_width() / room_width;
    var _scale_y = display_get_gui_height() / room_height;

    var _old_alpha = draw_get_alpha();
    var _old_colour = draw_get_colour();

    draw_set_alpha(0.85);

    draw_set_colour(c_lime);
    draw_rectangle(
        (bbox_left - _cam_x) * _scale_x,
        (bbox_top - _cam_y) * _scale_y,
        (bbox_right - _cam_x) * _scale_x,
        (bbox_bottom - _cam_y) * _scale_y,
        true
    );

    draw_set_colour(c_red);
    for (var _i = 0; _i < instance_number(obj_wall); _i++) {
        var _inst = instance_find(obj_wall, _i);
        draw_rectangle(
            (_inst.bbox_left - _cam_x) * _scale_x,
            (_inst.bbox_top - _cam_y) * _scale_y,
            (_inst.bbox_right - _cam_x) * _scale_x,
            (_inst.bbox_bottom - _cam_y) * _scale_y,
            true
        );
    }

    draw_set_colour(c_yellow);
    for (var _i = 0; _i < instance_number(obj_desk); _i++) {
        var _inst = instance_find(obj_desk, _i);
        draw_rectangle(
            (_inst.bbox_left - _cam_x) * _scale_x,
            (_inst.bbox_top - _cam_y) * _scale_y,
            (_inst.bbox_right - _cam_x) * _scale_x,
            (_inst.bbox_bottom - _cam_y) * _scale_y,
            true
        );
    }

    draw_set_colour(c_aqua);
    for (var _i = 0; _i < instance_number(obj_raw_matt_drawer); _i++) {
        var _inst = instance_find(obj_raw_matt_drawer, _i);
        draw_rectangle(
            (_inst.bbox_left - _cam_x) * _scale_x,
            (_inst.bbox_top - _cam_y) * _scale_y,
            (_inst.bbox_right - _cam_x) * _scale_x,
            (_inst.bbox_bottom - _cam_y) * _scale_y,
            true
        );
    }
    for (var _i = 0; _i < instance_number(obj_trash); _i++) {
        var _inst = instance_find(obj_trash, _i);
        draw_rectangle(
            (_inst.bbox_left - _cam_x) * _scale_x,
            (_inst.bbox_top - _cam_y) * _scale_y,
            (_inst.bbox_right - _cam_x) * _scale_x,
            (_inst.bbox_bottom - _cam_y) * _scale_y,
            true
        );
    }
    for (var _i = 0; _i < instance_number(obj_craft_room); _i++) {
        var _inst = instance_find(obj_craft_room, _i);
        draw_rectangle(
            (_inst.bbox_left - _cam_x) * _scale_x,
            (_inst.bbox_top - _cam_y) * _scale_y,
            (_inst.bbox_right - _cam_x) * _scale_x,
            (_inst.bbox_bottom - _cam_y) * _scale_y,
            true
        );
    }
    for (var _i = 0; _i < instance_number(obj_craft_window); _i++) {
        var _inst = instance_find(obj_craft_window, _i);
        draw_rectangle(
            (_inst.bbox_left - _cam_x) * _scale_x,
            (_inst.bbox_top - _cam_y) * _scale_y,
            (_inst.bbox_right - _cam_x) * _scale_x,
            (_inst.bbox_bottom - _cam_y) * _scale_y,
            true
        );
    }

    draw_set_colour(_old_colour);
    draw_set_alpha(_old_alpha);
}

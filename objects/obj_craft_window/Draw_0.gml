draw_self();

if (show_debug_slots) {
    var _old_alpha = draw_get_alpha();
    var _old_colour = draw_get_colour();
    var _old_halign = draw_get_halign();
    var _old_valign = draw_get_valign();

    draw_set_alpha(0.85);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    for (var _slot = 0; _slot < array_length(output_slots); _slot++) {
        var _output_slot = output_slots[_slot];

        if (slot_reserved[_slot]) {
            draw_set_colour(c_orange);
        } else if (instance_exists(slot_visuals[_slot])) {
            draw_set_colour(c_lime);
        } else {
            draw_set_colour(c_yellow);
        }

        draw_rectangle(
            _output_slot.x - _output_slot.width * 0.5,
            _output_slot.y - _output_slot.height * 0.5,
            _output_slot.x + _output_slot.width * 0.5,
            _output_slot.y + _output_slot.height * 0.5,
            true
        );

        if (slot_reserved[_slot]) {
            draw_text(_output_slot.x, _output_slot.y, string(ceil(slot_timer[_slot] / room_speed)));
        }
    }

    draw_set_alpha(_old_alpha);
    draw_set_colour(_old_colour);
    draw_set_halign(_old_halign);
    draw_set_valign(_old_valign);
}

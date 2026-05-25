var _old_alpha = draw_get_alpha();
var _old_colour = draw_get_colour();

draw_set_alpha(0.55);
draw_set_colour(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_self();

var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text(x + 56 + (15 * 6.5333333) * 0.5, y + 44 + (15 * 2.1333334) * 0.5, "Craft");

for (var _row = 0; _row < array_length(craft_slots); _row++) {
    var _craft_name_slot = craft_slots[_row];

    if (!is_undefined(_craft_name_slot.result_recipe)) {
        var _name_slot_w = 15 * 11.333333;
        var _name_slot_h = 15 * 1.4666667;
        var _name_slot_x = x - 48;
        var _name_slot_y = y - 224 + (_row * 137);

        draw_text(
            _name_slot_x + _name_slot_w * 0.5,
            _name_slot_y + _name_slot_h * 0.5,
            _craft_name_slot.result_recipe.name
        );
    }
}

if (show_debug_slots) {
    draw_set_alpha(0.9);
    draw_set_colour(c_lime);

    var _normal_w = 15 * 3.5333333;
    var _normal_h = 15 * 3.4;
    var _large_w = 15 * 4.6170125;
    var _large_h = 15 * 4.6;
    var _wide_w = 15 * 6.5333333;
    var _wide_h = 15 * 2.1333334;
    var _craft_slot_w = 15 * 20.466667;
    var _craft_slot_h = 15 * 7.6666665;
    var _name_slot_w = 15 * 11.333333;
    var _name_slot_h = 15 * 1.4666667;

    for (var _row = 0; _row < array_length(craft_slots); _row++) {
        var _craft_slot = craft_slots[_row];

        if (_row == selected_craft_slot) {
            draw_set_colour(c_aqua);
        } else {
            draw_set_colour(c_yellow);
        }

        draw_rectangle(
            _craft_slot.row_left,
            _craft_slot.row_top,
            _craft_slot.row_left + _craft_slot.row_width,
            _craft_slot.row_top + _craft_slot.row_height,
            true
        );
    }

    draw_set_colour(c_lime);
    draw_rectangle(x - 48, y - 224, x - 48 + _name_slot_w, y - 224 + _name_slot_h, true);
    draw_rectangle(x - 48, y - 87, x - 48 + _name_slot_w, y - 87 + _name_slot_h, true);

    draw_rectangle(x - 142, y - 212, x - 142 + _large_w, y - 212 + _large_h, true);
    draw_rectangle(x - 142, y - 74, x - 142 + _large_w, y - 74 + _large_h, true);

    draw_rectangle(x - 47, y - 194, x - 47 + _normal_w, y - 194 + _normal_h, true);
    draw_rectangle(x + 20, y - 194, x + 20 + _normal_w, y - 194 + _normal_h, true);
    draw_rectangle(x + 87, y - 194, x + 87 + _normal_w, y - 194 + _normal_h, true);

    draw_rectangle(x - 47, y - 56, x - 47 + _normal_w, y - 56 + _normal_h, true);
    draw_rectangle(x + 20, y - 56, x + 20 + _normal_w, y - 56 + _normal_h, true);
    draw_rectangle(x + 87, y - 56, x + 87 + _normal_w, y - 56 + _normal_h, true);

    draw_rectangle(x - 139, y + 107, x - 139 + _normal_w, y + 107 + _normal_h, true);
    draw_rectangle(x - 65, y + 107, x - 65 + _normal_w, y + 107 + _normal_h, true);
    draw_rectangle(x + 9.5, y + 107, x + 9.5 + _normal_w, y + 107 + _normal_h, true);
    draw_rectangle(x + 83.5, y + 107, x + 83.5 + _normal_w, y + 107 + _normal_h, true);

    draw_rectangle(x - 139, y + 176, x - 139 + _normal_w, y + 176 + _normal_h, true);
    draw_rectangle(x - 65, y + 176, x - 65 + _normal_w, y + 176 + _normal_h, true);
    draw_rectangle(x + 9.5, y + 176, x + 9.5 + _normal_w, y + 176 + _normal_h, true);
    draw_rectangle(x + 83.5, y + 176, x + 83.5 + _normal_w, y + 176 + _normal_h, true);

    draw_rectangle(x + 56, y + 44, x + 56 + _wide_w, y + 44 + _wide_h, true);
}

draw_set_colour(_old_colour);
draw_set_alpha(_old_alpha);
draw_set_halign(_old_halign);
draw_set_valign(_old_valign);

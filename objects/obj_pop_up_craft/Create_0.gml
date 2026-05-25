global.ui_modal_open = true;

depth = -10000;
image_speed = 0;
image_index = 0;
show_debug_slots = true;
pocket_visuals = array_create(8, noone);
pocket_display_count = -1;
selected_craft_slot = 0;

var _normal_w = 15 * 3.5333333;
var _normal_h = 15 * 3.4;
var _large_w = 15 * 4.6170125;
var _large_h = 15 * 4.6;
var _craft_slot_w = 15 * 20.466667;
var _craft_slot_h = 15 * 7.6666665;

pocket_slots = [
    { left: x - 139, top: y + 107, width: _normal_w, height: _normal_h },
    { left: x - 65, top: y + 107, width: _normal_w, height: _normal_h },
    { left: x + 9.5, top: y + 107, width: _normal_w, height: _normal_h },
    { left: x + 83.5, top: y + 107, width: _normal_w, height: _normal_h },
    { left: x - 139, top: y + 176, width: _normal_w, height: _normal_h },
    { left: x - 65, top: y + 176, width: _normal_w, height: _normal_h },
    { left: x + 9.5, top: y + 176, width: _normal_w, height: _normal_h },
    { left: x + 83.5, top: y + 176, width: _normal_w, height: _normal_h }
];

craft_slots = [
    {
        row_left: x - 152,
        row_top: y - 233,
        row_width: _craft_slot_w,
        row_height: _craft_slot_h,
        result_left: x - 142,
        result_top: y - 212,
        result_width: _large_w,
        result_height: _large_h,
        ingredient_slots: [
            { left: x - 47, top: y - 194, width: _normal_w, height: _normal_h },
            { left: x + 20, top: y - 194, width: _normal_w, height: _normal_h },
            { left: x + 87, top: y - 194, width: _normal_w, height: _normal_h }
        ],
        ingredients: array_create(3, undefined),
        ingredient_visuals: array_create(3, noone),
        result_recipe: undefined,
        result_visual: noone
    },
    {
        row_left: x - 152,
        row_top: y - 96,
        row_width: _craft_slot_w,
        row_height: _craft_slot_h,
        result_left: x - 142,
        result_top: y - 74,
        result_width: _large_w,
        result_height: _large_h,
        ingredient_slots: [
            { left: x - 47, top: y - 56, width: _normal_w, height: _normal_h },
            { left: x + 20, top: y - 56, width: _normal_w, height: _normal_h },
            { left: x + 87, top: y - 56, width: _normal_w, height: _normal_h }
        ],
        ingredients: array_create(3, undefined),
        ingredient_visuals: array_create(3, noone),
        result_recipe: undefined,
        result_visual: noone
    }
];

var _popup_right = x - sprite_get_xoffset(sprite_index) + sprite_get_width(sprite_index);
var _popup_top = y - sprite_get_yoffset(sprite_index);
var _close_margin = 18;

close_button = instance_create_layer(_popup_right - _close_margin, _popup_top + _close_margin, "pop_up", obj_ui_close);
close_button.owner_popup = id;
close_button.depth = depth - 1;

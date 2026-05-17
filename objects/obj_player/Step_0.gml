var _input_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var _input_y = keyboard_check(vk_down) - keyboard_check(vk_up);

_input_x += keyboard_check(ord("D")) - keyboard_check(ord("A"));
_input_y += keyboard_check(ord("S")) - keyboard_check(ord("W"));

var _move_x = 0;
var _move_y = 0;

if (_input_x != 0 || _input_y != 0) {
    has_target = false;

    var _input_len = point_distance(0, 0, _input_x, _input_y);
    _move_x = (_input_x / _input_len) * move_speed;
    _move_y = (_input_y / _input_len) * move_speed;
} else {
    if (mouse_check_button_pressed(mb_left)) {
        target_x = clamp(mouse_x, walk_min_x, walk_max_x);
        target_y = clamp(mouse_y, walk_min_y, walk_max_y);
        has_target = !scr_player_place_blocked(target_x, target_y);
    }

    if (has_target) {
        var _target_dist = point_distance(x, y, target_x, target_y);

        if (_target_dist <= move_speed) {
            x = target_x;
            y = target_y;
            has_target = false;
        } else {
            var _target_dir = point_direction(x, y, target_x, target_y);
            _move_x = lengthdir_x(move_speed, _target_dir);
            _move_y = lengthdir_y(move_speed, _target_dir);
        }
    }
}

if (_move_x != 0 || _move_y != 0) {
    var _next_x = clamp(x + _move_x, walk_min_x, walk_max_x);
    var _next_y = clamp(y + _move_y, walk_min_y, walk_max_y);
    var _moved = false;

    if (!scr_player_place_blocked(_next_x, y)) {
        x = _next_x;
        _moved = true;
    }

    if (!scr_player_place_blocked(x, _next_y)) {
        y = _next_y;
        _moved = true;
    }

    if (!_moved) {
        has_target = false;
    }

    var _next_sprite = sprite_index;

    if (abs(_move_x) > abs(_move_y)) {
        if (_move_x > 0) {
            facing = "right";
            _next_sprite = spr_player_walk_right;
        } else {
            facing = "left";
            _next_sprite = spr_player_walk_left;
        }
    } else {
        if (_move_y > 0) {
            facing = "front";
            _next_sprite = spr_player_walk_front;
        } else {
            facing = "back";
            _next_sprite = spr_player_walk_back;
        }
    }

    if (sprite_index != _next_sprite) {
        sprite_index = _next_sprite;
    }

    image_speed = walk_image_speed;
} else {
    image_speed = 0;
    image_index = 0;
}

depth = -y;

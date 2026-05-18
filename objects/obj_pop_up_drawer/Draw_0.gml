var _old_alpha = draw_get_alpha();
var _old_colour = draw_get_colour();

draw_set_alpha(0.55);
draw_set_colour(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_self();

draw_set_colour(_old_colour);
draw_set_alpha(_old_alpha);

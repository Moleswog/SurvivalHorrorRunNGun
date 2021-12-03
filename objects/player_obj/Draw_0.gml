/// @description Vision Cone
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(.5);
draw_set_color(c_white);
draw_triangle(x, y, x+lengthdir_x(coneLength,coneLeft), y+lengthdir_y(coneLength,coneLeft), x+lengthdir_x(coneLength,coneRight), y+lengthdir_y(coneLength,coneRight), false);
draw_set_alpha(1);
draw_self()
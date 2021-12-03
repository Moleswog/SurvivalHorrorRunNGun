//calculate shadow angles
left = x - sprite_xoffset;
right = x + sprite_xoffset;
top = y - sprite_yoffset;
bottom = y + sprite_yoffset;

dirTopRight = -point_direction(right, top, player_obj.x, player_obj.y);
dirTopLeft = -point_direction(left, top, player_obj.x, player_obj.y);
dirBottomRight = -point_direction(right, bottom, player_obj.x, player_obj.y);
dirBottomLeft = -point_direction(left, bottom, player_obj.x, player_obj.y);

L = shadows[0];
R = shadows[1];
B = shadows[2];
T = shadows[3];




/// @description Draw Shadow

draw_self();

triangle1 = [];
triangle2 = [];
triangle3 = [];

draw_set_color(c_black);
//Draw Shadow
if(L and T)
{
	//Left Triangle
	draw_triangle(left, bottom, left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft), left, bottom - (2*sprite_yoffset), false);
	//Top Triangle
	draw_triangle(right, top, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), right - (2*sprite_xoffset), top, false);
	//Fill
	draw_triangle(left, top, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft), false);

	//Set vars for use elsewhere
	array_push(triangle1, left, bottom, left, bottom - (2*sprite_yoffset), left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft));
	array_push(triangle2, right, top, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), right - (2*sprite_xoffset), top);
	array_push(triangle3, left, top, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft));
}
if(T and R)
{
	//Right Triangle
	draw_triangle(right, bottom, right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), right, bottom - (2*sprite_yoffset), false);
	//Top Triangle
	draw_triangle(left, top, left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), left + (2*sprite_xoffset), top, false);
	//Fill
	draw_triangle(right, top, left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), false);

	//Set vars for use elsewhere
	array_push(triangle1, right, bottom, right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), right, bottom - (2*sprite_yoffset));
	array_push(triangle2, left, top, left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), left + (2*sprite_xoffset), top, false);
	array_push(triangle3, right, top, left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight));
}
if(R and B)
{
	//Right Triangle
	draw_triangle(right, top, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), right, top + (2*sprite_yoffset), false);
	//Bottom Triangle
	draw_triangle(left, bottom, left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft), left + (2*sprite_xoffset), bottom, false);
	//Fill
	draw_triangle(right, bottom, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft), false); 

	//Set vars for use elsewhere
	array_push(triangle1, right, top, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), right, top + (2*sprite_yoffset));
	array_push(triangle2, left, bottom, left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft), left + (2*sprite_xoffset), bottom);
	array_push(triangle3, right, bottom, right - lengthdir_x(2000, dirTopRight), top + lengthdir_y(2000, dirTopRight), left - lengthdir_x(2000, dirBottomLeft), bottom + lengthdir_y(2000, dirBottomLeft));
}
if(B and L)
{
	//Left Triangle
	draw_triangle(left, top, left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), left, top + (2*sprite_yoffset), false);
	//Bottom triangle
	draw_triangle(right, bottom, right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), right - (2*sprite_xoffset), bottom, false);
	//Fill
	draw_triangle(left, bottom,  right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), false);

	//Set vars for use elsewhere
	array_push(triangle1, left, top, left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft), left, top + (2*sprite_yoffset));
	array_push(triangle2, right, bottom, right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), right - (2*sprite_xoffset), bottom);
	array_push(triangle3, left, bottom,  right - lengthdir_x(2000, dirBottomRight), bottom + lengthdir_y(2000, dirBottomRight), left - lengthdir_x(2000, dirTopLeft), top + lengthdir_y(2000, dirTopLeft));
}

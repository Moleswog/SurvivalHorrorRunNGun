player = instance_find(player_obj, 0);
boss = instance_find(boss_obj, 0);

draw_set_color(c_black);
draw_rectangle(0, 0, 2000, 30, false);

// Draw ammo and reloading indicators
if ( instance_exists(player) and player.gun != noone)
{
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(std_fnt);
	draw_text(10, 10, string(player.gun.ammo) + "/"+ string(player.gun.ammoTotal));
	
	
	if (player.gun.reloading)
	{
		reloadBrickX = 200 - 50*(player.gun.alarm[0]/player.gun.reloadTime);
		draw_rectangle(150, 10, 200, 20, false);
		draw_set_color(c_gray);
		draw_rectangle(reloadBrickX, 5, reloadBrickX+5, 25, false);
	}
	draw_set_color(c_gray);
	draw_rectangle(240, 5, 260, 25, false)
	draw_sprite(player.gun.sprite_index, player.gun.image_index, 250, 15)
}


if (showArrow)
{
	draw_set_color(c_orange);
	draw_triangle(room_width - 250, room_height - 230, room_width - 250, room_height - 120, room_width - 150, room_height - 175, false);
	draw_rectangle(room_width - 400, room_height - 200, room_width - 200, room_height - 150, false);
	/*
	draw_set_color(c_white);
	draw_triangle(room_width - 250, room_height - 230, room_width - 250, room_height - 120, room_width - 150, room_height - 175, true);
	draw_rectangle(room_width - 400, room_height - 200, room_width - 200, room_height - 150, true);
	draw_set_color(c_orange);
	draw_rectangle(room_width - 250, room_height - 200, room_width - 200, room_height - 150, false);
	*/
}

if (boss != noone)
{
	draw_set_color(c_dkgray);
	draw_rectangle(100, 700, 1500, 750, false);
	draw_set_color(c_red);
	draw_rectangle(105, 705, 105 + (1390*bossHP), 745, false);
}





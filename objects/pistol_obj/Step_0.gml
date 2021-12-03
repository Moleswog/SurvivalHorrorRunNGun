// When Equipped
if !onGround and equip
{
	//Aim at the mouse
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	if(image_angle > 90 and image_angle < 270)
	{
		image_yscale = -1;
	}
	else
	{
		image_yscale = 1;
	}
	
	//Follow the Player
	x = floor(player_obj.x + (10 * image_yscale));
	y = floor(player_obj.y);
	
	
	// Shooting
	if (mouse_check_button_pressed(mb_left) and ammo > 0 and !reloading)
	{
		audio_play_sound(pistol_fire_snd, 0, false);
		bullet = instance_create_depth(x+7, y-1, -100, bullet_obj);
		bullet.speed = 10;
		bullet.direction = point_direction(x+7, y-1, mouse_x, mouse_y);
		ammo -= 1;
	}
	
	//Reloading
	if (keyboard_check_pressed(ord("R")) and !reloading and (ammo < ammoMax) and ammoTotal > 0)
	{
		alarm_set(0, reloadTime)
		reloading = true;
	}
	if (reloading)
	{
		if(!reloadSound1)
		{
			audio_play_sound(mag_out_snd, 0, false);
			reloadSound1 = true;
		}
		else if(reloadSound1 and !audio_is_playing(mag_out_snd) and !reloadSound2)
		{
			audio_play_sound(insert_ammo_snd, 0, false);
			reloadSound2 = true;
		}
		else if(reloadSound2 and !audio_is_playing(insert_ammo_snd) and !reloadSound3)
		{
			audio_play_sound(pistol_slide_snd, 0, false);
			reloadSound3 = true;
		}
		
		
	}
}



// When Equipped
if !onGround and equip
{
	//Aim at the mouse
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	if(image_angle > 90 and image_angle < 270)
	{
		image_yscale = -2;
	}
	else
	{
		image_yscale = 2;
	}
	
	//Follow the Player
	x = floor(player_obj.x + (10 * image_yscale/2));
	y = floor(player_obj.y);
	
	
	// Shooting
	if (mouse_check_button_pressed(mb_left) and ammo > 0 and !reloading)
	{
		audio_play_sound(shotgun_fire_snd, 0, false);
		for(i = 0; i < 6; i++)
		{
			bullet = instance_create_depth(x+10, y-1, -100, bullet_obj);
			bullet.speed = 9 + random(2);
			bullet.direction = point_direction(x+10, y-3, mouse_x, mouse_y) + random(30) - 15;
		}
	}
	
	//Reloading
	if (keyboard_check_pressed(ord("R")) and !reloading and ammo < ammoMax and ammoTotal > 0)
	{
		//The number of bullets to load
		toLoad = (ammoMax - ammo);
		if(toLoad > ammoTotal)
		{
			toLoad = ammoTotal;
		}
		//calc reload time
		reloadTime = reloadTimeSingle * toLoad;
		
		alarm_set(0, reloadTime)
		reloading = true;
	}
	
	if (reloading)
	{
		//reload
		if(!audio_is_playing(insert_ammo_snd) and !audio_is_playing(shotgun_pump_snd))
		{
			if(ammoTotal > 0 and ammo < ammoMax)
			{
				audio_play_sound(insert_ammo_snd, 0, false);
				ammo += 1;
				ammoTotal -= 1;
			}
			
			// 12 = sound length in frames
			else if (alarm[0] == 12)
			{
				audio_play_sound(shotgun_pump_snd, 0, false);
			}
		}	
	}
}



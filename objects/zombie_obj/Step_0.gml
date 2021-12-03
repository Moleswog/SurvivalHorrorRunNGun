// select a random location to move to if there are no other options
if(gotoX == -1 or gotoY == -1)
{
	xOffset = random(400) - 200;
	yOffset = random(400) - 200;
	
	gotoX = x + xOffset;
	gotoY = y + yOffset;
	
	//Keep the zombie on screen
	if(gotoX > 1500)
	{
		gotoX = 1500;
	}
	if(gotoX < 100)
	{
		gotoX = 100;
	}
	if(gotoY > 700)
	{
		gotoY = 700;
	}
	if(gotoY < 100)
	{
		gotoY = 100;
	}
}

// move to the desired location
if(distance_to_point(gotoX, gotoY) > 5 and !stopped and (place_free(x+hspeed, y+vspeed) or place_meeting(x+hspeed, y+vspeed, zombie_obj)))
{
	move_towards_point(gotoX, gotoY, speeds[state]);
	if (gotoX > x)
	{
		image_xscale = -2;
	}
	else
	{
		image_xscale = 2;
	}
}
else
{
	stopped = true;
	speed = 0;
	if(alarm[0] < 1)
	{
		alarm_set(0, 60);
	}
}

// Player is near (footsteps audible)
if (distance_to_object(player_obj) < 300)
{
	gotoX = player_obj.x;
	gotoY = player_obj.y;
	state = 1;
}
		
// Gunshot Heard
if (player_obj.gun != noone and distance_to_object(player_obj) < player_obj.gun.audibleRange and audio_is_playing(pistol_fire_snd))
{
	gotoX = player_obj.x;
	gotoY = player_obj.y;
	state = 1;
}

// Vision on player
inst = collision_line(x, y, player_obj.x, player_obj.y, all, false, false)
if(inst.object_index == player_obj and distance_to_object(player_obj) < 500)
{
	gotoX = player_obj.x;
	gotoY = player_obj.y;
	state = 2;
}
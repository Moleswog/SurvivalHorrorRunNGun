with (all)
{
	//init shadow list for each object
	//If object is a building
	if((instance_exists(bldg_obj) and id == bldg_obj.id) or (instance_exists(franks_obj) and id == franks_obj.id))
	{
		//determine which quadrant the player is in
		xDiffSmall = x-sprite_xoffset-player_obj.x;
		yDiffSmall = y-sprite_yoffset-player_obj.y;
		xDiffLarge = x+sprite_xoffset-player_obj.x;
		yDiffLarge = y+sprite_yoffset-player_obj.y;
		
		//where is the x
		//Player is to the left of object
		if(xDiffSmall > 0)
		{
			col = 0;
		}
		//Player is to the right of object
		else if(xDiffLarge < 0)
		{
			col = 2;
		}
		//Player is between object bounds
		else
		{
			col = 1;
		}
		
		//where is the y
		//Player is above
		if(yDiffSmall > 0)
		{
			row = 0;
		}
		//Player is below
		else if(yDiffLarge < 0)
		{
			row = 2;
		}
		//Player is between object bounds
		else
		{
			row = 1;
		}
		
		
		switch(col)
		{
			case 0:
				R = true;
				L = false;
				break;
			case 2:
				L = true;
				R = false;
				break;
			default:
				L = true;
				R = true;
				break;
		}
		
		switch(row)
		{
			case 0:
				B = true;
				T = false;
				break;
			case 2:
				T = true;
				B = false;
				break;
			default:
				B = true;
				T = true;
				break;
		}
		array_push(shadows, L, R, B, T);
	}
	
	//show objects within the player's vision
	//always show player (and self)
	if (object_index == player_obj.object_index or object_index == gui_controller_obj.object_index)
	{
		self.visible = true;
	}
	
	//check if object is within player's vision cone
	else if (point_in_triangle(x, y, player_obj.x, player_obj.y, x+lengthdir_x(player_obj.coneLength, player_obj.coneLeft), y+lengthdir_y(player_obj.coneLength,player_obj.coneLeft), x+lengthdir_x(player_obj.coneLength,player_obj.coneRight), y+lengthdir_y(player_obj.coneLength,player_obj.coneRight)))
	{
		//only show the first visible object (hide objects behind others)
		if(collision_line(x, y, player_obj.x, player_obj.y, all, false, false))
		{
			self.visible = true;
		}
		else
		{
			self.visible = false;
		}
		
	}
	
	//check edges of vision cone to prevent pop-in
	else if (collision_line(player_obj.x, player_obj.y, player_obj.x+lengthdir_x(player_obj.coneLength,player_obj.coneLeft), player_obj.y+lengthdir_y(player_obj.coneLength,player_obj.coneLeft), id, false, false) == id)
	{
		self.visible = true;
	}
	
	else if (collision_line(player_obj.x, player_obj.y, player_obj.x+lengthdir_x(player_obj.coneLength,player_obj.coneRight), player_obj.y+lengthdir_y(player_obj.coneLength,player_obj.coneRight), id, false, false) == id)
	{
		self.visible = true;
	}
	
	//dont show other objects
	else
	{
		self.visible = false;
	}
}

if(!instance_exists(zombie_obj) and !instance_exists(boss_obj) and noEnemy == false)
{
	noEnemy = true;
	alarm_set(0, 15);
}

if(instance_exists(boss_obj))
{
	bossHP = boss_obj.hp / boss_obj.healthMax;
}
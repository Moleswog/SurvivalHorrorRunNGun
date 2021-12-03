// Player Movement
if keyboard_check(ord("W")) and knockback <= 0 and place_free(x, y-run_speed)
{
	if(y-run_speed < 35)
	{
		y = 35;
	}
	y -= run_speed;
}

if keyboard_check(ord("A")) and knockback <= 0 and place_free(x-run_speed, y)
{
	if(x-run_speed < 5)
	{
		x = room_width - 5;
		room_goto_previous();
	}
	x -= run_speed;
}

if keyboard_check(ord("S")) and knockback <= 0 and place_free(x, y+run_speed)
{
	if(y + run_speed > room_height-5)
	{
		y = room_height - 5;
	}
	y += run_speed;
}

if keyboard_check(ord("D")) and knockback <= 0 and place_free(x+run_speed, y)
{
	if(x + run_speed > room_width - 5)
	{
		x = 5;
		room_goto_next();
	}
	x += run_speed;
}

// Weapon Swapping
if (mouse_wheel_down() and equippedWeapon >= 0)
{
	gun.equip = false;
	gun.x = -100;
	equippedWeapon -= 1;
	if(equippedWeapon < 0)
	{
		equippedWeapon = array_length(inventory) - 1;
	}
	gun = inventory[equippedWeapon];
	gun.equip = true;
	gun.visible = true;
}

if (mouse_wheel_up() and equippedWeapon >= 0)
{
	gun.equip = false;
	gun.x = -100;
	equippedWeapon += 1;
	if(equippedWeapon >= array_length(inventory))
	{
		equippedWeapon = 0;
	}
	gun = inventory[equippedWeapon];
	gun.equip = true;
	gun.visible = true;
}



// Vision Cone
coneDir = point_direction(x, y, mouse_x, mouse_y);
coneLeft = (coneDir+coneLeftAngle) mod 360;
coneRight = (coneDir+coneRightAngle+360) mod 360;

// Rotate Player based on mouse
if (mouse_x > x)
{
	image_xscale = 2;
}
else
{
	image_xscale = -2;
}

// Knockback on shot
if (mouse_check_button_pressed(mb_left) and gun != noone and !gun.reloading and gun.ammo > 0)
{
	dir = point_direction(x, y, mouse_x, mouse_y);
	knockback = gun.recoil;
	//error with shotgun "fix"
	if(gun == shotgun_obj)
	{
		gun.ammo -= 1;
	}
}

if (knockback > 0)
{
	knockback -= power(framesKnock, 2);
	framesKnock += 1;
	x -= lengthdir_x(knockback, dir);
    y -= lengthdir_y(knockback, dir);
}
else
{
	framesKnock = 0;
	knockback = 0;
}

if(room == gamewin_rm)
{
	for(i = 0; i < array_length(inventory); i++)
	{
		instance_destroy(inventory[i]);
	}
	instance_destroy();
}
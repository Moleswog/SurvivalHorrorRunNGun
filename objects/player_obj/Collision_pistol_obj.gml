/// @description Pickup
inArr = false;
for( i = 0; i < array_length(inventory); i++)
{
	if inventory[i] == pistol_obj
	{
		inArr = true;
	}
}

if(!inArr)
{
	array_push(inventory, pistol_obj)
	if (equippedWeapon == -1)
	{
		equippedWeapon = 0;
		gun = inventory[equippedWeapon];
	}
	else
	{
		gun.equip = false;
		gun.x = -100;
		equippedWeapon += 1;
		gun = inventory[equippedWeapon];
		gun.equip = true;
	}
}


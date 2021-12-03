/// @description Reloading

if(ammoTotal < ammoMax)
{
	ammo = ammoTotal;
	ammoTotal = 0;
}
else
{
	ammo = ammoMax;
	ammoTotal -= ammoMax;
}
reloading = false;
reloadSound1 = false;
reloadSound2 = false;
reloadSound3 = false;

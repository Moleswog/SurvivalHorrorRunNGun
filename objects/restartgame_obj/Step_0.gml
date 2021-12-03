//restart on button click
if (mouse_check_button_pressed(mb_any))
{
	if(mouse_x > buttonLeft and mouse_x < buttonRight)
	{
		if(mouse_y > buttonTop and mouse_y < buttonBottom)
		{
			game_restart();
		}
	}
}
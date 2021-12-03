//Draw the button
draw_set_color(c_ltgray);
draw_rectangle(buttonLeft, buttonTop, buttonRight, buttonBottom, false);
draw_set_color(c_dkgray);
draw_text(buttonLeft+90, buttonTop+40, "Restart Game");
if(room == gameover_rm)
{
	draw_set_color(c_red);
	draw_set_font(lrg_fnt);
	draw_text(room_width/2 - 100, room_height/4, "Game Over");
	draw_set_font(std_fnt);
}
else
{
	draw_set_color(c_green);
	draw_set_font(lrg_fnt);
	draw_text(room_width/2 - 100, room_height/4, "You're winner.");
	draw_set_font(std_fnt);
}
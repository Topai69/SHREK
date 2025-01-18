var _s = id;

if position_meeting(mouse_x, mouse_y, id) 
&& mouse_check_button_pressed(mb_left) 
&& global.on_plate
{
	create_textbox(text_id);
	global.paused_game = true;
}
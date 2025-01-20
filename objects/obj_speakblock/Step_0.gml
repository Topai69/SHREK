var _s = id;

if position_meeting(mouse_x, mouse_y, id) 
&& keyboard_check_pressed(ord("E"))
&& global.on_plate
{
	create_textbox(text_id);
	global.paused_game = true;
}
var _s = id;

if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) && (obj_speakblock.x - global.player_x) < 32
{
	create_textbox(text_id);
	instance_activate_object(obj_pauser);
}
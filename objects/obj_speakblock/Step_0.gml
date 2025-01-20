var _s = id;

if position_meeting(mouse_x, mouse_y, id) && keyboard_check_released(ord("E"))
&& global.on_plate
{
	create_textbox(text_id);
	audio_sound_gain(snd_background_music, 0, 2000);
	global.paused_game = true;
}
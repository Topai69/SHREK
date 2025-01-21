up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_released(vk_enter) || keyboard_check_released(vk_space);

depth = -9999;
if (keyboard_check_released(ord("P")) && global.pause == false)
{
    global.pause = true; // pause game
}


op_lenght = array_length(option[menu_level]);




pos -= up_key - down_key;
if global.pause = true
{
if pos >= op_lenght
{
	pos = 0;
}
if pos < 0
{
	pos = op_lenght - 1;
}
show_debug_message(pos);
if accept_key == true
{
	
	var _sml = menu_level;
	switch(menu_level)
	{
		///pause menu///
		case 0:
		switch(pos)
			{
			///start game///
			case 0: instance_deactivate_object(obj_pause); instance_activate_object(obj_pause);
			global.pause = false;
			break;
			/////restart////
			case 1: room_goto_previous(); break;
			////quit/////
			case 2: game_end(); break; 
			}
		break;
	}
	if _sml != menu_level
		{
			pos = 0;
		}
	op_lenght = array_length(option[menu_level]);
}
}
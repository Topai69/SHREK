up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_released(vk_enter) || keyboard_check_released(vk_space);
if (keyboard_check_pressed(ord("P")) && global.pause == false)
{
    global.pause = true; // Toggle pause state
}

op_lenght = array_length(option[menu_level]);




pos -= up_key - down_key;

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
			///settings/////
			case 1: menu_level = 1; break;
			/////restart////
			case 2: room_goto_previous(); break;
			////quit/////
			case 3: game_end(); break;
			}
		break;
		
		///settings////
		case 1:
		switch(pos)
			{
				///window size///
				case 0:
				
				break;
				///brightness////
				case 1:
			
				break;
				///controls////
				case 2: 
			
				break;
				///back////
				case 3: menu_level = 0; break;
			}
			break;
	}
	if _sml != menu_level
		{
			pos = 0;
		}
	op_lenght = array_length(option[menu_level]);
}
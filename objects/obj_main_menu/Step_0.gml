up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_released(vk_enter);

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
			case 0: room_goto_next(); break;
			///settings/////
			case 1: menu_level = 1; break;
			/////quit////
			case 2: game_end(); break;
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
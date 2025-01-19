up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_released(vk_enter) || keyboard_check_pressed(vk_space);

var display_width = display_get_width();
var display_height = display_get_height();
window_set_position((display_width - _width_screen) / 2, (display_height - _height_screen) / 2);

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
			case 0: room_goto_next();  break;
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
				menu_level = 2;
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
			
		case 2:
		switch(pos)
			{
				///800x600//
				case 0:
				 _width_screen = 800;
				 _height_screen = 600;
				window_set_size(_width_screen,_height_screen);
				
				break;
				///1280x720////
				case 1:
				 _width_screen = 1152;
				 _height_screen = 864;
				window_set_size(_width_screen,_height_screen);
				break;
				///fullscreen////
				case 2: 
				_width_screen = 1920;
				_height_screen = 1080;
				window_set_size(_width_screen,_height_screen);
				break;
				///back////
				case 3: menu_level = 0; break;
			}
		if _sml != menu_level
			{
				pos = 0;
			}
			op_lenght = array_length(option[menu_level]);
		}
}
height = 104;
width = 50;
_width_screen = 800;
_height_screen = 600;
op_border = 6;
op_space = 16;



pos = 0;

///////////main menu//////////
option[0, 0] = "Start Game";
option[0, 1] = "Settings";
option[0, 2] = "Quit Game";

////////settings menu////////////
option[1, 0] = "Window size";
option[1, 1] = "Audio";
option[1, 2] = "Back";

////////window size menu////////
option[2, 0] = "800x600";
option[2, 1] = "1152x864";
option[2, 2] = "Fullscreen";
option[2, 3] = "Back";

option[3, 0] = "Mute";
option[3, 1] = "25%";
option[3, 2] = "50%";
option[3, 3] = "75%";
option[3, 4] = "100%";
option[3, 5] = "Back";


op_lenght = array_length(option);
menu_level = 0;
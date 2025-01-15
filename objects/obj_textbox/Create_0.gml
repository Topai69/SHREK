////textbox parameteres
depth = -9999;


textbox_width = 200;
textbox_height = 64;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
textb_spr = spr_menu;
textb_img = 0;
textb_img_speed = 6/60;

page = 0;
page_number = 0;
text[0] = "";

text_lenght[0] = string_length(text[0]);
draw_char = 0;
text_speed = 1;

////OPTIONS
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;
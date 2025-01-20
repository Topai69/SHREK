accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 144;

//setup
if setup == false
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	/////loop through pages
	for(var p = 0; p < page_number; p++)
	{
		
		////find how many characters are on each page and store that number in the text_lenght array
		text_lenght[p] = string_length(text[p]);
		
		///get the x pos for the textbox
		///no character dialogue
		text_x_offset[p] = 44;
	}
}



/////typing the text

if draw_char < text_lenght[page]
{
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_lenght[page]);
	
}

///flip through pages
if accept_key == true
{
	///if typing is done
	if draw_char = text_lenght[page]
	{
		//next page
		if page < page_number-1
		{
			page++;
			draw_char = 0;
		}
		////destroy textbox
		else
		{
			///link text for options
			if option_number > 0
			{
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}	
	}
	///if not done typing
	else
		{
			draw_char = text_lenght[page];
		}
}


////draw the textbox
var _textb_x = textbox_x + text_x_offset[page];
var _textb_y = textbox_y;
textb_img += textb_img_speed;
textb_spr_w = sprite_get_width(textb_spr);
textb_spr_h = sprite_get_height(textb_spr);
////back of the textbox
draw_sprite_ext(textb_spr, textb_img, _textb_x,_textb_y, textbox_width/textb_spr_w, textbox_height/textb_spr_h, 0, c_white, 1);


////options
if draw_char == text_lenght[page] && page == page_number - 1
{
	/////option selection
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	option_pos = clamp(option_pos, 0, option_number-1);
	
	
	var _op_space = 15;
	var _op_bord = 4;
	for (var op = 0; op < option_number; op++)
	{
		//option box
		var _o_w = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(textb_spr, textb_img, _textb_x + 16, _textb_y - _op_space * option_number + _op_space*op, _o_w/textb_spr_w, (_op_space-1)/textb_spr_h, 0, c_white, 1);
		//////draw arrow
		if  option_pos == op
		{
			draw_sprite(spr_arrow, 0, _textb_x, _textb_y - _op_space*option_number + _op_space*op);
		}
		
		////the option text
		draw_text(_textb_x + 16 + _op_bord, _textb_y - _op_space*option_number + _op_space*op + 2, option[op]);
		
	}
}

///draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(_textb_x + border, _textb_y + border, _drawtext, line_sep, line_width);
//draw_text_color(_textb_x + border, _textb_y + border, _drawtext, c_blue, c_blue, c_blue, c_blue, 1);
//draw_text_ext_color(_textb_x + border, _textb_y + border, _drawtext, line_sep, line_width, text_color, text_color, text_color, text_color, 1)




draw_set_font(global.font_title);

var _new_w = 0;
	var _op_w = string_width(title[0]);
	_new_w = max(_new_w, _op_w)
width = _new_w + op_border * 2
height = op_border * 2 + string_height(title[0]) + (op_lenght-1)*op_space;
////////
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + 40; //+ camera_get_view_height(view_camera[0])/2 - height/2;

////////////draw background
//draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

	var _c = c_white;
	draw_text_color(x, y, title[0], _c, _c, _c, _c, 1)

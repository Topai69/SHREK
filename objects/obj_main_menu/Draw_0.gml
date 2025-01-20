draw_set_font(global.font_main);

var _new_w = 0;
for (var i = 0; i < op_lenght; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w)
}
width = _new_w + op_border * 2
height = op_border * 2 + string_height(option[0, 0]) + (op_lenght-1)*op_space;
////////
if menu_level <= 2
{
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;
}

////////////draw background
//draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < op_lenght; i++)
{
	var _c = c_white;
	if pos == i
	{
		_c = c_yellow;
	}
	draw_text_color(x+op_border, y+op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1)
}
if menu_level == 3
{
	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2 + 30;
}



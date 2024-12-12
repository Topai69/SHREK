var file = "colors.json";
if (file_exists(file)) {
    var file_id = file_text_open_read(file);
    var json_str = "";
    while (!file_text_eof(file_id)) {
        json_str += file_text_readln(file_id);
    }
    file_text_close(file_id);

    // Parse the JSON string
    var color_data = json_parse(json_str);

    //color_data.typ_farbosleposti.object
    var full_color_str = color_data.full.plast;

    // Set the color and draw
    show_debug_message(full_color_str[0])
    image_blend = make_colour_rgb(full_color_str[0], full_color_str[1], full_color_str[2]);
    draw_self();
}
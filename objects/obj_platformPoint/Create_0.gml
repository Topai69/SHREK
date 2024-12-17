
if (startingPoint) {
    platformID_startX = x;
    platformID_startY = y;
    show_debug_message("Start Point: " + string(platformID_startX) + ", " + string(platformID_startY));
} else {
    platformID_endX = x;
    platformID_endY = y;
    show_debug_message("End Point: " + string(platformID_endX) + ", " + string(platformID_endY));
}

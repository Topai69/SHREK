if (startingPoint) {
    platformID.startX = x;
    platformID.startY = y;
    show_debug_message("Start Point: " + string(platformID.startX) + ", " + string(platformID.startY));
} else {
    platformID.endX = x;
    platformID.endY = y;
    show_debug_message("End Point: " + string(platformID.endX) + ", " + string(platformID.endY));
}

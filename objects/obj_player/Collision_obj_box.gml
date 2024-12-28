// handle collision with box
if (!keyboard_check(ord("E"))) {
    // block the player from moving through the box
    if (place_meeting(x + xspeed, y, obj_box)) {
        xspeed = 0;
    }
    if (place_meeting(x, y + yspeed, obj_box)) {
        yspeed = 0;
    }
}
// handle collision with player
if (keyboard_check(ord("E"))) {
    // push the box in the direction of the player's movement
    if (other.xspeed != 0) {
        x += other.xspeed;
    }
    if (other.yspeed != 0) {
        y += other.yspeed;
    }
}
//handle collision with player
if (!keyboard_check(ord("E"))) {
    //block the player from moving through the box
    if (other.x > x) {
        other.x = x + sprite_width;
    } else if (other.x < x) {
        other.x = x - other.sprite_width;
    }
    if (other.y > y) {
        other.y = y + sprite_height;
    } else if (other.y < y) {
        other.y = y - sprite_height;
    }
} else {
    //push the box in the direction of the player's movement
    if (other.xspeed != 0 && !place_meeting(x + sign(xspeed), y, obj_ground) && !place_meeting(x + sign(xspeed), y, obj_movingPlatform)) {
        x += other.xspeed;
    }
    if (other.yspeed != 0 && !place_meeting(x, y + sign(yspeed), obj_ground) && !place_meeting(x, y + sign(yspeed), obj_movingPlatform)) {
        y += other.yspeed;
    }
}
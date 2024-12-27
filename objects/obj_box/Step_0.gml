// apply gravity only if not on the ground
if (!place_meeting(x, y + 1, obj_ground)) {
    yspeed += gravity;
} else {
    yspeed = 0;
}

// check for collisions with walls
if (place_meeting(x + xspeed, y, obj_wall)) {
    xspeed = 0;
}

// check for collisions with the player
if (place_meeting(x, y, obj_player)) {
    // handle collision with player (e.g., push the player back)
}

// apply movement
x += xspeed;
y += yspeed;
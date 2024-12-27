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

// apply movement
x += xspeed;
y += yspeed;
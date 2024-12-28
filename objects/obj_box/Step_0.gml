// apply gravity to the box
if (!place_meeting(x, y + 1, obj_ground)) {
    yspeed += gravity;
} else {
    yspeed = 0;
}

// stop the box if it hits a wall
if (place_meeting(x + xspeed, y, obj_wall)) {
    xspeed = 0;
}

// apply movement
x += xspeed;
y += yspeed;

// apply gravity if no ground below
if (!place_meeting(x, y + 1, obj_ground)) {
    vspeed += grav;
} else {
    // stop vertical movement if on ground
    vspeed = 0;
}

// apply vertical movement
y += vspeed;
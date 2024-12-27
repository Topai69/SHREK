// check if triggered variable exists, if not, initialize it
if (!instance_exists(triggered)) {
    triggered = false;
}

// check if spike should be triggered by the player below
if (!triggered && place_meeting(x, y + sprite_height, obj_player)) {
    triggered = true;
}

// if triggered, make the spike fall
if (triggered) {
    vspeed += 0.5; // increase vertical speed
    y += vspeed;   // update position

    // stop spike when it hits the ground
    if (place_meeting(x, y, obj_ground)) {
        vspeed = 0;  
    }
}
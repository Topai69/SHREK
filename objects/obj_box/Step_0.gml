//gravity
if (!place_meeting(x, y + sign(yspeed), obj_ground) && !place_meeting(x, y + sign(yspeed), obj_movingPlatform)) {
    yspeed += grav;
    if (yspeed > 10) yspeed = 10;
} else {
    yspeed = 0;
}

//vertical collisions
if (place_meeting(x, y + yspeed, obj_ground) || place_meeting(x, y + yspeed, obj_movingPlatform)) {
    while (!place_meeting(x, y + sign(yspeed), obj_ground) && 
           !place_meeting(x, y + sign(yspeed), obj_movingPlatform)) {
        y += sign(yspeed);
    }
    yspeed = 0;
}

//horizontal collisions
if (place_meeting(x + xspeed, y, obj_ground) || place_meeting(x + xspeed, y, obj_movingPlatform) || place_meeting(x + xspeed, y, obj_wall)) {
    while (!place_meeting(x + sign(xspeed), y, obj_ground) && 
           !place_meeting(x + sign(xspeed), y, obj_movingPlatform) && 
           !place_meeting(x + sign(xspeed), y, obj_wall)) {
        x += sign(xspeed);
    }
    xspeed = 0;
}

x += xspeed;
y += yspeed;
xspeed = 0;
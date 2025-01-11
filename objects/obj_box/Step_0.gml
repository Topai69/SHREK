//gravity
if (!place_meeting(x, y + 1 , obj_ground) && !place_meeting(x, y + 1, obj_movingPlatform)){
    yspeed += grav;
} else {
    yspeed = 0; 
}

//limit for fall speed
if (yspeed > 10) yspeed = 10;

//vertical collisions
if (place_meeting(x, y + yspeed, obj_ground) || place_meeting(x, y + yspeed, obj_movingPlatform)){
    while (!place_meeting(x, y + sign(yspeed), obj_ground) &&
          !place_meeting(x, y + sign(yspeed), obj_movingPlatform)) {
            y += sign(yspeed);
          }
          yspeed = 0;
}

//horizontal collisions
if (place_meeting(x + xspeed, y, obj_ground) || place_meeting(x + xspeed, y, obj_movingPlatform)){
    while (!place_meeting(x, y + sign(xspeed), obj_ground) &&
          !place_meeting(x, y + sign(xspeed), obj_movingPlatform)) {
            y += sign(xspeed);
          }
          xspeed = 0;
}

x += xspeed;
y += yspeed;
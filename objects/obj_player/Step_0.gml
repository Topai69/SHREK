////////////////////////////////////////////////
// INPUTS
////////////////////////////////////////////////
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
jump_key_pressed = keyboard_check_pressed(vk_space);
jump_key_hold = keyboard_check(vk_space);

////////////////////////////////////////////////
// SPEEDS AND GRAVITY
////////////////////////////////////////////////
xspeed = (right_key - left_key) * move_speed;
if yspeed > 3 yspeed = 3;
yspeed += grav;

////////////////////////////////////////////////
// RESET JUMP COUNT ON COLLISION
////////////////////////////////////////////////
if place_meeting(x, y + 1, obj_ground) {
    jump_counter = 0;
    touched_wall_left = 0;
    touched_wall_right = 0;
    has_collided = false;
    can_jump = true;
    current_platform = noone; 
} else {
    if jump_counter == 0 {
        jump_counter = 1;
    }
}

////////////////////////////////////////////////
// MOVING PLATFORM COLLISION LOGIC
////////////////////////////////////////////////
var _movingPlatform = instance_place(x, y + max(1, yspeed), obj_movingPlatform);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
    // Pixel-perfect collisions
    if (yspeed > 0) {
        while (!place_meeting(x, y + sign(yspeed), obj_movingPlatform)) {
            y += sign(yspeed);
        }
    
        yspeed = 0;
    }
    
    // Add velocity
    x += _movingPlatform.moveX;
    y += _movingPlatform.moveY;
}

////////////////////////////////////////////////
// PLATFORM COLLISIONS
////////////////////////////////////////////////
// X
if place_meeting(x + xspeed, y, obj_movingPlatform) {
    while !place_meeting(x + sign(xspeed), y, obj_movingPlatform) {
        x += sign(xspeed);
    }
    xspeed = 0;
}

// Y
if place_meeting(x, y + yspeed, obj_movingPlatform) {
    while !place_meeting(x, y + sign(yspeed), obj_movingPlatform) {
        y += sign(yspeed);
    }
    yspeed = 0;
}

////////////////////////////////////////////////
// WALL JUMP LOGIC
////////////////////////////////////////////////
if place_meeting(x + 1, y, obj_wall1) {
    has_collided = true;
    touched_wall_right = 1;
    face = WALL_RIGHT;

    if jump_counter == 1 && jump_key_pressed {
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
        can_jump = true;
    }

    if touched_wall_left && jump_counter == 2 {
        jump_counter = 1;
        touched_wall_left = 0;
        can_jump = false;
    }
    if right_key {
        yspeed = 1;
    } else if face == WALL_RIGHT {
        face = RIGHT;
    }
}

if place_meeting(x - 1, y, obj_wall) {
    has_collided = true;
    touched_wall_left = 1;
    face = WALL_LEFT;

    if jump_counter == 1 && jump_key_pressed {
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
        can_jump = true;
    }

    if touched_wall_right && jump_counter == 2 {
        jump_counter = 1;
        touched_wall_right = 0;
        can_jump = false;
    }
    if left_key {
        yspeed = 1;
    } else if face == WALL_LEFT {
        face = LEFT;
    }
}

////////////////////////////////////////////////
// MOVING BOX LOGIC
////////////////////////////////////////////////

if (keyboard_check(ord("E"))) {
    // check if the player is colliding with a box
    var box = instance_place(x, y, obj_box);

    if (box != noone) {
        // calculate new position for the box based on player's movement
        var new_x = box.x;
        var new_y = box.y;
        
        if (xspeed != 0) {
            new_x = box.x + sign(xspeed) * move_speed;
        }
        if (yspeed != 0) {
            new_y = box.y + sign(yspeed) * move_speed;
        }

        // move the box if no collisions occur
        var can_move_box = true;
        if (place_meeting(new_x, box.y, obj_wall) || place_meeting(new_x, box.y, obj_ground)) {
            can_move_box = false;
        }
        if (place_meeting(box.x, new_y, obj_wall) || place_meeting(box.x, new_y, obj_ground)) {
            can_move_box = false;
        }

        if (can_move_box) {
            box.x = new_x;
            box.y = new_y;
        } else {
            // block the player's movement if the box cannot move
            xspeed = 0;
            yspeed = 0;
        }
    }
} else {
    // prevent passing through the box
    if (place_meeting(x + xspeed, y, obj_box)) {
        xspeed = 0;
    }
    if (place_meeting(x, y + yspeed, obj_box) && yspeed > 0) {
        yspeed = 0; // stop falling onto the box
    }
}

////////////////////////////////////////////////
// FALLING SPIKES
////////////////////////////////////////////////
if (place_meeting(x, y, obj_stalagmite)) {
		var spike = instance_place(x + max(1, xspeed), y, obj_stalagmite);
		instance_destroy(spike);
        health -= 1; // reduce health
        show_debug_message("player health: " + string(health));

        if (health <= 0) {
             game_restart(); // restart game if player health is 0
          }
}

////////////////////////////////////////////////
// HANDLE JUMP INPUT
////////////////////////////////////////////////
if can_jump == true && jump_key_pressed && jump_counter < jump_max {
    jump_counter++;
    current_platform = noone; // Leave the platform
    jump_timer = jump_hold_frames;
    yspeed = jump_speed; // Make sure to update yspeed
}

if !jump_key_hold {
    jump_timer = 0;
}

if jump_timer > 0 {
    yspeed = jump_speed;
    jump_timer--;
}

////////////////////////////////////////////////
// FACE ORIENTATION
////////////////////////////////////////////////
sprite_index = sprite[face];
if xspeed > 0 {
    face = RIGHT;
}
if xspeed < 0 {
    face = LEFT;
}

////////////////////////////////////////////////
// COLLISION
////////////////////////////////////////////////
if place_meeting(x + xspeed, y, obj_ground) || place_meeting(x + xspeed, y, obj_movingPlatform) {
    var _pixelCheck = sign(xspeed);
    while !place_meeting(x + _pixelCheck, y, obj_ground) && !place_meeting(x + _pixelCheck, y, obj_movingPlatform) {
        x += _pixelCheck;
    }
    xspeed = 0;
}

if place_meeting(x + xspeed, y + yspeed, obj_ground) || place_meeting(x + xspeed, y + yspeed, obj_movingPlatform) {
    var _pixelCheck = sign(yspeed);
    while !place_meeting(x, y + _pixelCheck, obj_ground) && !place_meeting(x, y + _pixelCheck, obj_movingPlatform) {
        y += _pixelCheck;
    }
    yspeed = 0;
}

////////////////////////////////////////////////
// MOVE X Y
////////////////////////////////////////////////
x += xspeed;
y += yspeed;

////////////////////////////////////////////////
// IDLE ANIMATION
////////////////////////////////////////////////
if (xspeed == 0 && yspeed == 0 && can_jump == true) {
    image_index = 0;
}

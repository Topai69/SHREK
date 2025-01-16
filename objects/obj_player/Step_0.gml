////////////////////////////////////////////////
// INPUTS
////////////////////////////////////////////////

right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
jump_key_pressed = keyboard_check_pressed(vk_space);
jump_key_hold = keyboard_check(vk_space);

var platform = instance_place(x, y + 1, obj_oneway_platform);
var on_ground = place_meeting(x, y + 1, obj_ground) || 
                place_meeting(x, y + 1, obj_movingPlatform) || 
                place_meeting(x,y+30,obj_oneway_platform) ||
                place_meeting(x, y + 1, obj_box);
//////////////////////////////////////////////
/////////////////CAMERA/////////////////////
////////////////////////////////////////
// Get the player's position
global.player_x = x;
global.player_y = y;

// Get the camera ID
var cam = view_camera[0];

// Set the camera position to center on the player
camera_set_view_pos(cam, global.player_x - (camera_get_view_width(cam) / 2), global.player_y - (camera_get_view_height(cam) / 2));

////////////////////////////////////////////////
// SPEEDS AND GRAVITY
////////////////////////////////////////////////

xspeed = (right_key - left_key) * move_speed;
if face == LEFT && xspeed < 0  && on_ground == false
	{
		face = JUMP_LEFT;
	}
if face == RIGHT && xspeed > 0  && on_ground == false
	{
		face = JUMP_RIGHT;
	}
if yspeed > 3 yspeed = 3;

yspeed += grav;

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
// RESET JUMP COUNT ON COLLISION
////////////////////////////////////////////////

if place_meeting(x, y + 1, obj_ground) || place_meeting(x, y + 1, obj_box) || place_meeting(x, y + 1, obj_movingPlatform)
{
    jump_counter = 0;
	touched_wall_left = 0;
	touched_wall_right = 0;
	has_collided = false;
	can_jump = true;
	wall_slide_timer_left = 0;
	wall_slide_timer_right = 0;
    current_platform = noone;
} 
else 
{
    if jump_counter == 0 {
        jump_counter = 1;
    }
}

////////////////////////////////////////////////
// WALL JUMP LOGIC
////////////////////////////////////////////////

if place_meeting(x + 1, y, obj_wall1) 
{
	has_collided = true;
	// Allow a single jump from walls
	touched_wall_right = 1;
	wall_slide_timer_left = 0.1;
	face = WALL_RIGHT;

	if jump_counter == 1 && jump_key_pressed 
	{
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
		can_jump = true;
    }

	if touched_wall_left && jump_counter == 2
	{
		jump_counter = 0;
		touched_wall_left = 0;
		can_jump = true;
	}

	if right_key
	{
		wall_slide_timer_right += 0.01;
		yspeed = wall_slide_timer_right;
	}
	else
	{
		if face == WALL_RIGHT
		{
			face = RIGHT
		}
	}
}
if place_meeting(x - 1, y, obj_wall) 
{
	has_collided = true;
	touched_wall_left = 1;
	face = WALL_LEFT;
	wall_slide_timer_right = 0.1;

	if jump_counter == 1 && jump_key_pressed 
	{
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
		can_jump = true;
    }

	if touched_wall_right && jump_counter == 2
	{
		jump_counter = 0;
		touched_wall_right = 0;
		can_jump = true;
	}

	if left_key 
	{
		wall_slide_timer_left += 0.01;
		yspeed = wall_slide_timer_left;
	}
	else
	{
		if face == WALL_LEFT
		{
			face = LEFT
		}
	}
}
if platform 
{
    // Compare y positions
    if (obj_player.y > platform.y) 
	{
        object_exists(obj_oneway_platform);
        show_debug_message("Platform exists!");
		jump_counter = 0;
		touched_wall_left = 0;
		touched_wall_right = 0;
		has_collided = false;
		can_jump = true;
		if place_meeting(x,y+30, obj_oneway_platform)
		{
			yspeed = 0;
		}
    } 
	else 
	{
    // Ensure the jump counter is set to 1 if walking off edges
    if jump_counter == 0 
		{
			jump_counter = 1;
		}
	}
}

////////////////////////////////////////////////
// WALL SLIDE FACE ORIENTATION
////////////////////////////////////////////////

if place_meeting(x-1,y,obj_wall) && place_meeting(x,y+1,obj_ground)
{
	face = LEFT;
}
//if place_meeting(x+1,y,obj_wall1) && place_meeting(x,y+1,obj_ground)
//{
//	face = RIGHT;
//}

////////////////////////////////////////////////
// HANDLE JUMP INPUT
////////////////////////////////////////////////

if can_jump == true && jump_key_pressed && jump_counter < jump_max 
{
	if face == LEFT 
	{
		face = JUMP_LEFT;
	}
	if face == RIGHT
	{
		face = JUMP_RIGHT;
	}
    // Count jumps
    jump_counter++;
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
// MOVING PLATFORM COLLISION LOGIC
////////////////////////////////////////////////

var _movingPlatform = instance_place(x, y + max(1, yspeed), obj_movingPlatform);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top + 1) {
    current_platform = _movingPlatform;
    
    //reset the jump counter
    if (yspeed >= 0) {
        jump_counter = 0;
        can_jump = true;
    }
    
    //avoid fallin
    if (yspeed > 0) {
        while (!place_meeting(x, y + 1, obj_movingPlatform)) {
            y += 1;
        }
        yspeed = 0;
    }
    
    //move w platform
    x += _movingPlatform.moveX;
    y += _movingPlatform.moveY;

} else {
    current_platform = noone;
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
// MOVING BOX LOGIC
////////////////////////////////////////////////

//climbing
if (place_meeting(x, y + yspeed, obj_box)) {
    while (!place_meeting(x, y + sign(yspeed), obj_box)) {
        y += sign(yspeed);
    }
    yspeed = 0;
}

//horinzontal box movement
if (keyboard_check(ord("E"))) { 
    var box = instance_place(x - xspeed, y, obj_box);
    if (box != noone) {
        if (!place_meeting(box.x + xspeed, box.y, obj_ground) && 
            !place_meeting(box.x + xspeed, box.y, obj_wall) &&
            !place_meeting(box.x + xspeed, box.y, obj_movingPlatform)) {
            
            box.xspeed = xspeed;
            
            //keep player close to the box
            if (xspeed > 0) {
                x = box.x - sprite_width/2; 
            } else if (xspeed < 0) {
                x = box.x + box.sprite_width + sprite_width/2;
            }
        } else {
            xspeed = 0;
        }
    }
} else { 
    var box = instance_place(x + xspeed, y, obj_box);
    if (box != noone) {
        if (x < box.x) {
            x = box.x - sprite_width/2;
        } else {
            x = box.x + box.sprite_width + sprite_width/2;
        }
        xspeed = 0;
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
// VOID RESPAWN AND CHECKPOINTS
////////////////////////////////////////////////

if place_meeting(x,y, obj_void)
{
	// Respawn player at last checkpoint
    obj_player.x = global.checkpoint_x;  // Set the player's x position to the last checkpoint's x 
    obj_player.y = global.checkpoint_y;  // Set the player's y position to the last checkpoint's y
	camera_set_view_pos(view_camera[0],0,0);
}

////////////////////////////////////////////////
// FACE ORIENTATION
////////////////////////////////////////////////
    image_speed = 1;
    if (xspeed > 0) face = RIGHT;
    if (xspeed < 0) face = LEFT;
	
if !on_ground
{
    //in air
    if (yspeed < 0) 
	{
        if (xspeed > 0) face = JUMP_RIGHT;
        else if (xspeed < 0) face = JUMP_LEFT;
    } 
	else 
	{
        //forcing framss
        if (xspeed > 0) 
		{
            face = JUMP_RIGHT;
            if (sprite_index == spr_jump_right) 
			{
                image_index = 4; //falling frame
                image_speed = 0;
            }
        } 
		else if (xspeed < 0) 
		{
            face = JUMP_LEFT;
            if (sprite_index == spr_jump_left) 
			{
                image_index = 4; //falling frame
                image_speed = 0;
            }
        }
    }
} 
sprite_index = sprite[face];

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

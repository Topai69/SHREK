////////////////////////////////////////////////
//////////////////////INPUTS////////////////////
////////////////////////////////////////////////
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
jump_key_pressed = keyboard_check_pressed(vk_space);
jump_key_hold = keyboard_check(vk_space);

var platform = instance_place(x, y + 1, obj_oneway_platform);

//speeds
xspeed = (right_key - left_key) * move_speed;

if yspeed > 3 yspeed = 3;
//gravity
yspeed += grav;
///////////////////////////////////////////////////////
////////////RESET JUMP COUNT ON COLLISION//////////////
///////////////////////////////////////////////////////
if place_meeting(x, y + 1, obj_ground) 
{
    jump_counter = 0;
	touched_wall_left = 0;
	touched_wall_right = 0;
	has_collided = false;
	can_jump = true;
} 
else 
{
    // Ensure the jump counter is set to 1 if walking off edges
    if jump_counter == 0 {
        jump_counter = 1;
    }
}
////////////////////////////////////////////////
///////////// Wall jump logic///////////////////
////////////////////////////////////////////////
if place_meeting(x + 1, y, obj_wall1) 
{
	has_collided = true;
	// Allow a single jump from walls
	show_debug_message(yspeed);
	touched_wall_right = 1;
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
		jump_counter = 1;
		touched_wall_left = 0;
		can_jump = false;
	}
	if right_key
	{
		yspeed = 1;
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
	show_debug_message(yspeed);
	if jump_counter == 1 && jump_key_pressed 
	{
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
		can_jump = true;
    }
	if touched_wall_right && jump_counter == 2
	{
		jump_counter = 1;
		touched_wall_right = 0;
		can_jump = false;
	}
	if left_key 
	{
		yspeed = 1;
	}
	else
	{
		if face == WALL_LEFT
		{
			face = LEFT
		}
	}
	if left_key && jump_key_pressed yspeed = jump_speed;
}
if platform {
    // Compare y positions
    if (y > platform.y) {
        // Platform "exists" for the player (collision logic can go here)
        show_debug_message("Platform exists!");
    } else {
        // Platform "does not exist" (ignore collision)
        show_debug_message("Platform does not exist!");
    }
}
if place_meeting(x,y,obj_oneway_platform)
{
	yspeed = 0;
}
///////////////////////////////////////////////////////////////////
////////////////////WALL SLIDE FACE ORIENTATION////////////////////
///////////////////////////////////////////////////////////////////
if place_meeting(x-1,y,obj_wall) && place_meeting(x,y+1,obj_ground)
{
	face = LEFT;
}
if place_meeting(x+1,y,obj_wall1) && place_meeting(x,y+1,obj_ground)
{
	face = RIGHT;
}
////////////////////////////////////////////////////////////////////
///////////////////////HANDLE JUMP INPUT////////////////////////////
////////////////////////////////////////////////////////////////////
if can_jump == true && jump_key_pressed && jump_counter < jump_max {
    // Count jumps
    jump_counter++;

    // Set the jump timer
    jump_timer = jump_hold_frames;
}

// End the jump if space is not being held
if !jump_key_hold {
    jump_timer = 0;
}

if jump_timer > 0 {
    yspeed = jump_speed;
    jump_timer--;
}
/////////////////////////////////////////////////////////////////////
////////////////////////FACE ORIENTATION/////////////////////////////
/////////////////////////////////////////////////////////////////////
sprite_index = sprite[face];
if xspeed > 0
{
	face = RIGHT;
}
if xspeed < 0
{
	face = LEFT;
}
//////////////////////////////////////////////////////////////////////
/////////////////////////////COLLISION////////////////////////////////
//////////////////////////////////////////////////////////////////////
if place_meeting(x + xspeed, y, obj_ground) {
    var _pixelCheck = sign(xspeed);
    while !place_meeting(x + _pixelCheck, y, obj_ground) {
        x += _pixelCheck;
    }
    xspeed = 0;
}

if place_meeting(x + xspeed, y + yspeed, obj_ground) {
    var _pixelCheck = sign(yspeed);
    while !place_meeting(x + xspeed, y + _pixelCheck, obj_ground) {
        y += _pixelCheck;
    }
    yspeed = 0;
}
//////////////////////////////////////////////////////////////////////
/////////////////////////////MOVE X Y/////////////////////////////////
//////////////////////////////////////////////////////////////////////

x += xspeed;
y += yspeed;

///////////////////////////////////////////////////////////////////////
/////////////////////////////IDLE ANIMATION////////////////////////////
///////////////////////////////////////////////////////////////////////
if (xspeed == 0 && yspeed == 0 && can_jump == true) 
{
	image_index = 0;
}

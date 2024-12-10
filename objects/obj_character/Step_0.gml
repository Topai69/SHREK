//inputs
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
jump_key_pressed = keyboard_check_pressed(vk_space);
jump_key_hold = keyboard_check(vk_space);

//speeds
xspeed = (right_key - left_key) * move_speed;

//gravity
yspeed += grav;

//reset the jump count when on the ground
if place_meeting(x, y + 1, obj_ground) {
    jump_counter = 0;
    show_debug_message(jump_counter);
	touched_wall_left = 0;
	touched_wall_right = 0;
} else {
    // Ensure the jump counter is set to 1 if walking off edges
    if jump_counter == 0 {
        jump_counter = 1;
    }
}
//if !place_meeting(x,y,obj_ground) show_debug_message(jump_counter);
// Wall jump logic
if place_meeting(x + 1, y, obj_wall1) {
    // Allow a single jump from walls
    if jump_counter == 1 && jump_key_pressed {
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
    }
	touched_wall_right = 1;
	show_debug_message(jump_counter);
	if touched_wall_left && jump_counter == 2
	{
		jump_counter = 1;
		touched_wall_left = 0;
	}
}
if place_meeting(x - 1, y, obj_wall) 
{
	if jump_counter == 1 && jump_key_pressed {
        jump_counter++;
        jump_timer = jump_hold_frames;
        yspeed = jump_speed;
    }
	touched_wall_left = 1;
	show_debug_message(jump_counter);
	if touched_wall_right && jump_counter == 2
	{
		jump_counter = 1;
		touched_wall_right = 0;
	}
}

// Handle jump input
if jump_key_pressed && jump_counter < jump_max {
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

//collision
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

x += xspeed;
y += yspeed;
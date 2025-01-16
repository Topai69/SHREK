xspeed = 0;
yspeed = 0;
move_speed = 1.3;
grav = 0.2;

//wall slide mechanics
wall_slide_timer_left = 0;
wall_slide_timer_right = 0;

//global checkpoint for respawn
global.checkpoint_x = x;  
global.checkpoint_y = y;

//jumping
jump_speed = -2;
health = 4;
on_ground = false;
jump_max = 2;
jump_counter = 0;
can_jump = true;
jump_hold_frames = 15;
jump_timer = 0;
touched_wall_left = 0;
touched_wall_right = 0;
//collision
has_collided = false;

//face_orientation
sprite[RIGHT] = spr_walking_right;
sprite[LEFT] = spr_walking_left;
sprite[WALL_RIGHT] = spr_wall_slide_right;
sprite[WALL_LEFT] = spr_wall_slide_left;
sprite[JUMP_LEFT] = spr_jump_left;
sprite[JUMP_RIGHT] = spr_jump_right;
sprite[HAMMER] = spr_hammering;
face = RIGHT;

/////respawn
checkpoint = 1;
 
current_platform = noone;



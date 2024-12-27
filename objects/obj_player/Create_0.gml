xspeed = 0;
yspeed = 0;
health = 4;


move_speed = 1;
grav = 0.2;

//jumping
jump_speed = -1.5;
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

face = RIGHT;  
current_platform = noone;

//moving platform


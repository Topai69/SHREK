if (is_active && place_meeting (x, y - 1, obj_player)){
    timer = 60;
    is_active = false;
}

if (timer > 0) {
    timer -= 1;
    if (timer == 0){
        sprite_index = -1;
        respawn_timer = 100; 
    }
}

if (respawn_timer > 0){
    respawn_timer -= 1;
    if (respawn_timer == 0){
        is_active = true;
        sprite_index =  spr_destructiblePlatforms;
        timer = -1;
        respawn_timer = -1;
    }
}
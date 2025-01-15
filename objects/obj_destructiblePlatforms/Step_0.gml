if (is_active && place_meeting (x, y - 1, obj_player)){
    timer = 60;
    is_active = false
}

if (timer > 0) {
    timer -= 1;
    if (timer == 0){
        instance_destroy();
    }
}
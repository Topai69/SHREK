if (distance_to_object(obj_player) < 8 && keyboard_check_pressed(ord("H"))) {
    hits_remaining -= 1;

    if (hits_remaining == 2){
        sprite_index = spr_wall_damaged;
    } else if (hits_remaining == 1){
        sprite_index = spr_wall_broken;
    }

    if(hits_remaining <= 0){
        instance_destroy();
    }
}

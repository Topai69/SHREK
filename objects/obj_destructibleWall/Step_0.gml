if (distance_to_object(obj_player) < 8 && keyboard_check_pressed(ord("H"))){
    hit -= 1;

    audio_play_sound(snd_breakingWalls, 1, false);

    if (hit == 2){
        sprite_index = spr_damagedWall;
    } else if(hit == 1){
        sprite_index = spr_brokenWall;
    }

    if (hit <= 0){
        instance_destroy();
    }
}

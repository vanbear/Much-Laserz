with (obj_player)
{
    if (alarm[1] == -1)
    {
        show_debug_message("Dead.");
        audio_play_sound(snd_dead,1,0);
        //sprite_index = spr_player_dead;
        
        canmove = false;
        vspd = 0;
        hspd = 0;
        hsp_final = 0;
        grav = 0;
        
        alarm[1]=2*room_speed;
    }
}

//draw_text_colour(obj_player.x-10, obj_player.y - 40, "DEAD", c_red, c_red, c_red, c_red, 1);


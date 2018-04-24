/// Controls
right_key = keyboard_check(vk_right) || (gamepad_axis_value(0,gp_axislh) > 0);                   //klaiwsz poruszsania sie w prawo
left_key = keyboard_check(vk_left) || (gamepad_axis_value(0,gp_axislh) < 0);                    //klaiwsz poruszsania sie w lewo
down_key = keyboard_check(vk_down) || (gamepad_axis_value(0,gp_axislv) > 0);                    //klaiwsz w dol
    
jump_key = keyboard_check_pressed(vk_up) || (gamepad_button_check_pressed(0,gp_face1));       //klaiwsz skoku
jump_key_hold = keyboard_check(vk_up) || (gamepad_button_check(0,gp_face1));
    
use_key = keyboard_check_pressed(ord('X')) || (gamepad_button_check_pressed(0,gp_face2));        //klawisze interakcji 1
use_key_hold = keyboard_check(ord('X')) || (gamepad_button_check(0,gp_face2));
    
use_key2 = keyboard_check_pressed(ord('Z')) || (gamepad_button_check_pressed(0,gp_face3));       //klawisze interakcji 2
use_key_hold2 = keyboard_check(ord('Z')) || (gamepad_button_check(0,gp_face3));

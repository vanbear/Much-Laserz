/// scr_menu();

switch(mpos)
{
 case 0: 
 {
    room_goto(rm_level_select); break;
 }
 case 1: 
 {
    break;
 }
 case 2: 
 {
    game_end(); break;
 }
 default:
 {
    break;
 }
}

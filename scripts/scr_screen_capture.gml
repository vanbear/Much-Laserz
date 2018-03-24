/* SCRIPT */
//scr_screen_capture();

//variables
var ret = -1;
var sfc_width = surface_get_width(application_surface);
var sfc_height = surface_get_height(application_surface);

//create a drawing surface
var sfc = surface_create(sfc_width,sfc_height);
surface_set_target(sfc);

//clear the surface you created just in case
draw_set_colour_write_enable(0, 0, 0, 1);
draw_clear(c_black);
draw_rectangle_colour(0, 0, sfc_width, sfc_height, c_black, c_black, c_black, c_black, 0);
draw_set_colour_write_enable(1, 1, 1, 0);

//capture screen on the surface
draw_surface(application_surface, 0, 0);
ret = background_create_from_surface(sfc,0,0,sfc_width,sfc_height,false,false); 
//if it doesn't work with backgrounds, try creating a sprite from the surface?
//this might be very heavy though

//finalise and clear surface from memory
surface_reset_target();
draw_set_colour_write_enable(1, 1, 1, 1);
surface_free(sfc);
return ret;

/*
This script will return the background itself.

Now when you pause the game, you'd just need to create a variable that holds the background:
pause_bg = scr_screen_capture();

Then draw it when your pause_ variable is true:
if background_exists(pause_bg) draw_background_ext(pause_bg, 0, 0, 1, 1, 0, -1, 1);
(Eventually you can draw a transparent black rectangle over it)

When your pause_ variable is false, don't forget to destroy the background:
if background_exists(pause_bg) background_delete(pause_bg);
*/

///draw_focus_outline(object);
var object = argument[0];
var width = 4;
var color = c_white;
var alpha = .5;

d3d_set_fog(1,c_white,0,0)

draw_sprite_ext(object.sprite_index, 0, object.x+width, object.y+width, 1, 1, object.image_angle, color, alpha);
draw_sprite_ext(object.sprite_index, 0, object.x+width, object.y-width, 1, 1, object.image_angle, color, alpha);
draw_sprite_ext(object.sprite_index, 0, object.x-width, object.y+width, 1, 1, object.image_angle, color, alpha);
draw_sprite_ext(object.sprite_index, 0, object.x-width, object.y-width, 1, 1, object.image_angle, color, alpha);

d3d_set_fog(0,0,0,0)

with(object)
    draw_self();

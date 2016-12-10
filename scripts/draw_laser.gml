///draw_laser(x1,x2,y1,y2,width,color)

x1 = argument0;
y1 = argument1;

x2 = argument2;
y2 = argument3;

width = argument4;
color = argument5;

// rysuje linie od (x1,y1) do (x2,y2)
draw_set_colour(color);   //ustawia kolor rysowania na ten podany w argumencie
draw_set_alpha(0.05)
draw_line_width(x1,y1,x2,y2,width*8);
draw_set_alpha(0.2)
draw_line_width(x1,y1,x2,y2,width*5);
draw_set_alpha(0.3)
draw_line_width(x1,y1,x2,y2,width*4);
draw_set_alpha(0.4)
draw_line_width(x1,y1,x2,y2,width*3);

draw_set_blend_mode(bm_add)
draw_set_colour(c_white); 
draw_set_alpha(0.2)
draw_line_width(x1,y1,x2,y2,width*1);


draw_set_alpha(1)
draw_set_blend_mode(0)

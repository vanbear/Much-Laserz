///draw_laser(x1,x2,y1,y2,width,color)

x1 = argument0;
x2 = argument1;
y1 = argument2;
y2 = argument3;
width = argument4;
color = argument5;

// rysuje linie od (x1,y1) do (x2,y2)
draw_set_colour(color);   //ustawia kolor rysowania na ten podany w argumencie
draw_line_width(x1,y1,x2,y2,width);


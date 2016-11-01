///init_laser(length,preision,color)
var length, precision, color;
length = argument0;
precision = argument1; // im mniejsza liczba tym dokładniejszy bardziej pamieiozerny rayasting
color = argument2;

// ustalanie kolizji z otoczeniem
// lengthdir_x i _y zwracają skladowe x i y wektora z podana dlugoscia i kierunkiem
// petla dziala dopoki wartosc dlugosci lasera nie osiagnie max wartosci lub nie napotka sciany sprawdzajac kolejne polozenia okreslone podanym wektorem
// precyzja polega na tym co ile pikseli gra ma sprawdzac kolizje

for (i=0; (i<length) && (!collision_point (xx+lengthdir_x(i,dir), yy+lengthdir_y(i,dir), obj_wall,1,1)); i+=precision)
{
    dis=i;    // po napotkaniu kolizji (osiagnieciu max dlugosci) przypisuje wartosc dlugosci lasera
}

// ustalanie koordynatow konca rysowania lasera
x1 = xx+lengthdir_x(dis,dir);
y1 = yy+lengthdir_y(dis,dir);
x2 = xx+lengthdir_x(dis+precision,dir);
y2 = yy+lengthdir_y(dis+precision,dir);

//rysowanie lasera
draw_laser(xx,yy,x2,y2,3,color);

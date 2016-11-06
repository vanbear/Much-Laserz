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
xx1 = xx+lengthdir_x(dis,dir);
yy1 = yy+lengthdir_y(dis,dir);
xx2 = xx+lengthdir_x(dis+precision,dir);
yy2 = yy+lengthdir_y(dis+precision,dir);

//rysowanie lasera
draw_laser(xx,yy,xx2,yy2,3,color);

//checks if laser is colliding with mirror, and if it is then make the mirror reflect
if collision_point(xx1,yy1,par_mirror,0,1) || collision_point(xx2,yy2,par_mirror,0,1) {
    inst = instance_nearest(xx2,yy2,par_mirror)
    inst.xx = xx1
    inst.yy = yy1
    inst.dir = inst.v1 + (inst.v2 - dir)
    inst.dis = length-dis
    with inst {init_laser(dis,5,color)}
}

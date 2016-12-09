///init_laser(length,preision,color)
var length, precision, color;
length = argument0;
precision = argument1; // im mniejsza liczba tym dokładniejszy bardziej pamieiozerny rayasting
color = argument2;

// ustalanie kolizji z otoczeniem
// lengthdir_x i _y zwracają skladowe x i y wektora z podana dlugoscia i kierunkiem
// petla dziala dopoki wartosc dlugosci lasera nie osiagnie max wartosci lub nie napotka sciany sprawdzajac kolejne polozenia okreslone podanym wektorem
// precyzja polega na tym co ile pikseli gra ma sprawdzac kolizje

for (i=0; (i<length); i+=precision)
{
    lx = xx+lengthdir_x(i,dir);
    ly = yy+lengthdir_y(i,dir);
    if(collision_point (lx, ly , obj_wall,1,1))
    {
        dis=i;    // po napotkaniu kolizji (osiagnieciu max dlugosci) przypisuje wartosc dlugosci lasera
        // ustalanie koordynatow konca rysowania lasera
        xx1 = xx+lengthdir_x(dis,dir);
        yy1 = yy+lengthdir_y(dis,dir);
        xx2 = xx+lengthdir_x(dis+precision,dir);
        yy2 = yy+lengthdir_y(dis+precision,dir);
        //rysowanie lasera
        draw_laser(xx,yy,xx2,yy2,3,color);
        
        break;
    }
    if (collision_point (lx, ly , obj_mirrortest,1,1))
    {
        dis=i;
        xx1 = xx+lengthdir_x(dis,dir);
        yy1 = yy+lengthdir_y(dis,dir);
        xx2 = xx+lengthdir_x(dis+precision,dir);
        yy2 = yy+lengthdir_y(dis+precision,dir);
        //rysowanie lasera
        draw_laser(xx,yy,xx2,yy2,3,c_blue);
        
        inst = instance_nearest(xx2,yy2,obj_mirrortest);
        inst.xx = xx1;
        inst.yy = yy1;
        
        n=collision_normal(xx1,yy1,inst,7.5,1);
        if (n == -1) {show_debug_message("ERROR: "); break;}
        
        inst.dir = (2*n)-dir-180;
        inst.dis = length-dis;
        
        with inst {init_laser(dis,precision,color)}
        break;
    }
    if (collision_point (lx, ly , obj_sensor,1,1))
    {
        dis=i; 
        xx1 = xx+lengthdir_x(dis,dir);
        yy1 = yy+lengthdir_y(dis,dir);
        xx2 = xx+lengthdir_x(dis+precision,dir);
        yy2 = yy+lengthdir_y(dis+precision,dir);
        //rysowanie lasera
        draw_laser(xx,yy,xx2,yy2,3,c_green);
        
        inst = instance_nearest(xx2,yy2,obj_sensor);
        inst.active=true;
        inst.alarm[0] = 2;
        break;
    }  
}



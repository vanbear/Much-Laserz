///init_laser(length,preision,color)
var length, precision, color;
length = argument0;
precision = argument1; // im mniejsza liczba tym dokładniejszy bardziej pamieiozerny rayasting
color = argument2;

var width=1;

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
        draw_laser(xx,yy,xx2,yy2,width,color);
        
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
        draw_laser(xx,yy,xx2,yy2,width,color);
        
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
        draw_laser(xx,yy,xx2,yy2,width,color);
        
        inst = instance_nearest(xx2,yy2,obj_sensor);
        inst.active=true;
        inst.alarm[0] = 2;
        break;
    }  
    if (collision_point (lx, ly , par_splitter,1,1))
    {
        dis=i;
        xx1 = xx+lengthdir_x(dis,dir);
        yy1 = yy+lengthdir_y(dis,dir);
        xx2 = xx+lengthdir_x(dis+precision,dir);
        yy2 = yy+lengthdir_y(dis+precision,dir);
        //rysowanie lasera
        draw_laser(xx,yy,xx2,yy2,width,color);
        
        inst = instance_nearest(xx2,yy2,par_splitter);
        inst.xx = inst.x;
        inst.yy = inst.y;
        inst.color=color;
        inst.active = true
        inst.alarm[0] = 2;
        
        break;
    }
    if (collision_point (lx, ly , obj_player,1,1))
    {
        dis=i;
        xx1 = xx+lengthdir_x(dis,dir);
        yy1 = yy+lengthdir_y(dis,dir);
        xx2 = xx+lengthdir_x(dis+precision,dir);
        yy2 = yy+lengthdir_y(dis+precision,dir);
        //rysowanie lasera
        draw_laser(xx,yy,xx2,yy2,width,color);
        
        scr_player_dead();
        break;
    }
    if (collision_point (lx, ly , obj_bend,1,1))
    {
        dis=i;
        xx1 = xx+lengthdir_x(dis,dir);
        yy1 = yy+lengthdir_y(dis,dir);
        xx2 = xx+lengthdir_x(dis+precision,dir);
        yy2 = yy+lengthdir_y(dis+precision,dir);
        //rysowanie lasera
        draw_laser(xx,yy,xx1,yy1,width,color);
        
        inst = instance_nearest(xx2,yy2,obj_bend);
        inst.xx = xx1;
        inst.yy = yy1;
        
        n=collision_normal(xx1,yy1,inst,7.5,1);
        if (n == -1) {show_debug_message("ERROR: "); break;}
        
        ///obliczenia
        
        wsp = 1.33; //wspolczynnik zalamania wody
        
        alpha = abs(dir - 270); 
        beta = arcsin(dsin(alpha)/wsp); 
        inst.dir = dir - radtodeg(beta); 
        ///koniec obliczen
        show_debug_message("Kat padania: " + string(alpha));
        show_debug_message("Kat zalamania: " + string(radtodeg(beta)));
        show_debug_message("Kierunek lasera: " + string(inst.dir)); show_debug_message(" ");
        
        
        inst.dis = length-dis;
        
        with inst {init_laser(dis,precision,color)}
        break;
        
        break;
    }
}



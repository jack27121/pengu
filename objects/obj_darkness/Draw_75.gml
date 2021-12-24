/// @description
draw_set_color(black);
draw_set_alpha(alpha*0.8);
draw_rectangle(0,0,view_w*upscale,view_h*upscale,0);
draw_set_alpha(1);
draw_set_color(white);

c_rainbow = make_color_hsv((get_timer()/10000) mod 255,255,255);
draw_set_alpha(obj_darkness.alpha);
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_color(c_rainbow);
draw_set_font(f_pixel);
draw_text_outline(view_w/2,(view_h/3)+sinwave(-6,6,2,0),"Merry Christmas!",1,c_black,16);

draw_text_outline(view_w/2,(view_h/2.5)+sinwave(-6,6,2,0),"Thank you for playing our game!",1,c_black,16);

draw_set_color(c_white);
draw_text_outline(view_w/2,view_h/1.5,"We worked real hard\n to give you a neat game to play leading up to christmas,\nso we really hope you enjoyed it\nXOXOXO, STANN.CO, Stepford, chocoholicmonkey & FractalCounty",1,c_black,16);
draw_set_valign(fa_top);
draw_set_halign(fa_left);	
draw_set_alpha(1);
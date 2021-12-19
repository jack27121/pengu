lenx = lengthdir_x(1,get_timer()/5000);
leny = lengthdir_y(1,get_timer()/5000);

if global.gottenstar = 1 {alph = 0.4;}
if global.gottenstar = 0 {alph = 1;}

draw_sprite_ext(spr_transition_diamond_cent,image_index,x,y,image_xscale,image_yscale,sinwave(-360,360,4,0),c_white,0.2*alph);
draw_sprite_ext(sprite_index,image_index,x-lenx,y-leny,image_xscale*2,image_yscale*2,sinwave(-90,90,1,0),c_white,0.1*alph);
draw_sprite_ext(sprite_index,image_index,x-lenx,y-leny,image_xscale,image_yscale,sinwave(-5,5,1,0),darkred,0.3*alph);
draw_sprite_ext(sprite_index,image_index,x+lenx,y+leny,image_xscale,image_yscale,sinwave(-5,5,1,0),image_blend,alph);
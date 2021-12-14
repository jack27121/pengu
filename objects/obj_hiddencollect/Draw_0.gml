lenx = lengthdir_x(1,get_timer()/5000);
leny = lengthdir_y(1,get_timer()/5000);

draw_sprite_ext(spr_transition_diamond_cent,image_index,x,y,image_xscale,image_yscale,sinwave(-360,360,4,0),c_white,0.1);
draw_sprite_ext(sprite_index,image_index,x-lenx,y-leny,image_xscale,image_yscale,sinwave(-5,5,1,0),darkred,0.2);
draw_sprite_ext(sprite_index,image_index,x+lenx,y+leny,image_xscale,image_yscale,sinwave(-5,5,1,0),image_blend,1);
wavemod = x/200;

draw_sprite_ext(sprite_index,image_index,x,y+sinwave(-5,5,1,wavemod),image_xscale,image_yscale,sinwave(-10,10,1,wavemod),image_blend,image_alpha);
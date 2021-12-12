/// @desc Draw player
if(hurting && floor(current_time/50) mod 2 == 0){ //if hurt it'll flash
	gpu_set_fog(true, gray,0,0);
}

state.draw();

gpu_set_fog(false, gray,0,0);

//draw_sprite_ext(mask_index,0,x,y,flip,image_yscale,image_angle,white,0.8);
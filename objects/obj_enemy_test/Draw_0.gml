/// @description
if(hurting && floor(current_time/50) mod 2 == 0){ //if hurt it'll flash
	gpu_set_fog(true, gray,0,0);
}
state.draw();
gpu_set_fog(false, gray,0,0);
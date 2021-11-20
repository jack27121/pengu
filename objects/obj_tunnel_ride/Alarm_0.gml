/// @description initiates the loop
with(obj_player){
	path_start(other.path,other.spd,path_action_stop,true);
	state.change("sliding");
	hspd = 0;
	vspd = 0;
	other.x_delta = x;
	other.y_delta = y;
	controlled = false;
}
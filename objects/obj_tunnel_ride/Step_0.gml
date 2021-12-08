/// @description
if (triggered){
	with(obj_player){
		image_angle = point_direction(other.x_delta,other.y_delta,x,y);
		other.x_delta = x;
		other.y_delta = y;
		hspd = 0;
		vspd = 0;
		if(path_position == 1){
			hspd = lengthdir_x(other.spd,image_angle);
			vspd = lengthdir_y(other.spd,image_angle);
			controlled = true;
			state.change("jumping");
			other.triggered = false;
			if(other.script != -1) other.script();
		}
	}
} else if (place_meeting(x,y,obj_player)){
	triggered = true;
	with(obj_player){
		path_start(other.path,other.spd,path_action_stop,true);
		state.change("spinning");
		image_xscale = 1;
		hspd = 0;
		vspd = 0;
		other.x_delta = x;
		other.y_delta = y;
		controlled = false;
	}	
}

//var x_ = point_distance(end_x,end_y,obj_pl)
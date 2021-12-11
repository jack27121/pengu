/// @description
if (triggered){
	with(obj_player){
		angle = point_direction(other.x_delta,other.y_delta,x,y)-90;
		other.x_delta = x;
		other.y_delta = y;
		hspd = 0;
		vspd = 0;
		if(path_position == 1){
			hspd = lengthdir_x(other.spd,angle+90);
			vspd = lengthdir_y(other.spd,angle+90);
			controlled = true;
			state.change("launch");
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
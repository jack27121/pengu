/// @description
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
		other.end_method();
		image_angle = 0;
		instance_destroy(other);
	}
}

//var x_ = point_distance(end_x,end_y,obj_pl)
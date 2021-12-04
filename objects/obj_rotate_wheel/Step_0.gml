/// @description
//with(obj_player){
//	if (place_meeting(x,y+vspd,other) && grounded){
//		var dist = point_distance(x,y,other.x,other.y);
//		var angle = point_direction(x,y,other.x,other.y);
//		var x_ = (lengthdir_x(dist,angle) - lengthdir_x(dist,angle+other.rot_spd));
//		var y_ = (lengthdir_y(dist,angle) - lengthdir_y(dist,angle+other.rot_spd));
//		//show_debug_message(x_);
//		//show_debug_message(y_);
//		
//		x+=x_;
//		y+=y_;
//	}
//}

image_angle+= rot_spd;
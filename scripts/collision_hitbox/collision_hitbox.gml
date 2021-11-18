/// @func collision_hitbox
/// @description = checks if a objects hitbox, can get from one point to another with no collisions
/// @param	start_x
/// @param	start_y
/// @param	end_x
/// @param	end_y
/// @param	collision_object
function collision_hitbox() {

	var start_x = argument[0]; // start_x
	var start_y = argument[1]; // start_y
	var end_x = argument[2]; // end_x
	var end_y = argument[3]; // end_y
	var collision_object = argument[4]; // collision_object

	var dist = point_distance(start_x,start_y,end_x,end_y);
	var dir = point_direction(start_x,start_y,end_x,end_y);

	for(var i = 0; i < dist ;i++){
	
		var pos_x = start_x+lengthdir_x(i,dir);
		var pos_y = start_y+lengthdir_y(i,dir);
	
		if (place_meeting(pos_x,pos_y,collision_object)) {
			return true;
		}
	}
	return false


}

/// @func collision_hitbox
/// @description = checks if a point is within a rectange relative to the screen
/// @param	pos_x
/// @param	pos_y
/// @param	x1
/// @param	y1
/// @param	x2
/// @param	y2
function point_in_rectangle_camera() {

	var cam_x = cam_x();
	var cam_y = cam_y();

	var pos_x = argument[0]; // pos_x
	var pos_y = argument[1]; // pos_y
	var x1 = argument[2]; // x1
	var y1 = argument[3]; // y1
	var x2 = argument[4]; // x2
	var y2 = argument[5]; // y2

	return point_in_rectangle(pos_x,pos_y,cam_x+x1,cam_y+y1,cam_x+x2,cam_y+y2);


}

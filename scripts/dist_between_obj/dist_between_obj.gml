/// @desc dist_between_obj (obj1,obj2) returns distance between 2 objects
/// @arg obj1
/// @arg obj2
function dist_between_obj(argument0, argument1) {
	var obj1 = argument0
	var obj2 = argument1

	return point_distance(obj1.x,obj1.y,obj2.x,obj2.y);


}

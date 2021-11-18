/// @desc create_object (object) creates object
/// @arg object
function create_object(argument0) {
	var object = argument0
	var object = instance_create_layer(x,y,"instances",object);
	return object;


}

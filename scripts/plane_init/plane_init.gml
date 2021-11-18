/// @function plane_init()
/// @description inits a plane
function plane_init() {
	if (!instance_exists(obj_plane))
	{
		instance_create_depth(x,y,0,obj_plane)
	}
	with (obj_plane)
	{
		queue++;
		kill = false;
	}
}
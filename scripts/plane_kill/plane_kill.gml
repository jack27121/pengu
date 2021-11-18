/// @function plane_kill
/// @description makes the plane go to the bottom and then kills it
function plane_kill() {
	with (obj_plane)
	{
		boxDest = view_h;
		boxStart = boxY;
		boxTime = 0;
		popup = false;
		kill = true;
	}
}

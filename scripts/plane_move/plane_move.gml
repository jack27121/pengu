/// @function plane_move(dest)
/// @param	dest
/// @description makes the plane go to the destination
function plane_move(dest) {
	with (obj_plane)
	{
		if (boxDest != dest ){
			boxDest = dest 
			boxTime = 0;
			boxStart = boxY;
		}
	}
}
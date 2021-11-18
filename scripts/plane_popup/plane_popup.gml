/// @func plane_popup(popup, arrows)
/// @description activates the popup for the box
/// @param	popup bool
/// @param	arrows bool
function plane_popup() {

	popup = argument[0]; // popup
	arrows = argument[1]; // arrows

	if (instance_exists(obj_plane))
	{
		with (obj_plane)
		{
			popup = other.popup;
			arrows = other.arrows;
			if(popup == false)
			{
				boxFrameTime = 1;	
			}
		}	
	}


}

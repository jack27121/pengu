/// @function screen_shake(magnitude, duration);
/// @description makes the screen shake
/// @param	magnitude
/// @param	duration in frames
function screen_shake(magnitude, duration) {
	obj_camera.shake_magnitude =+ magnitude;
	obj_camera.shake_length =+ duration;
	obj_camera.shake_time = 0;
}

/// @function camera_move(_x,_y,duration)
/// @description moves the camera to x y
/// @param _x
/// @param _y
/// @param _duration
function camera_move(_x, _y, duration){
	if(duration == 0){
		obj_camera.x = _x;
		obj_camera.y = _y;
	}else{
		with (obj_camera){
			moving = true;
			t = 0;
			xStart = x;
			yStart = y;
		}
		obj_camera.xTo = _x;
		obj_camera.yTo = _y;
		obj_camera.duration = duration;
	}
}

/// @function camera_zoom(_zoom,zoom_duration)
/// @description zooms the camera
/// @param _zoom
/// @param zoom_duration
function camera_zoom(_zoom, zoom_duration){
	with (obj_camera)
	{
		zooming = true;
		t_zoom = 0;
		zoomStart = zoom;
	}
	obj_camera.zoomTo = _zoom;
	obj_camera.zoom_duration = zoom_duration;
}

/// @function cam_x()
/// @description get camera x position
function cam_x(){
	return camera_get_view_x(view_camera[0]);
}

/// @function cam_y()
/// @description get camera y position
function cam_y(){
	return camera_get_view_y(view_camera[0]);
}

/// @function view_w_gui()
/// @description gets gui width
function view_w_gui(){
	return view_w * upscale;
}

/// @function view_h_gui()
/// @description gets gui height
function view_h_gui(){
	return view_h * upscale;
}

/// @function out_cam_bounds()
/// @description returns if the object is outside cam bounds
function out_cam_bounds(){
	var margin = 64;
	var col = ( //uses boundinx box to see if it's within the camera view
		bbox_left   < cam_x()-margin ||
		bbox_top    < cam_y()-margin ||
		bbox_right  > (cam_x()+view_w+margin) ||
		bbox_bottom > (cam_y()+view_h+margin)
	)
	if(col)return true
	else return false;	
}
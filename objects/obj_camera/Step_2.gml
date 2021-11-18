/// @description
#region Fullscreen toggle
if (keyboard_check_pressed(vk_f11)){
	if (window_get_fullscreen()){
		window_set_fullscreen(false);
	}else{
		window_set_fullscreen(true);
	}
	resolution_resize();
}
#endregion

if (!is_undefined(global.camera_follow))
{
	//update destination
	xTo = global.camera_follow.x;
	yTo = global.camera_follow.y;
	
	//update camera position
	if (abs(xTo - x) > bounds_w){
		x += (xTo - x)*spd
	}
	
	if (abs(y - yTo) > bounds_h){
		y += (yTo - y)*spd
	}
	
} else if(moving){
	//gradually moves camera into position based on duration
	if (duration == 0){
		x = xTo;
		y = yTo;
		
	} else {
		x = ease_in_out(t,xStart,xTo-xStart,duration);
		y = ease_in_out(t,yStart,yTo-yStart,duration);

		t++;
	}
	if(x == xTo && y == yTo) moving = false;
}

if(zooming){
	//gradually zooms camera
	zoom = ease_in_out(t_zoom++,zoomStart,zoomTo-zoomStart,zoom_duration);
	if(zoom == zoomTo) zooming = false;
	camera_set_view_size(cam,view_w*zoom,view_h*zoom);
}

//screen-shake
var screen_shake_ = shake(shake_time++,shake_magnitude,shake_length);
shake_x = screen_shake_;
shake_y = screen_shake_;
var vibration = screen_shake_ / 20;
gamepad_set_vibration(0,vibration,vibration);

x = clamp(x,(view_w/2),room_width -(view_w/2));
y = clamp(y,(view_h/2),room_height-(view_h/2));

//update camera view
var new_x = x - (view_w / 2 + shake_x)*zoom;
var new_y = y - (view_h / 2 + shake_y)*zoom;

//constrains camera to room bounds
//constrained_x = clamp(new_x,0,room_width-view_w);
//constrained_y = clamp(new_y,0,room_height-view_h)

camera_set_view_pos(cam, new_x, new_y);

effect_clear()
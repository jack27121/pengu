if (!is_undefined(global.camera_follow))
{
	//update destination
	xTo = global.camera_follow.x;
	yTo = global.camera_follow.y;
	
	//update camera position
	while (abs(xTo - x) > bounds_w)
	{
		if (x < xTo) x++;
		else if (x > xTo) x--;
	}
	
	while (abs(y - yTo) > bounds_h)
	{
		if (y < yTo) y++;
		else if (y > yTo) y--;
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

//update camera view
camera_set_view_pos(cam, x - (view_w / 2 + shake_x)*zoom , y - (view_h / 2 + shake_y)*zoom );
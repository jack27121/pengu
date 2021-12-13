/// @description
if (!is_undefined(global.camera_follow)){
	//update destination
	xTo = global.camera_follow.x;
	yTo = global.camera_follow.y;
	
	//update camera position
	while (abs(xTo - x) > bounds_w)
	{
		if (x < xTo) x+=spd;
		else if (x > xTo) x-=spd;
	}
	
	while (abs(y - yTo) > bounds_h)
	{
		if (y < yTo) y+=spd;
		else if (y > yTo) y-=spd;
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

#region Deactivates certain objects when they're out of bounds
var margin = 64;
var region_x1 = new_x-margin;
var region_x2 = new_x+view_w+margin;
var region_y1 = new_y-margin;
var region_y2 = new_y+view_h+margin;
instance_activate_all();
with(obj_seal){
	if (!collision_rectangle(region_x1,region_y1,region_x2,region_y2,self,false,false)){
		instance_deactivate_object(self);
	}
}

with(obj_falling_platform){ // only deactivates if it's in the idle state
	if (state.state_is("idle") && !collision_rectangle(region_x1,region_y1,region_x2,region_y2,self,false,false)){
		instance_deactivate_object(self);
	}
}

with(obj_falling_platform_icey){ // only deactivates if it's in the idle state
	if (state.state_is("idle") && !collision_rectangle(region_x1,region_y1,region_x2,region_y2,self,false,false)){
		instance_deactivate_object(self);
	}
}

with(obj_point){ // only deactivates if it's waving in the air normally
	if (!fired && !collision_rectangle(region_x1,region_y1,region_x2,region_y2,self,false,false)){
		instance_deactivate_object(self);
	}
}

with(obj_spring){
	if (!collision_rectangle(region_x1,region_y1,region_x2,region_y2,self,false,false)){
		instance_deactivate_object(self);
	}
}
#endregion
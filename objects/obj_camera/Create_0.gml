/// @description
#macro cam view_camera[0]
#macro view_w 320 //camera_get_view_width(view_camera[0])
#macro view_h 180 //camera_get_view_height(view_camera[0])
//Game Resoloution
//global.upscale = 4;
#macro upscale 4

view_surf = -1;
camera_set_view_size(cam,view_w,view_h);

resolution_resize = function(){
	window_set_size(view_w*upscale, view_h*upscale);
	display_set_gui_size(-1,-1);
	surface_resize(application_surface, view_w,view_h);
	display_reset(0, false);
	
	view_wport[0] = view_w
	view_hport[0] = view_h
	
	display_width =  view_w * upscale;
	display_height = view_h* upscale;
	
	if(window_get_fullscreen())
	{
		display_width = display_get_width();
		display_height = display_get_height();
	}
}
resolution_resize();

global.camera_follow = undefined;

zoom = 1;

// Dipplers note: we should make this a global variable that can change based on the room. PBBBPLPBLPTTT
//the camera bounding box, for the player to leave before the camera starts moving
bounds_w = 20;
bounds_h = 20;

//screen shake1
shake_length = 0;
shake_magnitude = 0;
shake_time = 0;

moving = false;
zooming = false;

shake_x = 0;
shake_y = 0;

constrained_x = 0;
constrained_y = 0;

spd = 0.2;

#region shaders
application_surface_draw_enable(false);
rgb_split_surf = -1

#endregion
/// @description draws the actual game
var ax = cam_x()// - x +(view_w/2);
var ay = cam_y()// - y +(view_h/2);
draw_surface_stretched(application_surface,0,0,view_w*upscale,view_h*upscale);
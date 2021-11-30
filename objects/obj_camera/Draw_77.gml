/// @description
/// @description shaders
//var ax = cam_x() - x +(view_w/2);
//var ay = cam_y() - y +(view_h/2);
//draw_surface(application_surface,ax,ay);
//
//shader_reset();
//surface_reset_target();

//Draw rgb_split_surf
draw_surface_stretched(application_surface,0,0,view_w*upscale,view_h*upscale);
//surface_free(rgb_split_surf);
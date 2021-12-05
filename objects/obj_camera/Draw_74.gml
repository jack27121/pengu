/// @description draws the actual game
display_set_gui_size(view_w*upscale,view_h*upscale);
draw_surface_stretched(application_surface,0,0,view_w*upscale,view_h*upscale);
display_set_gui_size(view_w,view_h);
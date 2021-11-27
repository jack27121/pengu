/// @description
/// @description shaders
//var ax = cam_x() - x +(view_w/2);
//var ay = cam_y() - y +(view_h/2);
//draw_surface(application_surface,ax,ay);
//
//shader_reset();
//surface_reset_target();

//Draw rgb_split_surf
draw_surface_stretched(application_surface,0,0,view_w*global.upscale,view_h*global.upscale);
//surface_free(rgb_split_surf);

#region points n' timer
draw_set_font(f_hyper_mono);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_outline(10,10,"SNACKS:" + string_replace_all(string_format(global.points,3,0)," ","0"),5);

//draw_text(4,36,"SECRET: " + string(global.secret) + " / 1");
var frames, seconds, minutes = 0;

frames = string_format(global.timer mod room_speed,2,0);
seconds = string_format(global.timer div 60 mod 60,2,0);
minutes = string_format(global.timer div 3600,2,0);
var timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0")

draw_text_outline(10,60,"TIME:" + timer_text,5);
#endregion
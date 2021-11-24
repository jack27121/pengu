/// @description
/// @description shaders
if (!surface_exists(rgb_split_surf))
{
    rgb_split_surf=surface_create(view_w,view_h);
}

//RGB-split
surface_set_target(rgb_split_surf);
shader_set(sh_scramble);

var surf_width = surface_get_width(rgb_split_surf);
var surf_height = surface_get_height(rgb_split_surf);
var u_surf_size = shader_get_uniform(sh_scramble,"surface_size");
shader_set_uniform_f(u_surf_size,surf_width,surf_height);

var u_random_r = shader_get_uniform(sh_scramble,"random_r");
var u_random_g = shader_get_uniform(sh_scramble,"random_g");
var u_random_b = shader_get_uniform(sh_scramble,"random_b");
var shake_x = obj_camera.shake_x;
var shake_y = obj_camera.shake_y;

shader_set_uniform_f(u_random_r,random_range(-shake_x,shake_x),random_range(-shake_y,shake_y));
shader_set_uniform_f(u_random_g,random_range(-shake_x,shake_x),random_range(-shake_y,shake_y));
shader_set_uniform_f(u_random_b,random_range(-shake_x,shake_x),random_range(-shake_y,shake_y));

var ax = cam_x() - x +(view_w/2);
var ay = cam_y() - y +(view_h/2);
draw_surface(application_surface,ax,ay);

shader_reset();
surface_reset_target();

//Draw rgb_split_surf
draw_surface_stretched(rgb_split_surf,0,0,view_w*global.upscale,view_h*global.upscale);
surface_free(rgb_split_surf);

#region points n' timer
draw_set_font(f_hyper);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(4,4,"POINTS: " + string(global.points));
draw_text(4,36,"SECRET: " + string(global.secret) + " / 1");
draw_text(4,70,string(global.timer/fps));
#endregion
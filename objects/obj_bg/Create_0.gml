/// @description
array_push(global.sacred_objects,self);
depth_ = 0.5;

water_top_y = view_h/2;

u_scale = shader_get_uniform(sh_perspective,"scale");
u_pan = shader_get_uniform(sh_perspective,"pan");
u_tilt = shader_get_uniform(sh_perspective,"tilt");
u_rows = shader_get_uniform(sh_perspective,"rows");

col = make_color_rgb(34,120,195);

pan= 0
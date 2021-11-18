/// @description
depth_ = 0.5;

wall_y = 180;

u_scale = shader_get_uniform(sh_perspective,"scale");
u_pan = shader_get_uniform(sh_perspective,"pan");
u_tilt = shader_get_uniform(sh_perspective,"tilt");
u_rows = shader_get_uniform(sh_perspective,"rows");

floor_col = make_color_rgb(248,185,115);

sign_y = 110;
sign_h = sign_y+37;

backstage_y = 148;
backstage_h = backstage_y+39;

cap_y = 210;
cap_h = cap_y+8;
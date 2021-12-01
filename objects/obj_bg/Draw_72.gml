/// @description draws background
draw_clear(col);

var x_ = cam_x();// + view_w/2;
var y_ = cam_y();// + view_h/2;
//var x_offset = 200;
//var y_offset = 50;

gpu_set_texrepeat(true);
shader_set(sh_perspective);
//show_debug_message(-(x_ mod view_w)/view_w);
shader_set_uniform_f(u_pan,((x_+pan) mod view_w)/view_w);
shader_set_uniform_f(u_rows,1);
shader_set_uniform_f(u_scale,1);
shader_set_uniform_f(u_tilt,depth_);
draw_sprite_pos(spr_water,0,
	x_,y_+water_top_y, //top left
	x_+view_w,y_+water_top_y, //top right
	x_+view_w,y_+view_h, //bottom right
	x_,y_+view_h, //bottom left
1);

pan+=0.1;

//backstage
//shader_set_uniform_f(u_rows,3);
//shader_set_uniform_f(u_scale,depth_-0.02);
//shader_set_uniform_f(u_tilt,0.05);
//draw_sprite_pos(spr_bg_bowling_backstage,0,
//	x_,backstage_y, //top left
//	x_+view_w,backstage_y, //top right
//	x_+view_w,backstage_h, //bottom right
//	x_,backstage_h, //bottom left
//1);
//
////backwall
//shader_set_uniform_f(u_rows,1.5);
//shader_set_uniform_f(u_scale,depth_);
//shader_set_uniform_f(u_tilt,0);
//draw_sprite_pos(spr_bg_bowling_backwall,0,
//	x_,0, //top left
//	x_+view_w,0, //top right
//	x_+view_w,wall_y, //bottom right
//	x_,wall_y, //bottom left
//1);
//
////signs
//shader_set_uniform_f(u_rows,3);
//shader_set_uniform_f(u_scale,depth_+0.02);
//draw_sprite_pos(spr_bg_bowling_sign,0,
//	x_,sign_y, //top left
//	x_+view_w,sign_y, //top right
//	x_+view_w,sign_h, //bottom right
//	x_,sign_h, //bottom left
//1);

//floor
//shader_set_uniform_f(u_rows,3);
//shader_set_uniform_f(u_scale,1);
//shader_set_uniform_f(u_tilt,depth_);
//draw_sprite_pos(spr_water,0,
//	x_,y_, //top left
//	x_+view_w,y_, //top right
//	x_+view_w,y_+view_h, //bottom right
//	x_,y_+view_h, //bottom left
//1);

//cap
//shader_set_uniform_f(u_scale,1);
//shader_set_uniform_f(u_tilt,0);
//draw_sprite_pos(spr_bg_bowling_floor_end,0,
//	x_,cap_y, //top left
//	x_+view_w,cap_y, //top right
//	x_+view_w,cap_h, //bottom right
//	x_,cap_h, //bottom left
//1);

shader_reset();
/// @description background
if(!surface_exists(bg_surface)){
	bg_surface = surface_create(512,512);
}
surface_set_target(bg_surface);
draw_clear(black);

draw_sprite_tiled(spr_bg_sky,0,-x*0.05,0); //sky

draw_sprite_tiled(spr_bg_burg1,0,-x*0.1,0); //burg1
draw_sprite_tiled(spr_bg_burg2,0,-x*0.15,0); //burg2
draw_sprite_tiled(spr_bg_burg3,0,-x*0.2,0); //burg3

draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.25,0,0,ocean_y1, view_w,ocean_y2);  //ocean 1
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.3,0,0,ocean_y2, view_w,ocean_y3);  //ocean 2
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.35,0,0,ocean_y3, view_w,ocean_y4);  //ocean 3
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.4, 0,0,ocean_y4, view_w,ocean_y5);  //ocean 4
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.45,0,0,ocean_y5, view_w,ocean_y6);  //ocean 5
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.5, 0,0,ocean_y6, view_w,ocean_y7);  //ocean 6
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.55,0,0,ocean_y7, view_w,ocean_y8);  //ocean 7
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.6, 0,0,ocean_y8, view_w,ocean_y9);  //ocean 8
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.7,0,0,ocean_y9, view_w,ocean_y10); //ocean 9
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.8, 0,0,ocean_y10,view_w,ocean_y11); //ocean 10
draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.9,0,0,ocean_y11,view_w,ocean_y12); //ocean 11
bg_t-=0.1;
surface_reset_target();

var ax = cam_x() + frac(x);
var ay = cam_y() + frac(y);
draw_surface(bg_surface,ax,ay)//-(y/room_height)*60);

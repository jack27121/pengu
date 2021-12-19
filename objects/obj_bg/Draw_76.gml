/// @description draws background
var x_ = floor(cam_x());
var y_ = floor(cam_y());

draw_sprite_tiled(spr_bg_sky,0,x_*0.9,y_); //sky

draw_sprite_tiled(spr_bg_burg1,0,x_*0.8,y_); //burg1
draw_sprite_tiled(spr_bg_burg2,0,x_*0.7,y_); //burg2
draw_sprite_tiled(spr_bg_burg3,0,x_*0.6,y_); //burg3

if(!surface_exists(surf_ocean)){
	surface_create(512,64);
}

surface_set_target(surf_ocean);

//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.55,0,x_,ocean_y1, x_+view_w,ocean_y2); //ocean 1
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.50,0,x_,ocean_y2, x_+view_w,ocean_y3); //ocean 2
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.45,0,x_,ocean_y3, x_+view_w,ocean_y4); //ocean 3
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.4, 0,x_,ocean_y4, x_+view_w,ocean_y5); //ocean 4
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.35,0,x_,ocean_y5, x_+view_w,ocean_y6); //ocean 5
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.3, 0,x_,ocean_y6, x_+view_w,ocean_y7); //ocean 6
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.25,0,x_,ocean_y7, x_+view_w,ocean_y8); //ocean 7
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.2, 0,x_,ocean_y8, x_+view_w,ocean_y9); //ocean 8
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.15,0,x_,ocean_y9, x_+view_w,ocean_y10); //ocean 9
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.1, 0,x_,ocean_y10,x_+view_w,ocean_y11); //ocean 10
//draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*0.05,0,x_,ocean_y11,x_+view_w,ocean_y12); //ocean 11

for (var i = 0; i < 16; ++i) {
    draw_sprite_tiled_area(spr_bg_ocean,0,(x_+t)*((16-i)*0.05),0,x_,i*5, x_+view_w,(i*5)+5);
}

surface_reset_target();

//draw_surface(surf_ocean,x_,y_);

t-=0.1;
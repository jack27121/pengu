/// @description background
var ax = cam_x() + frac(x);
var ay = cam_y() + frac(y);

#region ocean
if(!surface_exists(ocean_surface)){
	ocean_surface = surface_create(512,64);
}
surface_set_target(ocean_surface);
draw_clear(black);
if global.bonuslevel = false {oceanspr = spr_bg_ocean;}
if global.bonuslevel = true {oceanspr = spr_bg_ocean_bonus;}

for (var i = 0; i < 16; ++i) {
    draw_sprite_tiled_area(oceanspr,0,(-x+bg_t)*(0.25+(i*0.05)),0,0,i*5,view_w,(i*5)+5);
}
surface_reset_target();
#endregion

#region bg
if(!surface_exists(bg_surface)){
	bg_surface = surface_create(512,256);
}
surface_set_target(bg_surface);
draw_clear(black);

if global.bonuslevel = false
{
	//REGULAR GAMEPLAY
	draw_sprite_tiled(spr_bg_sky,0,-x*0.05,0); //sky
	draw_sprite_tiled(spr_bg_burg1,0,-x*0.1,0); //burg1
	draw_sprite_tiled(spr_bg_burg2,0,-x*0.15,0); //burg2
	draw_sprite_tiled(spr_bg_burg3,0,-x*0.2,0); //burg3
}
else
{
	//BONUS GAMEPLAY
	draw_sprite_tiled(spr_bg_sky_bonus,0,-x*0.05,0); //sky
	draw_sprite_tiled(spr_bg_burg1_bonus,0,-x*0.1,0); //burg1
	draw_sprite_tiled(spr_bg_burg2_bonus,0,-x*0.15,0); //burg2
	draw_sprite_tiled(spr_bg_burg3_bonus,0,-x*0.2,0); //burg3
}

if(!instance_exists(obj_water_level)){
	draw_surface(ocean_surface,0,130);
} else { //if there's a water level present, the bg water will stretch to match the water level
	//gpu_set_blendmode(bm_add);
	var water_y = obj_water_level.y - ay;
	var yscale = (water_y - 120) / surface_get_height(ocean_surface);
	draw_surface_ext(ocean_surface, 0, 130, 1, yscale, 0, white, 1);
	gpu_set_blendmode(bm_normal);
}

bg_t-=0.1;
surface_reset_target();
#endregion

draw_surface(bg_surface,ax,ay);

//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.25,0,0,ocean_y1, view_w,ocean_y2);  //ocean 1
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.3,0,0,ocean_y2, view_w,ocean_y3);  //ocean 2
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.35,0,0,ocean_y3, view_w,ocean_y4);  //ocean 3
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.4, 0,0,ocean_y4, view_w,ocean_y5);  //ocean 4
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.45,0,0,ocean_y5, view_w,ocean_y6);  //ocean 5
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.5, 0,0,ocean_y6, view_w,ocean_y7);  //ocean 6
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.55,0,0,ocean_y7, view_w,ocean_y8);  //ocean 7
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.6, 0,0,ocean_y8, view_w,ocean_y9);  //ocean 8
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.7,0,0,ocean_y9, view_w,ocean_y10); //ocean 9
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.8, 0,0,ocean_y10,view_w,ocean_y11); //ocean 10
//draw_sprite_tiled_area(spr_bg_ocean,0,(-x+bg_t)*0.9,0,0,ocean_y11,view_w,ocean_y12); //ocean 11
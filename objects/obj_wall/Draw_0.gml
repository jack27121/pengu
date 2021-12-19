/// @description 
if distance_to_object(obj_player) < 500
{
	if placed = true {
		draw_sprite_ext(spr_lvlwall,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
	else
	{
		draw_self();	
	}
}
/// @description Esc Quitting
draw_set_font(f_hyper)
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(0,32,global.score);

//if i < quit_speed
//{
//	//Holding the Esc key, will fade in the quit icon.
//	if (keyboard_check(vk_escape))
//	{
//		draw_sprite_ext(spr_quitting, sprite_anim(i++,15), 5, 5, image_xscale, image_yscale, image_angle, image_blend, i/quit_speed)
//	}
//	
//	//Letting go will reset the quit timer
//	if (keyboard_check_released(vk_escape))
//	{
//		i = 0;	
//	}
//
//}
////activates the fade out object, and preps an alarm to close the game
//else if fading = false
//{
//	fading = true;
//	with instance_create_layer(x,y,layer,obj_fade_out) quit = true;
//}
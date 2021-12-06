/// @description
if(room != rm_lvl_select){
#region points n' timer
	draw_sprite(spr_icon_cookie,0,2,2);
	draw_set_color(white);
	draw_set_font(f_whackyjoe);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	//draw_text_outline(74,6,":",5);
	var point_text = string_replace_all(string_format(global.points,3,0)," ","0");
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(22,-2,point_text);
	draw_set_color(white);
	draw_set_alpha(1);
	draw_text(20,-4,point_text);
	
	//draw_text(4,36,"SECRET: " + string(global.secret) + " / 1");
	var frames, seconds, minutes = 0;
	
	frames = string_format(global.timer mod room_speed,2,0);
	seconds = string_format(global.timer div 60 mod 60,2,0);
	minutes = string_format(global.timer div 3600,2,0);
	var timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0")
	
	
	draw_sprite(spr_icon_watch,0,99,2);
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(118,-2,timer_text);
	draw_set_color(white);
	draw_set_alpha(1);
	draw_text(116,-4,timer_text);
	#endregion
	
	#region Escape level / restart menu
	//if(input_check(eVerb.Escape)){
	//	draw_clear_alpha(black,0.5);
	//	var w = view_w*upscale;
	//	var h = view_h*upscale;
	//	
	//	draw_set_font(f_hyper_mono);
	//	draw_set_halign(fa_center);
	//	draw_set_valign(fa_middle);
	//	draw_text_outline(w/2,h/2,"Exit Level",5);
	//}
	#endregion
}
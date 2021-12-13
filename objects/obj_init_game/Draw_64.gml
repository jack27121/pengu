/// @description
if(room != rm_lvl_select){
#region points n' timer
	draw_sprite(spr_icon_cookie,0,2,2);
	draw_set_font(f_whackyjoe);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var point_text = string_replace_all(string_format(global.points,3,0)," ","0");
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(22,-2,point_text);
	draw_set_alpha(1);
	
	if(global.points == 0){
		draw_set_color(white);
		var offsetY = random_range(-0.5,0.5);
		var offsetX = random_range(-0.5,0.5);
		
		draw_text(20+offsetX,-4+offsetY,point_text);
		
	}else{ 
		draw_set_color(white);
		
		draw_text(20,-4,point_text);
	}
	
	//DRAW COOKIE TIMER
	global.cookietimer = (global.points * 5);
	
	var cframes, cseconds, cminutes = 0;
	cframes = string_format(global.cookietimer mod room_speed,2,0);
	cseconds = string_format(global.cookietimer div 60 mod 60,2,0);
	cminutes = string_format(global.cookietimer div 3600,2,0);
	var ctimer_text = string_replace_all(cminutes + ":" + cseconds + ":" + cframes," ","0");
	
	draw_set_font(f_pixel);
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(14+1,20+1,"-(" + ctimer_text + ")");
	draw_set_color(white);
	draw_set_alpha(1);
	draw_text(14,20,"-(" + ctimer_text + ")");
	
	
	//draw_text(4,36,"SECRET: " + string(global.secret) + " / 1");
	var frames, seconds, minutes = 0;
	frames = string_format((global.timer-global.cookietimer) mod room_speed,2,0);
	seconds = string_format((global.timer-global.cookietimer) div 60 mod 60,2,0);
	minutes = string_format((global.timer-global.cookietimer) div 3600,2,0);
	var timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0");
	
	draw_set_font(f_whackyjoe);
	draw_sprite(spr_icon_watch,0,99,2);
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(118,-2,timer_text);
	draw_set_color(white);
	draw_set_alpha(1);
	draw_text(116,-4,timer_text);
	#endregion
	
	#region Escape level / restart menu
	if(escape_time != 0){
		draw_set_font(f_credits);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		draw_set_alpha(escape_time / 60);
		draw_text(view_w-5,5,"Exiting level");
		draw_set_alpha(1);
	}
	
	if(restart_time != 0){
		draw_set_font(f_credits);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		draw_set_alpha(restart_time / 60);
		draw_text(view_w-5,5,"Restarting level");
		draw_set_alpha(1);
	}
	#endregion
}
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
	//global.cookietimer = (global.points * 5);
	//
	//var cframes, cseconds, cminutes = 0;
	//cframes = string_format(global.cookietimer mod room_speed,2,0);
	//cseconds = string_format(global.cookietimer div 60 mod 60,2,0);
	//cminutes = string_format(global.cookietimer div 3600,2,0);
	//var ctimer_text = string_replace_all(cminutes + ":" + cseconds + ":" + cframes," ","0");
	
	var cmiliseconds, cseconds, cminutes = 0;
	cmiliseconds = string_copy(string_format(global.cookietimer mod 1000,2,0),1,2);
	cseconds = string_format(global.cookietimer div 1000 mod 60,2,0);
	cminutes = string_format(global.cookietimer div 60000,2,0);
	var ctimer_text = string_replace_all(cminutes + ":" + cseconds + ":" + cmiliseconds," ","0");
	
	draw_set_font(f_pixel);
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(14+1,20+1,"-(" + ctimer_text + ")");
	draw_set_color(white);
	draw_set_alpha(1);
	draw_text(14,20,"-(" + ctimer_text + ")");
	
	
	//var frames, seconds, minutes = 0;
	//frames = string_format((global.timer-global.cookietimer) mod room_speed,2,0);
	//seconds = string_format((global.timer-global.cookietimer) div 60 mod 60,2,0);
	//minutes = string_format((global.timer-global.cookietimer) div 3600,2,0);
	//var timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0");
	
	var miliseconds = string_copy(string_format((global.timer-global.cookietimer) mod 1000,2,0),1,2);
	var seconds = string_format((global.timer-global.cookietimer) div 1000 mod 60,2,0);
	var minutes = string_format((global.timer-global.cookietimer) div 60000,2,0);
	var timer_text = string_replace_all(minutes + ":" + seconds + ":" + miliseconds," ","0");
	
	draw_set_font(f_whackyjoe);
	draw_sprite(spr_icon_watch,0,99,2);
	draw_set_color(black);
	draw_set_alpha(0.5);
	draw_text(118,-2,timer_text);
	draw_set_color(white);
	draw_set_alpha(1);
	draw_text(116,-4,timer_text);
	#endregion
}
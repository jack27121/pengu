/// @description
if(room != rm_lvl_select and room != rm_ending){
#region points n' timer
	
	//LEVEL CREATOR TEXT	
	if instance_exists(obj_lvleditor)
	{
		if keyboard_check_pressed(vk_shift) {if showing = true {showing = false}else{showing = true}}
		
		draw_set_font(f_pixel);
		draw_set_color(c_white);
		if showing = true
		{
			draw_set_alpha(1);
			draw_text_outline(6,30 + 0  ,"LEFT CLICK to place an object.",1,c_black,8);
			draw_text_outline(6,30 + 7*1,"RIGHT CLICK to destroy an object, that you have selected.",1,c_black,8);
			draw_text_outline(6,30 + 7*2,"MIDDLE CLICK to teleport Pengu.",1,c_black,8);
			draw_text_outline(6,30 + 7*3,"E and Q to rotate. (!)",1,c_black,8);
			draw_text_outline(6,30 + 7*4,"SCROLL UP to Enlarge. (!)",1,c_black,8);
			draw_text_outline(6,30 + 7*5,"SCROLL UP to Shrink. (!)",1,c_black,8);
			draw_text_outline(6,30 + 7*6,"TAB to Mirror. (!)",1,c_black,8);
			
			draw_text_outline(6,30 + 7*7,"1 = Point.",1,c_black,8);
			draw_text_outline(6,30 + 7*8,"2 = Spikes.",1,c_black,8);
			draw_text_outline(6,30 + 7*9,"3 = Wall.",1,c_black,8);
			draw_text_outline(6,30 + 7*10,"4 = Ice Wall.",1,c_black,8);
			draw_text_outline(6,30 + 7*11,"5 = One Way.",1,c_black,8);
			draw_text_outline(6,30 + 7*12,"6 = Ice One Way.",1,c_black,8);
			draw_text_outline(6,30 + 7*13,"7 = Falling Platform.",1,c_black,8);
			draw_text_outline(6,30 + 7*14,"8 = Ice Falling Platform.",1,c_black,8);
			draw_text_outline(6,30 + 7*15,"9 = Spring.",1,c_black,8);
			draw_text_outline(6,30 + 7*16,"0 = Bouncy Ball.",1,c_black,8);
			draw_text_outline(6,30 + 7*17,"F1, F2, F3, F4 = Different slope variations.",1,c_black,8);
			draw_text_outline(6,30 + 7*18,"F5 = Seal.",1,c_black,8);
			
			draw_text_outline(6+sinwave(-2,2,3,0),30 + 7*19,"(!) means this might not work or act strangely with some objects.",1,c_black,8);
		}
		
		draw_text_outline(6+sinwave(-2,2,3,0),30 + 7*20,"LEFT SHIFT to hide/show info.",1,c_black,8);
	}

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

if instance_exists(obj_darkness)
{
	c_rainbow = make_color_hsv((get_timer()/10000) mod 255,255,255);
	draw_set_alpha(obj_darkness.image_alpha);
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_set_color(c_rainbow);
	draw_set_font(f_pixel);
	draw_text_outline(view_w/2,(view_h/3)+sinwave(-6,6,2,0),"Merry Christmas!",1,c_black,4);
	
	draw_text_outline(view_w/2,(view_h/2.5)+sinwave(-6,6,2,0),"Thank you so much for playing our game!",1,c_black,4);
	
	draw_set_color(c_white);
	draw_text_outline(view_w/2,view_h/1.5,"This year was pretty rough!\nA lot of bad things happened.\nBut so did a lot of good!\nWith everyone stuck indoors, creativity flourished.\nHere is to another year of making \nand playing cool shit with homies!\n \n XOXOXO, STANN.CO, Stepford, chocoholicmonkey & FractalCounty",1,c_black,4);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);	
	draw_set_alpha(1);
}
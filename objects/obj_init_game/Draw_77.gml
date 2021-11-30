/// @description
#region points n' timer
draw_set_font(f_hyper_mono);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_outline(10,10,"SNACKS:" + string_replace_all(string_format(global.points,3,0)," ","0"),5);

//draw_text(4,36,"SECRET: " + string(global.secret) + " / 1");
var frames, seconds, minutes = 0;

frames = string_format(global.timer mod room_speed,2,0);
seconds = string_format(global.timer div 60 mod 60,2,0);
minutes = string_format(global.timer div 3600,2,0);
var timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0")

draw_text_outline(10,60,"TIME:" + timer_text,5);
#endregion

#region Escape level / restart menu
if(input_check(eVerb.Escape)){
	draw_clear_alpha(black,0.5);
	var w = view_w*upscale;
	var h = view_h*upscale;
	
	draw_set_font(f_hyper_mono);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_outline(w/2,h/2,"Exit Level",5);
}

#endregion
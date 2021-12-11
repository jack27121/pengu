/// @description lvl select GUI
display_set_gui_size(view_w*upscale,view_h*upscale);
draw_sprite_stretched(spr_calendar,0,0,0,view_w*upscale,view_h*upscale);
display_set_gui_size(view_w,view_h);

for (var i = 0; i < array_length(levels); ++i) {
	draw_set_font(f_whackyjoe);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(white);
	
	if !(unlocked_levels > i) draw_set_alpha(0.5);
    draw_text(view_w/2+(i*offset)-(selected_viz*offset),view_h,string(i+1));
	
	if(global.selected == i){//display best time
		draw_set_font(f_pixel);
		draw_set_color(black);
		var timer_text;
		if(beattime[i] == -1) timer_text = "Unbeaten";
		else{
			var frames =  string_format(beattime[i] mod room_speed,2,0);
			var seconds = string_format(beattime[i] div 60 mod 60,2,0);
			var minutes = string_format(beattime[i] div 3600,2,0);
			timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0");
		}
		
		draw_sprite(spr_icon_watch_small,0,view_w/2+(i*offset)-(global.selected*offset)-28,view_h-22);
		draw_text(view_w/2+(i*offset)-(global.selected*offset),view_h-21,timer_text);
		draw_set_color(white);
	}
	draw_set_alpha(1);
}

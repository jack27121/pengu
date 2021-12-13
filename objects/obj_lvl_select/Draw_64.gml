/// @description lvl select GUI
display_set_gui_size(view_w*upscale,view_h*upscale);
draw_sprite(spr_calendar,0,0,0);

#region characters
for (var i = 0; i < array_length(pictures); ++i) {

	//either draws picture or number depending on if you've beaten the level
	
	if(beattime[i] != -1){
		//draws picture
		if(global.selected == i){	
			shader_set(sh_light);
			for (var rot = 0; rot < 360; rot+=22) {
				var offset_x = lengthdir_x(1,rot);
				var offset_y = lengthdir_y(1,rot);
				draw_sprite_ext(pictures[i],0,offset_x,offset_y,1,1,0,white,1);
			}
			shader_reset();
		}
		draw_sprite_ext(pictures[i],0,0,0,1,1,0,white,1);
	} else {
		//draws number
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(f_calendar);
		var txt_col = black;
		if(global.selected == i) txt_col = red;
		draw_text_outline(nr_cords[i][0],nr_cords[i][1],i+1,4,txt_col);
	}
}
#endregion

#region credits
draw_set_color(black);
draw_set_font(f_credits);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var credit_offset = 6;
draw_text(6,view_h*upscale-80-credit_offset*5,"Created by:");
draw_text(6,view_h*upscale-80-credit_offset*4,"STANN.co");
draw_text(6,view_h*upscale-80-credit_offset*3,"Stepford");
draw_text(6,view_h*upscale-80-credit_offset*2,"ChocoholicMonkey");
draw_text(6,view_h*upscale-80-credit_offset,"FractalCounty");
#endregion



#region Lvl select
display_set_gui_size(view_w,view_h);
draw_set_color(black);
draw_set_alpha(0.8);
draw_rectangle(0,view_h-20,view_w,view_h,0);
draw_set_alpha(1);

var offset = 30;

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
		
		if(unlocked_levels <= i){
			draw_text(view_w/2+(i*offset)-(global.selected*offset),view_h-21,"Unlocks sometime Dec "+string(i+13));
		} else {
			draw_sprite(spr_icon_watch_small,0,view_w/2+(i*offset)-(global.selected*offset)-28,view_h-22);
			draw_text(view_w/2+(i*offset)-(global.selected*offset),view_h-21,timer_text);
		}
	}
}
#endregion

draw_set_color(white);
draw_set_alpha(1);
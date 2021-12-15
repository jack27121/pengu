/// @description lvl select GUI
display_set_gui_size(view_w*upscale,view_h*upscale);
draw_sprite(spr_calendar,0,0,pandown);

draw_sprite_ext(spr_titlecard,0,view_w*upscale/2,-(view_h*upscale/2)+pandown,8,8,0,white,1);
var title_card_wave = sinwave(4,10,1,0);
draw_sprite_ext(spr_titlecard,1,view_w*upscale/2,-(view_h*upscale/2)+pandown-title_card_wave,8,8,0,white,1);

#region characters
for (var i = 0; i < array_length(pictures); ++i) {

	//either draws picture or number depending on if you've beaten the level
	
	if(beattime[i] != -1){
		//draws picture
		if(global.selected == i){	
			shader_set(sh_light);
			for (var rot = 0; rot < 360; rot+=22) {
				var offset_x = lengthdir_x(1,rot);
				var offset_y = lengthdir_y(1,rot) + pandown;
				draw_sprite_ext(pictures[i],0,offset_x,offset_y+sinwave(-4,4,1,0),1,1,0,white,1);
			}
			shader_reset();
		}
		draw_sprite_ext(pictures[i],0,0,pandown,1,1,0,white,1);
	} else {
		//draws number
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(f_whackyjoe_title);
		var txt_col = c_navy;
		var offs = 0;
		if(global.selected == i) {txt_col = red; offs = sinwave(-10,10,1,0)}
		draw_text_outline(nr_cords[i][0],nr_cords[i][1]+offs+pandown,i+1,4,txt_col);
		
		draw_sprite_ext(pictures[i],0,0,pandown,1,1,0,black,0.1);
	}
}
#endregion

#region credits
draw_set_color(black);
draw_set_font(f_credits);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var credit_offset = 6;

draw_text(6,view_h*upscale-80-credit_offset*11+pandown,"P to clear save data.");
draw_text(6,view_h*upscale-80-credit_offset*10+pandown,"L to raise volume.");
draw_text(6,view_h*upscale-80-credit_offset*9+pandown,"K to lower volume.");
draw_text(6,view_h*upscale-80-credit_offset*8+pandown,"M to play/pause the music.");

draw_text(6,view_h*upscale-80-credit_offset*6+pandown,"Thanks for playing, " + string(global.playername) + "!");
draw_text(6,view_h*upscale-80-credit_offset*5+pandown,"Created by:");
draw_text(6,view_h*upscale-80-credit_offset*4+pandown,"STANN.co");
draw_text(6,view_h*upscale-80-credit_offset*3+pandown,"Stepford");
draw_text(6,view_h*upscale-80-credit_offset*2+pandown,"Chocoholicmonkey");
draw_text(6,view_h*upscale-80-credit_offset+pandown,"FractalCounty");
#endregion


#region Lvl select
display_set_gui_size(view_w,view_h);

if(!global.started){
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(f_pixel);
	draw_set_color(white);
	draw_set_alpha(0.5);
	draw_text(view_w/2,view_h,"Mouse click within the game to start");
}


draw_set_color(black);
draw_set_alpha(0.8);
draw_rectangle(0,view_h-20+pandown,view_w,view_h+pandown,0);
draw_set_alpha(1);

var offset = 30;
for (var i = 0; i < array_length(levels); ++i) {
	draw_set_font(f_whackyjoe);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(white);
	
	if !(unlocked_levels > i) draw_set_alpha(0.5);
    draw_text(view_w/2+(i*offset)-(selected_viz*offset),view_h+pandown,string(i+1));
	
	if(global.selected == i){//display best time
		draw_set_font(f_pixel);
		draw_set_color(black);
		var timer_text;
		if(beattime[i] == -1) timer_text = "Unbeaten";
		else{
			//var frames =  string_format(beattime[i] mod room_speed,2,0);
			//var seconds = string_format(beattime[i] div 60 mod 60,2,0);
			//var minutes = string_format(beattime[i] div 3600,2,0);
			//timer_text = string_replace_all(minutes + ":" + seconds + ":" + frames," ","0");
				var miliseconds = string_copy(string_format((beattime[i]) mod 1000,2,0),1,2);
				var seconds = string_format((beattime[i]) div 1000 mod 60,2,0);
				var minutes = string_format((beattime[i]) div 60000,2,0);
				var timer_text = string_replace_all(minutes + ":" + seconds + ":" + miliseconds," ","0");
		}
		
		if(unlocked_levels <= i){
			draw_text(view_w/2+(i*offset)-(global.selected*offset),view_h-21+pandown,"Unlocks sometime Dec "+string(i+13));
		} else {
			//DRAWING THE STAR
			if(star[i] == 0) {
				//IF STAR = 0?
				draw_sprite_ext(spr_icon_star,0,view_w/2+(i*offset)-(global.selected*offset)-36,view_h-22+pandown,1,1,0,c_dkgray,1);
			} else {
				//IF STAR = 1?
				draw_sprite_ext(spr_icon_star,0,view_w/2+(i*offset)-(global.selected*offset)-36,view_h-22+pandown,1,1,sinwave(-6,6,2,0),c_white,1);	
			}
			draw_sprite(spr_icon_watch_small,0,view_w/2+(i*offset)-(global.selected*offset)-28,view_h-22+pandown);
			draw_text(view_w/2+(i*offset)-(global.selected*offset),view_h-21+pandown,timer_text);
		}
	}
}
#endregion

draw_set_color(white);
draw_set_alpha(1);
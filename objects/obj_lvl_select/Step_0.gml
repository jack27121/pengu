/// @description
if(!global.started && mouse_check_button_pressed(mb_left) && point_in_rectangle(display_mouse_get_x(),display_mouse_get_y(),0,0,view_w*upscale,view_h*upscale)){
	global.started = true;
}

if(global.started){ //makes view pan down when the game starts
	pandown = lerp(pandown,0,0.05);
	if(pandown < 1) controlled = true;
}

if(controlled) {
	if input_check_pressed(eVerb.Right) global.selected+= 1;
	if input_check_pressed(eVerb.Left)	global.selected-= 1;
	
	if(global.selected > array_length(levels)-1) global.selected = 0;
	else if (global.selected < 0) global.selected = array_length(levels)-1;
	
	if input_check_pressed(eVerb.Jump){
		if(unlocked_levels > global.selected){
			level = asset_get_index(levels[global.selected]);
			controlled = false;
			start_fade_out(function(){
				room_goto(level);
				//this runs before each level
				global.counting = true;
			})
		}
	}
	
	if keyboard_check_pressed(ord("H")) and ready = true {
		if(unlocked_levels > global.selected and beattime[global.selected] > 0){
			audio_play_sound(snd_pickup,10,false);
			new_score = beattime[global.selected];
			show_debug_message("trying to resub score: level:" + string(global.selected+1) + " score: " + string(new_score));
			if (global.selected == 0)     { ng_postScore("11149", new_score);}
			if (global.selected == 1)	  { ng_postScore("11150", new_score);}
			if (global.selected == 2)     { ng_postScore("11152", new_score);}
			if (global.selected == 3)     { ng_postScore("11153", new_score);}
			if (global.selected == 4)     { ng_postScore("11154", new_score);}
			if (global.selected == 5)     { ng_postScore("11155", new_score);}
			if (global.selected == 6)     { ng_postScore("11156", new_score);}
			if (global.selected == 7)     { ng_postScore("11157", new_score);}
			if (global.selected == 8)     { ng_postScore("11158", new_score);}
			if (global.selected == 9) 	  { ng_postScore("11159", new_score);}
			if (global.selected == 10)    { ng_postScore("11160", new_score);}
			if (global.selected == 11)    { ng_postScore("11161", new_score);}
		}
	}
	
	if keyboard_check_pressed(ord("P")){
		audio_play_sound(snd_jump,10,false);
	}
}

selected_viz = lerp(selected_viz,global.selected,0.1);
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
			level = levels[global.selected];
			controlled = false;
			start_fade_out(function(){
				room_goto(level);
				//this runs before each level
				global.counting = true;
			})
		}
	}
	
	if keyboard_check_pressed(ord("P")){
		audio_play_sound(snd_jump,10,false);
	}
}

selected_viz = lerp(selected_viz,global.selected,0.1);
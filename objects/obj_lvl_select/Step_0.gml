/// @description
if(controlled){
	if input_check_pressed(eVerb.Right) selected+= 1;
	if input_check_pressed(eVerb.Left)	selected-= 1;
	
	if(selected > array_length(levels)-1) selected = 0;
	else if (selected < 0) selected = array_length(levels)-1;
	
	if input_check_pressed(eVerb.Jump){
		if(unlocked_levels > selected){
			level = levels[selected];
			controlled = false;
			start_fade_out(function(){
				room_goto(level);
				//this runs before each level
				audio_stop_all();
				global.counting = true;
			})
		}
	}
}

selected_viz = lerp(selected_viz,selected,0.1);
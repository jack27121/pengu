/// @description
if(controlled){
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
}

selected_viz = lerp(selected_viz,global.selected,0.1);
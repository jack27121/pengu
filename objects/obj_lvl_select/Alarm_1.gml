/// @description CHECK SAVE DATA
for (var i = 0; i < array_length(pictures); ++i) {
	if beattime[i] != -1 {global.levelsbeaten += 1;}
}
for (var i = 0; i < array_length(pictures); ++i) {
	if star[i] != 0 {global.startotal += 1;}
}

show_debug_message("levels beaten:" + string(global.levelsbeaten));
show_debug_message("stars collected:" + string(global.startotal));

//SHOW THE CUTSCENE? UNLOCK THE ? STAGE?
if global.levelsbeaten = 12 {
	unlocked_levels = 13;
	if global.hasseenend = false
	{
		start_fade_out(function(){
			room_goto(rm_ending);
			global.counting = true;
		})
	}
}

//UNLOCK THE SANDBOX MODE?
if global.startotal = 12 {unlocked_levels = 14;}
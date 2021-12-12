/// @desc restart && timer
if(room != rm_lvl_select){
	////restart
	if (input_check(eVerb.Restart)){
		restart_time = lerp(restart_time,60,1);
		if(restart_time >= 60){
			restart_time = 0;
			start_fade_out(function(){
				room_restart();
			});
		}
	} else restart_time = 0;
	
	////Return to lvl select
	if (input_check(eVerb.Escape)){
		escape_time = lerp(escape_time,60,1);
		if(escape_time >= 60){
			start_fade_out(function(){
				escape_time = 0;
				global.camera_follow = undefined;
				room_goto(rm_lvl_select);
			});
		}
	} else escape_time = 0;
}

if (global.counting) global.timer++;


//if the song doesn't play, it will
if(!audio_is_playing(global.music)) global.music = audio_play_sound(music_christmas,100,true);
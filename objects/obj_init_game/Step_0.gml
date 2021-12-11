/// @desc restart && timer
if(room != rm_lvl_select){
	////restart
	if (input_check_pressed(eVerb.Restart)){
		start_fade_out(function(){
			//audio_stop_all();
			room_restart();
		});
	}
	
	////Return to lvl select
	if (input_check_pressed(eVerb.Escape)){
		start_fade_out(function(){
			//audio_stop_all();
			global.camera_follow = undefined;
			room_goto(rm_lvl_select);
		});
	}
}

if (global.counting) global.timer++;


//if the song doesn't play, it will
if(!audio_is_playing(global.music)) global.music = audio_play_sound(music_christmas,100,true);
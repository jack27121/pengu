/// @description
input_tick();
input_hotswap_tick(0);

/// @desc restart && timer
if(room != rm_lvl_select){
	////restart
	if (input_check(eVerb.Restart) && !instance_exists(obj_transition)){
		restart_time = lerp(restart_time,1,0.1);
		if(restart_time >= 0.9){
			restart_time = 0;
			start_fade_out(function(){
				room_restart();
			});
		}
	} else restart_time = 0;
	
	////Return to lvl select
	if (input_check(eVerb.Escape)){
		escape_time = lerp(escape_time,1,0.1);
		if(escape_time >= 0.9){
			start_fade_out(function(){
				escape_time = 0;
				global.camera_follow = undefined;
				room_goto(rm_lvl_select);
			});
		}
	} else escape_time = 0;
	
} else { //only happens in lvl select
	
	////Clear data
	if (keyboard_check(ord("P")) && !instance_exists(obj_transition)){
		dataclear_time = lerp(dataclear_time,1,0.05);
		if(dataclear_time >= 0.9){
			dataclear_time = 0;
			start_fade_out(function(){
				ini_open("savedata.ini");
				for (var i = 0; i < array_length(obj_lvl_select.levels); ++i) {
					ini_write_real(obj_lvl_select.levels[i],"beattime",-1);
				}
				ini_close();
				room_restart();
			});
		}
	} else dataclear_time = 0;
}

//VOLUME
if keyboard_check_pressed(ord("L")) {vol += 0.05; audio_play_sound(snd_jump,10,false);}
if keyboard_check_pressed(ord("K")) {vol -= 0.05; audio_play_sound(snd_jump,10,false);}
vol = clamp(vol,0,2);
audio_master_gain(vol);
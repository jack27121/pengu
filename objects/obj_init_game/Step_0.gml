//if (global.counting) global.timer++;
if (global.counting){
	global.timer += (delta_time/1000);
	global.cookietimer = (global.points * 100);
}

//MUTE KEY
if keyboard_check_pressed(ord("M")){
	if global.mute = false {global.mute = true;}
	else {global.mute = false;}
}

//if the song doesn't play, it will
if(!audio_is_playing(global.music) and global.mute = false) {global.music = audio_play_sound(music_christmas,100,true);} //IF NO MUTE
if (global.mute = true) {if audio_is_playing(global.music) {audio_stop_sound(global.music)}} //IF MUTE
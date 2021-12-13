//if (global.counting) global.timer++;
if (global.counting){
	global.timer += (delta_time/1000);
	global.cookietimer = (global.points * 100);
}

//if the song doesn't play, it will
if(!audio_is_playing(global.music)) global.music = audio_play_sound(music_christmas,100,true);
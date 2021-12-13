if (global.counting) global.timer++;

//NEW SCORE CALCULATION
global.new_score = ((global.timer-global.cookietimer) / 60 * 1000);


//if the song doesn't play, it will
if(!audio_is_playing(global.music)) global.music = audio_play_sound(music_christmas,100,true);
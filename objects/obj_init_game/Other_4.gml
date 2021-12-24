/// @description
if (!global.bonuslevel){
	global.timer = 0;
	audio_sound_pitch(global.music,1);
} else{ //if it's the bonus level it keeps ticking up
	global.timer = global.timer-global.cookietimer
	audio_sound_pitch(global.music,1.2);
}

global.points = 0;
global.cookietimer = 0;

if(room != rm_lvl_select) global.counting = true;
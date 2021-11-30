///@description resets all conductor beat variables
//function conductor_reset() {
//	global.process = 0;
//	global.step = 0;
//	global.steps = 0;
//
//	global.on_bar = false;
//	global.on_half_bar = false;
//	global.on_beat = false;
//	global.on_half_beat = false;
//	global.on_quad_beat = false;
//	global.on_eighth_beat = false;
//	
//	global.bpm_change = 0;
//	show_debug_message("reset")
//}

/// @function pitch_change(semitones)
/// @param	semitones
/// @description use with audio_sound_pitch to pitch up x amount of semitones
function pitch_change() {
	var semitones = argument[0]; // semitones
	return power(power(2, (1/12)),semitones);
}

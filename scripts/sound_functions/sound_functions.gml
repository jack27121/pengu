///@description resets all conductor beat variables
function conductor_reset() {
	global.process = 0;
	global.step = 0;
	global.steps = 0;

	global.on_bar = false;
	global.on_half_bar = false;
	global.on_beat = false;
	global.on_half_beat = false;
	global.on_quad_beat = false;
	global.on_eighth_beat = false;
	
	global.bpm_change = 0;
	for(var i = 0; i<FMODGMS_Sys_Get_MaxChannelIndex() ; i++ ){
		frequencies[i] = 0;
		
	}
	show_debug_message("reset")
}

///@function FMODGMS_Chan_CreateChannels(count)
///@param count		the amount of channels to make
function FMODGMS_Chan_CreateChannels(count){
	for(var i = 0; i < count; i++){
		channel[i] = FMODGMS_Chan_CreateChannel();
	}	
}

///@function FMODGMS_Chan_StopAllChannels()
///@description	stop all channels
function FMODGMS_Chan_StopAllChannels(){
	for (var i = 0; i < array_length(channel); ++i) {
	    FMODGMS_Chan_StopChannel(channel[i]);
	}
}

///@function FMODGMS_Chan_Fade_Volume(channel,volume,duration)
///@param channel	to use
///@param volume	to change to
///@param duration	in miliseconds
function FMODGMS_Chan_Fade_Volume(channel,volume,duration){
	var fade = (instance_create_depth(x,y,0,obj_FMODGMS_chan_fade_volume))
	fade.channel = channel;
	fade.volume_end = volume;
	fade.volume_start = FMODGMS_Chan_Get_Volume(channel);
	fade.duration = duration;
	return fade;
}

///@function FMODGMS_Chan_Fade_Frequency(bpm_change,duration)
///@param bpm_change	new bpm_change value
///@param duration		the duration it takes to change, in miliseconds
function FMODGMS_Chan_Fade_Frequency(bpm_change,duration){
	if (instance_exists(obj_FMODGMS_chan_fade_frequency)){
		fade = obj_FMODGMS_chan_fade_frequency;
	} else var fade = instance_create_depth(x,y,0,obj_FMODGMS_chan_fade_frequency);
	fade.bpm_change = bpm_change;
	fade.duration = duration;
	fade.t = 0;
}

///@function instrument_load(group,instrument,amount)
///@description	loads sounds into global instrument variable
///@param group	percussion string wind
///@param instrument name
///@param amount of sounds to load, minimum 1
function instrument_load(group,instrument,amount){
	//ex instrument_load ("percussion","606",5)
	//global.instrument_percussion_1
	
	for(var i = 1; i <= amount; i++){
		var sound = FMODGMS_Snd_LoadSound(working_directory + @"audio\instruments\"+group+"_"+instrument+"_"+string(i)+".wav");
		variable_global_set("instrument_"+group+"_"+string(i),sound);
	}
}
///@function instrument_get(group,sound)
///@description	gets global instrument value
///@param group	percussion string wind
///@param sound number. drums have 1-5. perc/wind 2 is a hold note
function instrument_get(group,sound){
	return variable_global_get("instrument_"+group+"_"+string(sound));
}

///@function hold_note_init
///@description	inits hold notes
function hold_note_init(){
	if(instrument != "percussion"){ //if it's a hold note, and not percussion the sound is changed
		if(length>1){
			sound = instrument_get(instrument,2);
			if(instrument == "wind"){ //wind instruments have loop points
				var sample_start = sample_rate;
				var sample_end = sample_rate*2;
				FMODGMS_Snd_Set_LoopPoints(sound, sample_start, sample_end);
				FMODGMS_Snd_Set_LoopMode(sound,1,-1);	
			} else FMODGMS_Snd_Set_LoopMode(sound,0,-1);	
		} else sound = instrument_get(instrument,1);
	}
}

/// @function pitch_change(semitones)
/// @param	semitones
/// @description use with audio_sound_pitch to pitch up x amount of semitones
function pitch_change() {
	var semitones = argument[0]; // semitones
	return power(power(2, (1/12)),semitones);
}

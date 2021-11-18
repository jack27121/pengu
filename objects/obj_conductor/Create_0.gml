/// @description initialie
//beat controls
global.process = 0;
global.step = 0;
global.steps = 0;

global.on_bar = false;
global.on_half_bar = false;
global.on_beat = false;
global.on_half_beat = false;
global.on_quad_beat = false;
global.on_eighth_beat = false;

//global.swing = 0;

global.bpm = 0;
//global.song = music_steppengang_118;
global.playing = false;
global.bpm_change = 0;

//FMODGMS audio engine
//if (FMODGMS_Util_Handshake() != "FMODGMS is working."){
//	show_message_async("Error! FMODGMS was not loaded prorperly.");
//}
//FMODGMS_Sys_Create();
//FMODGMS_Sys_Initialize(32);

#macro sample_rate 48000 //FMODGMS_Sys_Get_SampleRate();

for(var i = 0; i<100 ; i++ ){
	frequencies[i] = 0;
}

//channel[0] = FMODGMS_Chan_CreateChannel();
//sound = FMODGMS_Snd_LoadSound(working_directory + @"external_files\audio\enimal_judgement_132_intro.wav");
//FMODGMS_Snd_Set_LoopMode(sound,1,-1);
//FMODGMS_Snd_PlaySound(sound,0);

//FMODGMS_Chan_CreateChannels(5);
/// @description
input_tick();
input_hotswap_tick(0);

//VOLUME
if keyboard_check_pressed(vk_pageup) {vol += 0.05; audio_play_sound(snd_jump,10,false);}
if keyboard_check_pressed(vk_pagedown) {vol -= 0.05; audio_play_sound(snd_jump,10,false);}
vol = clamp(vol,0,2);
audio_master_gain(vol);

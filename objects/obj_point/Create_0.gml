shrink = 0;
spd = 0.01;
wavemod = 0;
fired = false;
waittime = 40;
ymod = 0;
grounded = false;

hspd = 0;
vspd = 0;
grav = 0;

var max_frames = sprite_get_number(sprite_index);
image_index = random_range(0,max_frames);

/// pitch  randomizer

//randomize();

//function random_pitch(sound,min_pitch,max_pitch,priority)
//{
//	sound = snd;
//	min_pitch = minp;
//	max_pitch = maxp;
//	priority = prior;
//}

//// Set the pitch
//var pitch = random_range(minp,maxp);

//// Play the sound
//audio_play_sound(snd,prior,0);

//// Change the pitch
//audio_sound_pitch(snd,pitch);
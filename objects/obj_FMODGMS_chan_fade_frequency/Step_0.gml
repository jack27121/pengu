/// @description
global.bpm_change = ease_linear(t++,start_bpm_change,bpm_change-start_bpm_change,duration);
if (t >= duration) instance_destroy();
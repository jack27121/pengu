/// @description
var volume = ease_linear(t++,volume_start,volume_end-volume_start,duration);
FMODGMS_Chan_Set_Volume(channel,clamp(volume,0,100));

if (t > duration) instance_destroy();

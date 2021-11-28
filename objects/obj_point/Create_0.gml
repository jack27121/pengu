shrink = 0;
spd = 0.01;
wavemod = 0;
fired = false;
lifetime = 120;
waittime = 40;
ymod = 0;
grounded = false;

hspd = 0;
vspd = 0;
grav = 0.3;

var max_frames = sprite_get_number(sprite_index);
image_index = random_range(0,max_frames);
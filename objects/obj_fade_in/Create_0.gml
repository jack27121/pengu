instance_destroy(obj_fade_out);
i = 0;
totalFrames = sprite_get_number(spr_fade);
frame = totalFrames;
fade_duration= 0.5 * room_speed;

x_move = random_range(-1,1);
y_move = random_range(-1,1);
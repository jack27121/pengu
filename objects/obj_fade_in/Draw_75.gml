/// @description fades in
if (frame != 0) frame = ease_linear(i++, totalFrames, -totalFrames, fade_duration)

draw_sprite_tiled(spr_fade, frame,x_move*i, y_move*i);

if (frame = 0) instance_destroy(self);
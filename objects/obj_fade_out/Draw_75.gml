/// @description fades out
if (frame != totalFrames) frame = ease_linear(i++, 0, totalFrames, fade_duration)

draw_set_alpha(1);
draw_sprite_tiled(spr_fade, frame,x_move*i, y_move*i);

if (frame == totalFrames && quit == true)
{
	if (quitDelay++ >= 0.2 * room_speed)
	{
		window_set_fullscreen(false);
		game_end();
	}
}
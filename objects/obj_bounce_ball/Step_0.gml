/// @description

if(place_meeting(x,y,obj_player)){
	scaleX = 2;
	scaleY = 2;
	
	var sound = audio_play_sound(snd_bounce_ball,1,false);
	audio_sound_pitch(sound,pitch_change(random_range(-2,2)));
	show_debug_message("bounce!");
	
	with(obj_player){
		var dir = point_direction(other.x,other.y,x,y);
		hspd = lengthdir_x(12*other.image_xscale,dir);
		vspd = lengthdir_y(12*other.image_yscale,dir);
		angle = dir-90;
		state.change("launch");
	}
}

////Makes the body always conform to it's original size
scaleY = lerp(scaleY,1,0.15);
scaleX = lerp(scaleX,1,0.15);
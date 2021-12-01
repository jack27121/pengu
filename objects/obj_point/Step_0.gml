
	if(!obj_player.hurting){
		if (distance_to_object(obj_player) < 10 && !shrink){
			shrink = true;
			depth = obj_player.depth+1;
			global.points += 1;
	
			var sound = audio_play_sound(snd_pickup, 15, false);
			audio_sound_pitch(sound,pitch_change(random_range(-5,5)))
			crumbs();
		}
	}
	
	if(shrink){
		move_towards_point(obj_player.x,obj_player.y-16,spd);
		image_xscale -= 0.05;
		image_yscale -= 0.05;
		spd += 0.4;
		
		if (image_xscale < 0.4){
			instance_destroy();
		}
	}


if(fired == 1){	
	lifetime--;
	
	if(lifetime <= 0){
		crumbs();
		instance_destroy();
	}
	
	if (abs(hspd) > 0 || abs(vspd) > 0){
		hspd = lerp(hspd,0,0.01); //SLOWLY DECREASE SPEED
		//vspd = lerp(vspd,0,0.01);
		//if (bounce >= 7) {speed = lerp(speed,0,0.1); gravity = 0;} //IF BOUNCED 3 TIMES, STOP GRAVITY AND BRING SPEED TO 0 FASTER
		
		//Horizontal bounced
		if(place_meeting(x + hspd, y, obj_wall)) hspd = -hspd;
		
		//Vertical bounce
		if(place_meeting(x, y + vspd, obj_wall)) vspd = -vspd;
		
		vspd += grav;
		
		collision(0,1);
	}
}
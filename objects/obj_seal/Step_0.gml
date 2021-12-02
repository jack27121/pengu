/// @description advanced goomba ai state machine
	/// @desc every step
	if(!state.state_is("dying")){
		subimg += sprite_get_speed(sprite_index);
		
		vspd+= mass * global.gravity; //applies gravity	
		
		image_angle = angle;
		//image_angle -= angle_difference(image_angle,0) * 0.1;
		
		var frict = 0.25;
		hspd = clamp(hspd,-maxSpd,maxSpd);
		vspd = clamp(vspd,-maxVSpd,maxVSpd);
		
		if(!obj_player.hurting) { //Hurting or being hurt by player
			//jump on enemy
			if (place_meeting(x,y-16,obj_player) && obj_player.vspd > 0){
				state.change("dying");
				with(obj_player){
					grounded = false;
					sliding = false;
					state.change("jumping");
					vspd = jumpF;	
				}
			} else{
				mask_index = spr_seal;
				if place_meeting(x,y,obj_player) hurtplayer();
				mask_index = spr_seal_mask;
			}
		}
		
		collision(1, frict);
	}
	state.step();
	
	////Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
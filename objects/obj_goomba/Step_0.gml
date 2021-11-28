/// @description advanced goomba ai state machine
if !out_cam_bounds(){
	
	subimg += sprite_get_speed(sprite_index);
	
	vspd+= mass * global.gravity; //applies gravity	
	
	image_angle = angle;
	
	hspd = clamp(hspd,-maxSpd,maxSpd);
	collision(1,0.25,0);
	state.step();
	
	if (!dead){
		//OUCH!!!
		mask_index = spr_goomba_hurt_mask;
		var hurt_col = place_meeting(x,y,obj_player);
		mask_index = spr_goomba_mask;
		if (hurt_col && !obj_player.hurting) {
			hurtplayer();
			image_xscale = -image_xscale;
		}		
		// PLAYER DETECTION
		else if (place_meeting(x,y-2,obj_player) && !obj_player.hurting){
			//PLAYER IS ATOP??	
			with(obj_player){vspd = -6;} // LAUNCH THE PLAYER UP
			state.change("dead");
		}
	}
	
	
	//if (!place_meeting(x,y+1,obj_wall)) {
	//	//BRING TO THE GROUND
	//	y += grav;	
	//}
	//
	//if (!dead){
	//	if (place_meeting(x+(4*dir),y,obj_player)) {
	//		//OUCH!!!
	//		hurtplayer();
	//		dir = (dir*-1) //reverse direction;
	//	}
	//	// PLAYER DETECTION
	//	else if (place_meeting(x,y-2,obj_player)){
	//		//PLAYER IS ATOP??
	//		dead = true;
	//		sprite_index = spr_goomba_crush;
	//		spd = 0;
	//		with(obj_player){vspd = -6;} // LAUNCH THE PLAYER UP
	//	}
	//	// WALL DETECTION
	//	if (instance_place(x+detection_range,y,obj_wall) and dir = 1){
	//		dir = -1;
	//	} else if (instance_place(x-detection_range,y,obj_wall) and dir = -1){
	//		dir = 1;
	//	} else {
	//		//MOVE LITTLE GOOMBA!!
	//		x += (spd*dir);
	//		xscale = lerp(xscale,image_xscale,0.2);
	//		image_xscale = dir;
	//	}
	//}
}
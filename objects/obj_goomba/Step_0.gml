/// @description advanced goomba ai state machine

if (!place_meeting(x,y+1,obj_wall)) {
	//BRING TO THE GROUND
	y += grav;	
}

if dead = false
{
	// PLAYER DETECTION
	if (place_meeting(x,y-2,obj_player)){
		//PLAYER IS ATOP??
		dead = true;
		sprite_index = spr_goomba_crush;
		spd = 0;
		with(obj_player){vspd = -6;} // LAUNCH THE PLAYER UP
	} else if (place_meeting(x+(2*dir),y,obj_player)) {
		//OUCH!!!
		hurtplayer();
		dir = (dir*-1) //reverse direction;
	}
	
	// WALL DETECTION
	if (instance_place(x+detection_range,y,obj_wall) and dir = 1){
		dir = -1;
	} else if (instance_place(x-detection_range,y,obj_wall) and dir = -1){
		dir = 1;
	} else {
		//MOVE LITTLE GOOMBA!!
		x += (spd*dir);
		xscale = lerp(xscale,image_xscale,0.2);
		image_xscale = dir;
	}
}
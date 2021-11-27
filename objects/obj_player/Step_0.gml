/// @desc every step
if(controlled){
	subimg += sprite_get_speed(sprite_index);
	
	if(grounded){
		//jumping
		if (input_check_pressed(eVerb.Up)){
			//if sliding you jump at an angle
			if(!sliding) vspd+= jumpF;
			else {
				vspd+= jumpF * acos;
				hspd+= jumpF * asin;
			}
			
			grounded = false;
			sliding = false;
			state.change("jumping");
			
		} else if (input_check(eVerb.Down) && !sliding){
			sliding = true;
			state.change("sliding_begin");
		}
	}
	
	#region movement
	vspd+= mass * global.gravity; //applies gravity	
	
	var maxFlySpd = clamp(max(abs(hspd),maxWalkSpd), -maxSpd,maxSpd);
	if(hcontrol){
		hinput = input_check(eVerb.Right) -input_check(eVerb.Left);
		if(grounded) hspd += hinput * spd;
		else hspd += hinput * spd * 0.8; //not as good control in air
	}
	
	image_angle = 0;
	
	//different max speeds
	var frict = 0.25;
	//walking
	if (grounded && !sliding){
		hspd = clamp(hspd,-maxWalkSpd,maxWalkSpd);
	}
	//sliding
	else if (grounded && sliding){
		image_angle = angle;
		///angle speed
		hspd = clamp(hspd,-maxSlideSpd,  maxSlideSpd);
		frict = 0.05;
	}
	//flying
	else{
		hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
	}
	vspd = clamp(vspd,-maxSpd,maxSpd);
	
	//retarded code but returning the ground object, to see if it's a slidey one
	var wall = collision(hinput, frict);
	if(is_child(wall,obj_wall_icey) && abs(asin)>0.6){
		hcontrol = false;
		if(!sliding){
			state.change("sliding_begin");
			sliding = true;
		}
	} else hcontrol = true;
	
	state.step();
	////Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
	#endregion
	
	#region damage
	if(!hurting) { //DETECT BEING HIT BY spikies
		var spike = instance_place(x+hspd,y+vspd,obj_spikes);
		if(spike != noone){
			var launch_spd = 10;
			var launch_x = lengthdir_x(launch_spd,spike.image_angle+90);
			var launch_y = lengthdir_y(launch_spd,spike.image_angle+90);
			
			hspd += launch_x; // Launch the player away;
			vspd += launch_y; 
			
			hurting = true;
			state.change("hurt");
		}
	}
#endregion
}
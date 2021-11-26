/// @desc every step
if(controlled){
	subimg += sprite_get_speed(sprite_index);
	
	if(grounded){
		//jumping
		if (input_check_pressed(eVerb.Up)){
			grounded = false;
			state.change("jumping");
			
			//if sliding you jump at an angle
			if(!sliding) vspd+= jumpF;
			else {
				vspd+= jumpF * acos;
				hspd+= jumpF * asin;
			}
		} else if (input_check(eVerb.Down) && !sliding){
			sliding = true;
			state.change("sliding_begin");
		}
	}
	
	#region movement
	vspd+= mass * global.gravity; //applies gravity	
	
	var maxFlySpd = max(abs(hinput),maxWalkSpd);
	hinput = input_check(eVerb.Right) -input_check(eVerb.Left);
	hspd += hinput * spd;
	
	image_angle = 0;
	
	//different max speeds
	var frict = 0.75;
	//walking
	if (grounded && !sliding){
		hspd = clamp(hspd,-maxWalkSpd,maxWalkSpd);
	}
	//sliding
	else if (grounded && sliding){
		///angle speed
		image_angle = angle;
		hspd = clamp(hspd,-maxSlideSpd,maxSlideSpd);
		frict = 0.95;
	}
	//flying
	else{
		hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
	}
	vspd = clamp(vspd,-maxSpd,maxSpd);
	
	if(hinput != 0) frict = 1;
	collision(frict)
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
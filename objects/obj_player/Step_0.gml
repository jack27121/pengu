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
	
	var maxFlySpd = max(abs(hspd),maxWalkSpd);
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
		hspd-=(asin*vspd);
		image_angle = angle;
		hspd = clamp(hspd,-maxSlideSpd,maxSlideSpd);
		frict = 0.95;
	}
	//flying
	else{
		hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
	}
	vspd = clamp(vspd,-maxSpd,maxSpd);
	
	collision(frict)
	state.step();
	////Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
	#endregion
}
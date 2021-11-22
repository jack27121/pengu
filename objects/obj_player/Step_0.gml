/// @desc every step
if(controlled){
	subimg += sprite_get_speed(sprite_index);
	
	state.step();
	////Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
	
	if(grounded){
		//jumping
		if (input_check_pressed(eVerb.Up)){
			grounded = false;
			state.change("jumping");
			vspd+= jumpF;
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
	
	//different max speeds
	var frict = 0.75;
	//walking
	if (grounded && !sliding){
		hspd = clamp(hspd,-maxWalkSpd,maxWalkSpd);
	}
	//sliding
	else if (grounded && sliding){
		hspd = clamp(hspd,-maxSlideSpd,maxSlideSpd);
		frict = 0.95;
	}
	//flying
	else{
		hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
	}
	vspd = clamp(vspd,-maxSpd,maxSpd);
	
	collision(frict)
	
	///slope factor
	if grounded && collision_left_line(16) && collision_right_line(16){
	    angle=find_angle(angle,16,24);
	}else{
	    angle=0;
	}
	image_angle = angle;
	 
	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
	
	#endregion
}
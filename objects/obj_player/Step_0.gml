/// @desc every step
if(controlled){
	subimg += sprite_get_speed(sprite_index);

	state.step();
	//Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
	
	#region jumping
	if (input_check_pressed(eVerb.Up) && grounded){
		state.change("jumping");
		vspd=-jumpF;
	} else
	#endregion
	
	vspd+=grv
	
	#region movement
	//hspdDelta = 0;
	hinput = input_check(eVerb.Right) -input_check(eVerb.Left);
	hspd+=hinput*spd;
	vspd=clamp(vspd,-vspdMax,vspdMax);
	
	if(state.get_current_state() != "sliding"){ //the limit is higher when sliding
		if(hinput!=0){
			collision(0.90);
		} else collision(0.8);
		hspd=clamp(hspd,-hspdMax,hspdMax);
	} else{
		hspd=clamp(hspd,-hspdSlidingMax,hspdSlidingMax);
		collision(0.96);
	}
	#endregion
}
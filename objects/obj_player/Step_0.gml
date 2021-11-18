/// @desc every step
if(controlled){
	subimg += sprite_get_speed(sprite_index);

	state.step();
	//Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
	
	#region movement
	//hspdDelta = 0;
	hinput = input_check(eVerb.Right) -input_check(eVerb.Left);

	if(hinput>0){
		if(hspd>=0) hspd+=acc
		else hspd+=dcc;
	}
	
	if(hinput<0){
		if(hspd<=0) hspd-=acc
		else hspd-=dcc;
	}
	
	if(hinput == 0){
		if hspd>0 hspd-=frc;	
		if hspd<0 hspd+=frc;
		if(frc>=abs(hspd)) hspd = 0;
	}
	
	show_debug_message(hspd);
	#endregion
	
	
	#region jumping
	if (input_check_pressed(eVerb.Up) && grounded){
		//state.change("jumping");
		vspd=-6;
	} else
	#endregion
	
	
	collision(); //Collissions
	
}
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
		vspd=-6;
	} else
	#endregion
	
	vspd+=grv
	
	#region movement
	//hspdDelta = 0;
	hinput = input_check(eVerb.Right) -input_check(eVerb.Left);
	
	vspd=clamp(vspd,-vspdMax,vspdMax);
	hspd=clamp(hspd,-hspdMax,hspdMax);

	if(hinput!=0){
		hspd+=hinput*spd;
		collision(0.95); //Collissions
	} else collision(0.8);
	
	show_debug_message(hspd);
	#endregion
	
}
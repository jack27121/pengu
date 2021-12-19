/// @description
if(y_ != y_dest){
	y_ = ease_in_out(t,y_start,y_dest-y_start,duration);
}

if(y_ != y_dest ) t++
else{ //reverses after reaching destination
	t = 0;
	y_dest = y_start;
	y_start = y_;
}
y = round(y_);

if(obj_player.y > y+16){
	hurtplayer();
}

//if(obj_camera.y < y) layer_clear_fx("water_fx");
//else layer_set_fx("water_fx",water_fx);


//if(obj_camera.y < y) fx_pos = lerp(fx_pos,0,0.2);
//else fx_pos = lerp(fx_pos,1,0.2);
//
//if(fx_pos != 0 && fx_pos != 1){
//	var fx_names = fx_get_parameter_names(water_fx);
//	for (var i = 0; i < array_length(fx_names); i ++) {
//		var value_full = variable_struct_get(water_params_full,fx_names[i]);
//		if !is_real(value_full) continue;
//		
//		value = lerp(0,value_full,fx_pos);
//		fx_set_parameter(water_fx,fx_names[i],value);
//	}
//}
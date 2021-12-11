/// @description script is executed when player enters it
collission = place_meeting(x,y,obj_player);

if (instance_parent == -1){
	var col = false;
	for (var i = 0; i < array_length(instance_arr); ++i) {
	    if (instance_arr[i].collission) col = true;
	} //if any of the instances are colliding it'll fade
	if (col){
		alpha = lerp(alpha,0,0.1);	
	} else alpha = lerp(alpha,1,0.1);
}
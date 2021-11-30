/// @description script is executed when player enters it
if (place_meeting(x,y,obj_player)){
	alpha = lerp(alpha,0,0.1);	
} else alpha = lerp(alpha,1,0.1);
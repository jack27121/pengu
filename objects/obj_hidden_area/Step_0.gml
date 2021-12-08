/// @description script is executed when player enters it
if (place_meeting(x,y,obj_player)){
	alpha = lerp(alpha,0,0.4);	
} else alpha = lerp(alpha,1,0.1);
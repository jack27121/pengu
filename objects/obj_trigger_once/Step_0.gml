/// @description script is executed when player enters it
if (place_meeting(x,y,obj_player) && triggered == false){
	if script != -1 script();
	triggered = true;
}
/// @description script is executed when player enters it
if (place_meeting(x,y,obj_player)){
	if (triggered == false){
		if script != -1 script();
		triggered = true;
	}
} else triggered = false;
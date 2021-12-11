function hurtplayer(){
	with(obj_player){
		if(!hurting && controlled){
			var launch_spd = 6;
			var launch_x = lengthdir_x(launch_spd,90);
			var launch_y = lengthdir_y(launch_spd,90);
			
			hspd += launch_x; // Launch the player away;
			vspd += launch_y; 
			
			hurting = true;
			state.change("hurt");
		}
	}
}
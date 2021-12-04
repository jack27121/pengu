/// @description
char_x = obj_win.x;
player_x = char_x - 128; //the distance the player goes from the character

cam_pos_x = player_x+64;
cam_pos_y = obj_win.y-32;

state = new SnowState("idle");

wait_t = 0;

state.add("idle", {
	step: function(){
		//runs just as you enter win zone
		if (place_meeting(x,y,obj_player)){
			obj_player.state.change("idle");
			obj_player.controlled = false;
			global.camera_follow = undefined;
			camera_move(cam_pos_x,cam_pos_y,room_speed);
			state.change("prep");
		}	
	}
});

state.add("prep", {
	step: function(){
		// moves player into position
		if(abs(player_x - obj_player.x) > 0.2){
			obj_player.hspd = (player_x - obj_player.x)/4;
		} else if(!obj_camera.moving){
			if(wait_t < 30) wait_t++; //a little delay before you win
			else{
				obj_player.image_xscale = 1;
				obj_player.hspd = 0;
				obj_win.state.change("turn");
				show_debug_message("start turning")
				state.change("win");
			}
		}
	}
});

state.add("win", {
	step: function(){
		
	}
});
/// @description
char_x = obj_win.x;
player_x = char_x - 128; //the distance the player goes from the character
banner = false;

cam_pos_x = player_x+64;
cam_pos_y = obj_win.y-32;

wait_t = 0;
banner_t = 0;

state = new SnowState("idle");

state.event_set_default_function("draw_gui", function() {

});

state.add("idle", {
	step: function(){
		//runs just as you enter win zone
		if (place_meeting(x,y,obj_player)){
			global.counting = false;
			obj_player.state.change("idle");
			obj_player.controlled = false;
			global.camera_follow = undefined;
			camera_move(cam_pos_x,cam_pos_y,room_speed);
			state.change("prep");
			
			ini_open("savedata.ini");
			var best_time = max(ini_read_real(room,"beattime",-1),global.timer);
			ini_write_real(room, "beattime", best_time);
			ini_close();
			
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
				state.change("win");
			}
		}
	}
});

state.add("win", {
	enter: function(){
		wait_t = 0;	
	},
	step: function(){
		banner_t = lerp(banner_t,1,0.1);
		if(wait_t < 120) wait_t++; //a little delay before you win
		else start_fade_out(function(){
			room_goto(rm_lvl_select);
		})
	
	},
	draw_gui: function(){
		draw_set_color(red);
		draw_rectangle(0,60-(20*banner_t),view_w,60+(20*banner_t),false);
		draw_set_font(f_whackyjoe_title);
		draw_set_halign(fa_middle);
		draw_set_color(white);
		draw_text((view_w/2)-(200*(1-banner_t)),45,obj_win.win_string);
	}
});
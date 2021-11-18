/// @func WaveEnemy
/// @description wave_enemy class
/// @param	enemy
/// @param	dir
/// @param	flying false
function WaveEnemy(__enemy, __dir, __flying = false) constructor{
	enemy = __enemy
	dir   = __dir
	flying = __flying
}

/// @func enemy_waves
/// @description starts enemy waves, when all are done end_function runs
/// @param	waves
/// @param	end_function
function enemy_waves(waves, end_method){
	//waves are arrays like this
	
	//var waves = [[
	//	new wave_enemy(obj_enemy_test,dirLeft),
	//	new wave_enemy(obj_enemy_test,dirRight)
	//],[
	//	new wave_enemy(obj_enemy_test,dirUp),
	//	new wave_enemy(obj_enemy_test,dirLeft),
	//	new wave_enemy(obj_enemy_test,dirRight)
	//]]

	var obj = instance_create_layer(x,y,"Instances",obj_waves);
	obj.end_method = end_method;
	obj.waves = waves;
	obj.state.change("active");
}

function enemy_spawn_pos(enemy,dir,flying){
	var cam_x_1 = cam_x();
	var cam_x_2 = cam_x_1 + view_w;
	
	var cam_y_1 = cam_y();
	var cam_y_2 = cam_y_1 + view_h;
	
	var enemy_width = sprite_get_width(object_get_sprite(enemy));
	var enemy_height = sprite_get_height(object_get_sprite(enemy));
	
	var x_,y_;
	
	switch (dir) { //use direction to randomly set spawn location outside the camera view
	    case dirUp:
	        x_ = random_range(cam_x_1+enemy_width,cam_x_2-enemy_width);
			y_ = cam_y_1() - enemy_height;
	        break;
		case dirDown:
	        x_ = random_range(cam_x_1+enemy_width,cam_x_2-enemy_width);
			y_ = cam_y_2() + enemy_height;
	        break;
	    case dirLeft:
	        x_ = cam_x_1 - enemy_width
			y_ = random_range(cam_y_1+enemy_height,cam_y_2-enemy_height);
	        break;
		case dirRight:
	        x_ = cam_x_2 + enemy_width
			y_ = random_range(cam_y_1+enemy_height,cam_y_2-enemy_height);
	        break;
		default:
			x_ = cam_x() + view_w/2
			y_ = cam_y() + view_h/2
			break;
	}
	
	var spawned = instance_create_layer(x_,y_,"Instances",enemy);
	spawned.spawn_dir = dir+180; //this is the direction they'll be pushed
	
	//if set to not be flying object is moved up or down so it's grounded
	if(!flying && (dir == dirLeft || dir == dirRight)){
		with(spawned){
			var delta_y = y;
			//tries to move down
			while(!place_meeting(x,y+1,obj_wall)){
				y++;
				
				//if it goes to far it resets and tries to move up
				if(y>cam_y()+view_h){
					y = delta_y;	
					break;
				}
			}
			
			if(y == delta_y){
				while(!place_meeting(x,y-1,obj_wall)){
					y--;
					//if it goes too far again, it just gives up
					if(y<cam_y()){
						y = delta_y;	
						break;
					}
				}
			}
		}
	}
}
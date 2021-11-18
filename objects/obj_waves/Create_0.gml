/// @description cycles through waves when all enemies are gone, ends with executing a method
wave_current = 0; //current wave
waves = [];

state = new SnowState("idle");

end_method = function(){
	show_debug_message("End")	
}

state.add("idle", {});

state.add("active", {
	enter: function(){
		var wave = waves[wave_current];
		for (var i = 0; i < array_length(wave); ++i) {
			var enemy = wave[i].enemy;
			var dir = wave[i].dir;
			var flying = wave[i].flying;

			enemy_spawn_pos(enemy,dir,flying);
		}
	},
	step: function(){
		//if no more enemies it goes to next wave
		if(instance_number(obj_enemy_parent) == 0){
			wave_current++;
			if(wave_current < array_length(waves)) state.change("active");
			else state.change("end");
		} else with(obj_enemy_parent){ //moves enemies out of their hiding place
			if(spawn_dir != -1 && out_cam_bounds(x,y)){
				x+= lengthdir_x(1,spawn_dir);
				y+= lengthdir_y(1,spawn_dir);
			} else spawn_dir = -1;
		}
	}
});

state.add("end", {
	enter: function(){
		end_method();
		instance_destroy();
	}
});

//Time dilated step
global.clock.add_cycle_method(function(){
	state.step();
});
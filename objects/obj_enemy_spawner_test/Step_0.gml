/// @description spawns enemies
if(instance_number(enemy) < spawn_count){
	instance_create_depth(random_range(x-200,x+200),y,depth,enemy);
}
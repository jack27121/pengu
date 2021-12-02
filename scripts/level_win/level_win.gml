/// @description player finishes the level
function level_win(){
	if !instance_exists(obj_pengu_dance)
	{
		camera_move(obj_finish.x,obj_finish.y,3);
		//global.counting = false;
		obj_player.visible = 0;
		obj_player.spd = 0;
		obj_player.controlled = false;
		instance_create_depth(obj_player.x,obj_player.y,obj_player.depth,obj_pengu_dance);
	}
}
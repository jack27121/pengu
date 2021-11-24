/// @description player finishes the level

if !instance_exists(obj_pengu_dance)
{
	global.counting = false;
	obj_player.visible = 0;
	obj_player.spd = 0;
	obj_player.controlled = 0;
	instance_create_depth(obj_player.x,obj_player.y,obj_player.depth,obj_pengu_dance);
}
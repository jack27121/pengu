if distance_to_object(obj_player) < 10 and goto = false
{
	goto = true;
	depth = obj_player.depth+1;
	obj_controller.secret += 1;
	
	repeat(5) {
		sap = instance_create_depth(x,y+sinwave(-5,5,1,wavemod),obj_player.depth-1,obj_shrinkawaypart);
		sap.direction = random_range(90-30,90+30);
		sap.speed = random_range(2,3);
		sap.gravity = 0.25;
		sap.sprite_index = spr_init;
	}
}

if goto = true
{
	if distance_to_point(obj_player.x-32,obj_player.y-32) > 20
	{
		move_towards_point(obj_player.x-32,obj_player.y-32,spd);
		deterspd = distance_to_object(obj_player)/10;
		spd = approach(spd,deterspd,0.1);
	}
	else
	{
		speed = approach(speed,0,0.2);	
		spd = approach(spd,0,0.2);
	}
}
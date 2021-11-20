if (distance_to_object(obj_player) < 10 && !shrink){
	shrink = true;
	depth = obj_player.depth+1;
	global.points += 1;
	
	repeat(5) {
		sap = instance_create_depth(x,y+sinwave(-5,5,1,wavemod),obj_player.depth-1,obj_shrinkawaypart);
		sap.image_index = image_index;
		sap.direction = random_range(90-30,90+30);
		sap.speed = random_range(2,3);
		sap.gravity = 0.25;
	}
}

if(shrink){
	move_towards_point(obj_player.x,obj_player.y-16,spd);
	image_xscale -= 0.05;
	image_yscale -= 0.05;
	spd += 0.4;
	
	if (image_xscale < 0.4){
		instance_destroy();
	}
}
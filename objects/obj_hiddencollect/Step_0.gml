if (!goto && (distance_to_object(obj_player) < 10)){
	goto = true;
	depth = obj_player.depth+1;
	
	audio_play_sound(snd_star,10,false);
	
	repeat(10) {
		sap = instance_create_depth(x,y,obj_player.depth-1,obj_shrinkawaypart);
		sap.direction = random_range(90-30,90+30);
		sap.speed = random_range(2,3);
		sap.gravity = 0.1;
		sap.image_xscale = 0.8;
		sap.image_yscale = 0.8;
		sap.sprite_index = spr_starpart;
		sap.shrinkspd = 0.06;
	}
}

if (goto){
	if(t == 2){ //spawns a particle every 2 frames
		t = 0;
		sap = instance_create_depth(x,y,obj_player.depth+5,obj_shrinkawaypart);
		sap.direction = random_range(90-30,90+30);
		sap.speed = random_range(1,2);
		sap.gravity = 0.1;
		sap.sprite_index = spr_starpart;
		sap.shrinkspd = 0.02;
	}
	t++
	
	if (distance_to_point(obj_player.x-32,obj_player.y-32) > 20){
		move_towards_point(obj_player.x-32,obj_player.y-32,spd);
		deterspd = distance_to_object(obj_player)/10;
		spd = lerp(spd,deterspd,0.1);
	} else {
		speed = lerp(speed,0,0.2);	
		spd = lerp(spd,0,0.2);
	}
	global.hooked = 1;
}
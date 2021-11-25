if((!fired) || (fired && !waittime)){
	if (distance_to_object(obj_player) < 10 && !shrink){
		shrink = true;
		depth = obj_player.depth+1;
		global.points += 1;
	
		repeat(5) {
			var sap = instance_create_depth(x,y+sinwave(-5,5,1,wavemod),obj_player.depth-1,obj_shrinkawaypart);
			sap.image_index = image_index;
			sap.direction = random_range(90-30,90+30);
			sap.speed = random_range(2,3);
			sap.gravity = 0.25;
		}
	}
}

if(fired == 1){
	if waittime > 0 {waittime -= 1;}
	
	if (abs(hspd) > 0 || abs(vspd) > 0){
		hspd = lerp(hspd,0,0.025); //SLOWLY DECREASE SPEED
		vspd = lerp(vspd,0,0.025);
		//if (bounce >= 7) {speed = approach(speed,0,0.1); gravity = 0;} //IF BOUNCED 3 TIMES, STOP GRAVITY AND BRING SPEED TO 0 FASTER
		
		//Horizontal bounced
		if(place_meeting(x + hspd, y, obj_wall)) hspd = -hspd;
		
		//Vertical bounce
		if(place_meeting(x, y + vspd, obj_wall)) vspd = -vspd;
		
		vspd += grav;
		
		collision(0,1);
		//if(speed < 0.2){
		//	speed = 0;
		//	gravity = 0;
		//}
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
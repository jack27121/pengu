function point_scatter(){
	var counter = 0;
	var angle = 184;
	var flip = false;
	var spd = 6;
	repeat(clamp(global.points,0,16)) {
		//create point
		var point = instance_create_layer(x,y,"Instances",obj_point);
		point.fired = true;
		point.hspd = cos(angle) * spd;
		point.vspd = -sin(angle) * spd;
		
		//flips around with every ring
		if(flip){
			point.hspd = point.hspd * -1;
			angle += 240;
		}
		
		//toggles flip
		flip = !flip;
		
		//increment counter
		counter++;
		
		//if halfway start second circle with lower speed
		if(counter == 16){
			spd = 4;
			angle = 184; //reset the angle
		}
	}
}
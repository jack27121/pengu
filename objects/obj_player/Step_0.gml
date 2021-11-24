/// @desc every step
if(controlled){
	subimg += sprite_get_speed(sprite_index);
	
	if(grounded){
		//jumping
		if (input_check_pressed(eVerb.Up)){
			grounded = false;
			state.change("jumping");
			
			//if sliding you jump at an angle
			if(!sliding) vspd+= jumpF;
			else {
				vspd+= jumpF * acos;
				hspd+= jumpF * asin;
			}
		} else if (input_check(eVerb.Down) && !sliding){
			sliding = true;
			state.change("sliding_begin");
		}
	}
	
	#region movement
	vspd+= mass * global.gravity; //applies gravity	
	
	var maxFlySpd = max(abs(hspd),maxWalkSpd);
	hinput = input_check(eVerb.Right) -input_check(eVerb.Left);
	hspd += hinput * spd;
	
	image_angle = 0;
	
	//different max speeds
	var frict = 0.75;
	//walking
	if (grounded && !sliding){
		hspd = clamp(hspd,-maxWalkSpd,maxWalkSpd);
	}
	//sliding
	else if (grounded && sliding){
		///angle speed
		hspd-=(asin*vspd);
		image_angle = angle;
		hspd = clamp(hspd,-maxSlideSpd,maxSlideSpd);
		frict = 0.95;
	}
	//flying
	else{
		hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
	}
	vspd = clamp(vspd,-maxSpd,maxSpd);
	
	collision(frict)
	state.step();
	////Makes the body always conform to it's original size
	scaleY = lerp(scaleY,1,0.15);
	scaleX = lerp(scaleX,1,0.15);
	#endregion
	
#region damage

	if (ouch >= 1){
		image_blend = c_red;
		
		//IF THE PLAYER HAS NO POINTS, THEN KILL THEM
		if (global.points = 0){
			//"KILL" the player!!! DIE FAT FUCK!!!
			visible = 0;
			spd = 0;
			controlled = 0;
		}else{ //OHHH? THE PLAYER DOES HAVE POINTS?
			vspd = -6; // LAUNCH THE PLAYER UP
			
			repeat(global.points) { //CREATE POINTS AS ... WELL, FIRED POINTS
				point = instance_create_layer(x,y-8,"Instances",obj_point); 
				point.fired = true; 
				point.direction = random_range(90-45,90+45);
				point.speed = 4;
				point.gravity = 0.1;
			}
				
			global.points = 0; //REMOVE ALL POINTS
			ouch = 0.9; //SET OUCH TO 0.9 TO STOP IT FROM CHECKING TO KILL THE PLAYER
		}
	} else {
		if(ouch = 0) { //MAKE SURE THE PLAYER IS NOT STILL IMMORTAL
			//DETECT BEING HIT BY ANYTHING
			if instance_place(x,y+4,obj_spikes) {ouch = 1;}
			//if instance_place(x,y+4,obj_yourmomma) {ouch = 1;}
		} else {
			ouch = approach(ouch,0,0.01); //GIVE A LITTLE BIT OF IMMORTALITY TIME	
		}
	}
#endregion
}
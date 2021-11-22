// @function	collision(bounciness,frict);
// @param		frict 0.0 to 1.0
// @param		bounciness 0.0 to 1.0
// @description   collissions
function collision(frict = 0.8,bounciness = 0) {
	//decimals under 1, are too small to do collission detection, so they're checking minimum 1 pixel ahead
	var hspd_ = sign(hspd) * max(1,abs(hspd));
	var vspd_ = sign(vspd) * max(1,abs(vspd));
	
	var nudgeH = 16;
	
	// Horizontal collisions
	//Checks if the player will hit the wall on the next frame
	var wall = instance_place(x+hspd_, y, obj_wall);
	if (wall != noone) {
		//moves the player one pixel closer until it's just next to the wall, and then stop moving
		//If there is space right next to the wall. It will nudge the player around the corner
		if (!place_meeting(x+hspd, y-nudgeH, obj_wall)) {
			while(place_meeting(x+hspd, y, obj_wall)) y-=1;
			x+= hspd;
		}
		else if (!place_meeting(x+hspd, y+nudgeH, obj_wall)) {
			while(place_meeting(x+hspd, y, obj_wall)) y+=1;
			x+= hspd;
		}
		else {//Else it will then move the player one pixel closer until it's just next to the wall, and then stop moving
			while(!place_meeting(x+sign(hspd_), y, obj_wall)) {
				x += sign(hspd);
			}
			//vspd = vspd * max(frict,wall.frict);				//friction
			hspd = hspd * -(bounciness + wall.bounciness);		//bounciness
		}
	} else x+= hspd;
	
	// Vertical collisions
	var wall = instance_place(x, y+vspd_, obj_wall);
	if (wall != noone) {
		while(!place_meeting(x, y+sign(vspd_), obj_wall)) {
			y += sign(vspd);
		}
		if(hinput == 0)	hspd = hspd * max(frict,wall.frict);//friction
		vspd = vspd * -(bounciness + wall.bounciness);		//bounciness
		grounded = true;
	} else{
 		y+= vspd;
		grounded = false;	
	}
}

// @function	collision(radius,bounciness,frict);
// @param		radius of collission circle
// @param		frict 0.0 to 1.0
// @param		bounciness 0.0 to 1.0
// @description   collissions
function collision_sphere(radius){
	//Vertical movement
	if(hspd > 0){
		for(var i = 0; i < hspd && !collision_offset(16,dirRight);i++){
			x+=acos;
			y-=asin;
		}
	}
	if(hspd < 0){
		for(var i = 0; i > hspd && !collision_offset(16,dirLeft);i--){
			x-=acos;
			y+=asin;
		}
	}
	
	//Vertical movement
	if(vspd > 0){
		for(var i = 0; i < vspd && !collision_offset(16,dirUp);i++){
			x+=acos;
			y-=asin;
		}
	}
	if(vspd < 0){
		for(var i = 0; i > vspd && !collision_offset(16,dirDown);i--){
			x-=acos;
			y+=asin;
		}
	}

	acos = cos(degtorad(angle)); //cos 1 means rotation facing right
	asin = sin(degtorad(angle));
	
	
	//if(hspd > 0){
	//	for(var i = 0; i < hspd && !collision_right(16);i++){
	//		x+=acos;
	//		y-=asin;
	//	}
	//}
	//if(hspd < 0){
	//	for(var i = 0; i > hspd && !collision_left(16);i--){
	//		x-=acos;
	//		y+=asin;
	//	}
	//}
	
	//Vertical movement
	//if(vspd > 0){
	//	for(var i = 0; i < vspd && !collision_top(16);i++){
	//		x+=acos;
	//		y-=asin;
	//	}
	//}
	//if(vspd < 0){
	//	for(var i = 0; i > vspd && !collision_bottom(16);i--){
	//		x-=acos;
	//		y+=asin;
	//	}
	//}
	
	//Landing
	//if(vspd >= 0 && !grounded && collision_bottom(16) && (collision_left_line(16) || collision_right_line(16))){
	//	angle = find_angle(angle,10,16);
	//	acos=cos(degtorad(angle));
	//	asin=sin(degtorad(angle));
	//	
	//	vspd = 0;
	//	grounded = true;
	//}
	
	
	//lock to ground
	//if(grounded){
	//	while collision_main(){
	//		x-=asin; y-=acos;	
	//	}
	//	//while(collision_ground(16) && !collision_main()){
	//	//	x+=asin; y+=acos;	
	//	//}
	//}
	
	
	//wall collision
	//while(collision_right(16)){
	//	x-=acos;
	//	y+=asin;
	//}
	//while(collision_left(16)){
	//	x+=acos;
	//	y-=asin;
	//}
	//
	////leave ground
	//if((!collision_left_line(16) || !collision_right_line(16)) && grounded){
	//	grounded = false;	
	//}
	//
	////gravity
	//if (!grounded) vspd+=grv;
	//
	//if (grounded && collision_left_line(16) && collision_right_line(16)){
	//	angle=find_angle(angle,16,24);	
	//}else angle =0;
	//
	//acos = cos(degtorad(angle));
	//asin = sin(degtorad(angle));
}

function collision_offset(radius,dir){
	var x_ = lengthdir_x(radius,dir);
	var y_ = lengthdir_y(radius,dir);
	if collision_circle(x+x_*acos,y+y_*asin,3,obj_wall,true,true) return true;
	return false;
}

//function collision_360(){
//	//Limits
//	hspd = clamp(hspd,-maxSpd,maxSpd);
//	vspd = clamp(vspd,-maxSpd,maxSpd);
//	
//	
//	//Horizontal movement
//	if(hspd > 0){
//		for(var i = 0; i < hspd && !collision_right(16);i++){
//			x+=acos;
//			y-=asin;
//		}
//	}
//	if(hspd < 0){
//		for(var i = 0; i > hspd && !collision_left(16);i--){
//			x-=acos;
//			y+=asin;
//		}
//	}
//	
//	//Vertical movement
//	if(vspd>0){
//	    for(i=0;i<vspd &&!collision_bottom(16);i+=1){
//	        y+=1;
//	    }
//	} if (vspd<0){
//	    for(i=0;i>vspd && !collision_top(16);i-=1;){
//	        y-=1;
//	    }
//	}
//	
//	//Landing
//	if(vspd >= 0 && !grounded && collision_bottom(16) && (collision_left_line(16) || collision_right_line(16))){
//		angle = find_angle(angle,10,16);
//		acos=cos(degtorad(angle));
//		asin=sin(degtorad(angle));
//		
//		vspd = 0;
//		grounded = true;
//	}
//	
//	
//	//lock to ground
//	if(grounded){
//		while collision_main(){
//			x-=asin;
//			y-=acos;	
//		}
//		while(!collision_main() && collision_ground(16)){
//			x+=asin;
//			y+=acos;	
//		}
//	}
//	
//	//wall collision
//	while(collision_right(16)){
//		x-=acos;
//		y+=asin;
//	}
//	while(collision_left(16)){
//		x+=acos;
//		y-=asin;
//	}
//
//	//gravity
//	if !grounded vspd+=mass*global.gravity;
//	 
//	///angle speed
//	if(angle > 70 && angle < 290 && abs(hspd) < 2.5){
//	    angle=0;
//	    vspd=-(asin*hspd);
//	    hspd=(acos*hspd);
//	    grounded = false;
//	}
//	 
//	///slope factor
//	if grounded && collision_left_line(16) && collision_right_line(16){
//	    angle=find_angle(angle,16,24);
//	}else{
//	    angle=0;
//	}
//	 
//	acos = cos(degtorad(angle));
//	asin = sin(degtorad(angle));
//}
//
//function collision_main(){
//	if collision_circle(x,y,3,obj_wall,true,true) return true;
//	return false;
//}
//	
//function collision_right(mask){
//	if collision_circle(x+(acos*mask)-asin*2,y-(asin*mask)-acos*2,3,obj_wall,true,true) return true;
//	return false;
//}
//		
//function collision_left(mask){
//	if collision_circle(x-(acos*mask)-asin*2,y-(asin*mask)-acos*2,3,obj_wall,true,true) return true;
//	return false;
//}
//
//function collision_top(mask){
//	if collision_circle(x-asin*mask,y-acos*mask,3,obj_wall,true,true) return true;
//	return false;
//}
//
//function collision_bottom(mask){
//	if collision_circle(x+asin*mask,y+acos*mask,3,obj_wall,true,true) return true;
//	return false;
//}
//
//function collision_ground(mask){
//	if collision_circle(x-asin*(mask*1.5),y+acos*(mask*1.5),3,obj_wall,true,true) return true;
//	return false;
//}
//
function collision_right_line(mask){
	line = floor(mask*2.5);
	if collision_line(
		x+(acos*mask)+(asin*mask),
		y-(asin*mask)+(acos*mask),
		x+(acos*mask)+(asin*line),
		y-(asin*mask)+(acos*line),
		obj_wall,true,true) return true;
	return false;
}

function collision_left_line(mask){
	line = floor(mask*2.5);
	if collision_line(
		x-(acos*mask)+(asin*mask),
		y+(asin*mask)+(acos*mask),
		x-(acos*mask)+(asin*line),
		y+(asin*mask)+(acos*line),
		obj_wall,true,true) return true;
	return false;
}
//
function find_angle(angle,hspace,check){
	angle=round(angle/8)*8;
	 
	acos=cos(degtorad(angle));
	asin=sin(degtorad(angle));
	 
	x1 = round(x-(acos*hspace));
	y1 = round(y+(asin*hspace));
	 
	x2 = round(x+(acos*hspace));
	y2 = round(y-(asin*hspace));
	 
	done1 = 0;
	done2 = 0;
	 
	i = check;
	while(i>0){
	    if !done1{
	        if collision_point(x1,y1,obj_wall,true,true) done1 = true;
	        x1 +=asin;
	        y1 +=acos;
	    }if !done2 {
	        if collision_point(x2,y2,obj_wall,true,true) done2 = true;
	        x2 +=asin;
	        y2 +=acos;
	    } if done1 && done2 break;
	    i-=1;
	}
	 
	return round(point_direction(x1,y1,x2,y2));
}
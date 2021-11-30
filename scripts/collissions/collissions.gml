// @function	collision(bounciness,frict);
// @param		frict 0.0 to 1.0
// @param		bounciness 0.0 to 1.0
// @description   collissions
function collision(hinput_ = 0, frict = 0.2,bounciness = 0) {
	//decimals under 1, are too small to do collission detection, so they're checking minimum 1 pixel ahead
	var hspd_ = sign(hspd) * max(1,abs(hspd));
	var vspd_ = sign(vspd) * max(1,abs(vspd));
	
	var nudge = 8;
	
	// Horizontal collisions
	//Checks if the player will hit the wall on the next frame
	var wall = instance_place(x+hspd_, y, obj_wall);
	if (wall != noone && !is_child(wall,obj_wall_top)) {
		//If there is space right above the wall. It will nudge the player up
		if (!place_meeting(x+hspd, y-nudge, obj_wall)) {
			while(place_meeting(x+hspd, y, obj_wall)) y-=1;
			x+= hspd;
		}
		else {//Else it will then move the player one pixel closer until it's just next to the wall, and then stop moving
			while(!place_meeting(x+sign(hspd_), y, obj_wall)) {
				x += sign(hspd);
			}
			//vspd = vspd * max(frict,wall.frict);				//friction
			hspd = hspd * -(bounciness + wall.bounciness);		//bounciness
		}
	} else	x+= hspd;
	
	// Vertical collisions
	//keeps player alligned with floor when going down slopes
	//var wall = instance_place(x, y+nudge, obj_wall);
	if(grounded && place_meeting(x,y+nudge, obj_wall)){//wall != noone){
		while(!place_meeting(x, y+1, obj_wall)) {
			y += 1
		}
	}
	
	var wall = instance_place(x, y+vspd_, obj_wall);
	
	//doesn't run if you're underneath a one way platform
	if ((wall != noone && !is_child(wall,obj_wall_top)) || (is_child(wall,obj_wall_top) && bbox_bottom-2 <= wall.bbox_top+2 && vspd >= 0)){
		while(!place_meeting(x, y+sign(vspd_), obj_wall)) {
			y += sign(vspd);
		}
		y = round(y);
		
		x+= wall.x-wall.xprevious;
		if !collision_point(x,bbox_bottom,obj_wall,true,true) y+= wall.y-wall.yprevious;
		else while(collision_point(x,bbox_bottom,obj_wall,true,true))y--;

		var frict_ = min(frict,wall.frict);//friction
		if(hinput_ == 0) hspd = hspd * (1-frict_);
		
		//going up is slow, going down is fast
		hspd = hspd * (1-sign(hspd)*asin*0.01);
		
		//slippery surfaces make you slide
		if(frict_<0.1){
			hspd = hspd * (1-sign(hspd)*asin*0.5);
			hspd-=(asin)*(1-frict_)*0.1;
		}
		
		vspd = vspd * -(bounciness + wall.bounciness);//bounciness
		grounded = true;
	} else{
 		y+= vspd;
		grounded = false;	
	}
	
	///slope factor
	if (grounded && collision_left_line(8) && collision_right_line(8)){
	    angle=find_angle(angle,8,24);
	}else{
	    angle=0;
	}
	acos = cos(degtorad(angle));
	asin = sin(degtorad(angle));
	
	return wall;
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
////wall collision
//while(collision_right(16)){
//	x-=acos;
//	y+=asin;
//}
//while(collision_left(16)){
//	x+=acos;
//	y-=asin;
//}
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
	var line = floor(mask*2.5);
	if collision_line(
		x+(acos*mask)+(asin*mask),
		y-(asin*mask)+(acos*mask),
		x+(acos*mask)+(asin*line),
		y-(asin*mask)+(acos*line),
		obj_wall,true,true) return true;
	return false;
}

function collision_left_line(mask){
	var line = floor(mask*2.5);
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
/// @desc every step
subimg += sprite_get_speed(sprite_index);
if(controlled){
	if(grounded && !hurting){
		//jumping
		if (input_check_pressed(eVerb.Up) || input_check_pressed(eVerb.Jump)){
			//checks if there's space to stop sliding first
			if(sliding){
				mask_index = spr_pengu_mask_standing;
				var wall = instance_place(x,y-1,obj_wall);
				if (wall == noone){
					state.change("jumping");
					vspd+= jumpF * acos;
					hspd+= jumpF * asin * 0.5;
					if(hspd != 0) flip = sign(hspd);
				} else mask_index = spr_pengu_mask;
			} else{
				state.change("jumping");
				vspd+= jumpF;
			}
		} else if (input_check(eVerb.Down) && !sliding){
			state.change("sliding_begin");
		}
	}
	
	//horizontal movement
	maxFlySpd = clamp(max(abs(hspd),maxWalkSpd), -maxSpd,maxSpd);
	maxSlideDeltaSpd = max( min(abs(hspd),maxSlideDeltaSpd), maxSlideSpd);
	maxSlideDeltaSpd = clamp(maxSlideDeltaSpd, -maxSpd,maxSpd);
	
	
	if(hcontrol){
		hinput = input_check(eVerb.Right) -input_check(eVerb.Left);
		if(grounded && !sliding) {hspd += hinput * spd; flytime = 0;}
		else if(grounded && sliding) {hspd += hinput * spd * 0.6;  flytime = 0;}
		else {hspd += hinput * spd * 0.8; flytime += 1;}; //not as good control in air
	}	
}
	
//vertical movement
vspd+= mass * global.gravity; //applies gravity	

if(!state.state_is("spinning") && !state.state_is("launch")){
	angle -= angle_difference(angle,0) * 0.1;
}

//different max speeds
var frict = 0.25;
//walking
if (grounded && !sliding){
	hspd = clamp(hspd,-maxWalkSpd,maxWalkSpd);
}
//sliding
else if (grounded && sliding){
	//image_angle = angle;	
	///angle speed
	hspd = clamp(hspd,-maxSlideDeltaSpd,  maxSlideDeltaSpd);
	//hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
	frict = 0.05;
}

//sliding sound
//if (sliding){
//	if (audio_is_playing(sliding_sound))	sliding_sound = audio_play_sound(snd_slide_start,1,false);
//}

//flying
else{
	hspd = clamp(hspd,-maxFlySpd,maxFlySpd);
}

var maxSpdV = max(maxSpd,maxFlySpd);
vspd = clamp(vspd,-maxSpdV,maxSpdV);	

//retarded code but returning the ground object, to see if it's a slidey one
var wall = collision(hinput, frict);
if(is_child(wall,obj_wall_icey) && abs(asin)>0.6){
	hcontrol = false;
	if(!sliding){
		state.change("sliding_begin");
		sliding = true;
	}
} else if(grounded || state.state_is("launch")) hcontrol = true;

if (grounded && !sliding) angle = angle/2; 
if(!grounded && (state.state_is("running") || state.state_is("idle"))) state.change("falling_start");

#region damage
if(!hurting) { //DETECT BEING HIT BY spikies
	//var spike = instance_place(x+hspd,y+vspd,obj_spikes);
	if(is_child(wall,obj_spikes)){
		var launch_spd = 6;
		var launch_x = lengthdir_x(launch_spd/2,wall.image_angle+90);
		var launch_y = lengthdir_y(launch_spd,wall.image_angle+90);
		
		hspd += launch_x; // Launch the player away;
		vspd += launch_y; 
		
		var sound = audio_play_sound(snd_pengu_hurt_spikes,100,false);
		audio_sound_pitch(sound,pitch_change(random_range(-2,2)))
		
		hurting = true;
		state.change("hurt");
	}
}
#endregion

#region pits
if(y > room_height+20) { //DETECT BEING HIT BY spikies
	if room != rm_13_secret {state.change("dying");}
}
#endregion

///SPEED MEDAL
if abs(hspd) > 12 and global.medalmach10 = false
{
	global.medalmach10 = true;
	ng_unlockmedal("Mach 10 Penguin");
	show_debug_message("MACH 10 PENGUIN");
}

///FLYING MEDAL
if flytime > 60*3 and global.medalrealbird = false
{
	global.medalrealbird = true;
	ng_unlockmedal("A Real Bird");
	show_debug_message("A REAL BIRD");
}


if(angle < 0) angle += 360;
if(abs(angle_difference(0,angle)) < 1) angle = 0;

state.step();
////Makes the body always conform to it's original size
scaleY = lerp(scaleY,1,0.15);
scaleX = lerp(scaleX,1,0.15);
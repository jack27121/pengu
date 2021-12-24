/// @descr Initialize player
//array_push(global.sacred_objects,self);
controlled = true;
invincible = false;
sliding = false;

grounded = false;
mass = 0.26;
startx = x;
starty = y;

//hurting
hurting = false;
hurtT = 0;

hinput = 0;

hcontrol = true;

hspd = 0;
vspd = 0;

maxWalkSpd = 3;
maxSlideSpd = 6;
maxSpd = 16;
maxFlySpd = 0;
maxSlideDeltaSpd = 0;

spd= 0.3;
slid = 0;
flytime = 0;

scaleX = 1;
scaleY = 1;

jumpF = -6;

acos = 1;
asin = 0;
angle = 0;

subimg = 0;

flip = 1;
slidetimer = 0;

#region states
state = new SnowState("idle");

state.event_set_default_function("step", function() {

});

state.event_set_default_function("draw", function() {
	var yoffset = 16 * (1-scaleY);
	
	//draw_text(x,y-60,string(flytime));
	
	viz_angle = angle;
	if (grounded && !sliding) viz_angle = angle_difference(angle,0)/2 //if walking up slopes you aren't rotated as much
	draw_sprite_ext(sprite_index,subimg,x,y+yoffset,flip*scaleX,scaleY,viz_angle,white,image_alpha);
});

state.add("idle", {
    enter: function() {
		sprite_index = spr_pengu_idle;
		mask_index = spr_pengu_mask_standing;
    },
	step: function() {
		if (hinput != 0){
			if( hinput != flip ) state.change("turning");
			else state.change("running");
		}
	},
});

state.add("turning", {
    enter: function() {
		flip = -flip;
		sprite_index = spr_pengu_idle;
		subimg = 0;
		
		scaleY = 0.8;
		scaleX = 1.2;
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("idle");
		}
	}
});

state.add("running", {
    enter: function() {
		sprite_index = spr_pengu_idle;
    },
	step: function() {
		if (hinput == 0) state.change("idle");
		else if (hinput != flip) state.change("turning");
	},
});

state.add("sliding_begin", {
    enter: function() {
		sliding = true;
		slid = 1;
		sprite_index = spr_pengu_slide_begin;
		subimg = 0;
		var sound = audio_play_sound(snd_down,100,false);
		audio_sound_pitch(sound,pitch_change(random_range(-2,2)))
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("sliding");
		}
	}
});

state.add("spinning", {
    enter: function() {
		sprite_index = spr_pengu_spin;
		subimg = 0;
    }
});

state.add("sliding", {
    enter: function() {
		sliding = true;
		slid = 1;
		scaleY = 0.8;
		scaleX = 1.2;
		// audio_play_sound(snd_slide_loop, 15, true); NEED TO FIX

		sprite_index = spr_pengu_slide;
		mask_index = spr_pengu_mask;
		
		if(flip > 0) slidingSubimg = 12; //decides wether to start pointing left or right
		else slidingSubimg = 0;
		subimg = slidingSubimg;
		flip = 1;
    },
	step: function() {
		slidingSubimg+=hspd/10;
		slidingSubimg = clamp(slidingSubimg,0,12);
		subimg = slidingSubimg;
		
		//LOOK AT SCREEN MEDAL
		if (floor(slidingSubimg) == 6) {
			slidetimer += 1;
			if(slidetimer > 4*60 && !global.medalovo){
				global.medalovo = true;
				ng_unlockmedal("( o ) v ( o )");
				show_debug_message("OVO???");
			}
		} else slidetimer = 0;
		
		if(hinput !=0 ){ //squishes a little bit when moving
			scaleY = 0.95;
			scaleX = 1.05;	
		}
		
		if(!grounded){
			state.change("falling_start")
			angle = sign(hspd)*-90;
		}
	},
	leave: function() {
		sliding = false;
		mask_index = spr_pengu_mask;
		if(slidingSubimg<3) flip = -1;	
	}
});

state.add("jumping", {
    enter: function() {
		
		grounded = false;
		sliding = false;
		mask_index = spr_pengu_mask_standing;
		sprite_index = spr_pengu_jump;		
		if( hinput != 0 && hinput != flip ) flip = -flip; //to turn when you start jumping
		
		scaleY = 1.9;
		scaleX = 0.5;
		
		var sound = audio_play_sound(snd_jump,100,false);
		audio_sound_pitch(sound,pitch_change(random_range(-2,2)))
    },
	step: function() {
		if ((!input_check(eVerb.Up) && !input_check(eVerb.Jump)) && vspd < 0) vspd*= 0.9 //letting go of jump will make you fall faster
		if (vspd > 0) state.change("falling_start")
		if(grounded){
			scaleY = 0.7;
			scaleX = 1.3;
			if (hinput == 0) state.change("idle");
			else state.change("running");
		}
	},
});

state.add("launch", {
    enter: function() {
		
		grounded = false;
		sliding = false;
		mask_index = spr_pengu_mask_standing;
		sprite_index = spr_pengu_spin;		
		
		scaleY = 2.1;
		scaleX = 0.4;
		
		spinSubimg = 0;
		
		var sound = audio_play_sound(snd_jump,100,false);
		audio_sound_pitch(sound,pitch_change(random_range(-2,2)))
		
    },
	step: function() {
		var spin_spd = point_distance(0,0,hspd,vspd);
		spinSubimg+=spin_spd/10;
		//spinSubimg = clamp(spinSubimg,0,7);
		subimg = spinSubimg;		
		
		if (vspd > 0) state.change("launch_end")
		if(grounded){
			scaleY = 0.7;
			scaleX = 1.3;
			if (hinput == 0) state.change("idle");
			else state.change("running");
		}
	},
	leave: function(){
		if hspd != 0{
			if hspd > 0 flip = 1;
			else flip = -1;
		}
	}
});

state.add("launch_end", {
    enter: function() {
		sprite_index = spr_pengu_spin_end;
		subimg = 0;
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("falling_start");
		}
		if(grounded){
			scaleY = 0.7;
			scaleX = 1.3;
			if (hinput == 0) state.change("idle");
			else state.change("running");
		}
	},
});

state.add("falling_start", {
    enter: function() {
		sprite_index = spr_pengu_begin_fall;
		subimg = 0;
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("falling");
		}
		if(grounded){
			scaleY = 0.7;
			scaleX = 1.3;
			if (hinput == 0) state.change("idle");
			else state.change("running");
		}
	},
});

state.add("falling", {
    enter: function() {
		sprite_index = spr_pengu_fall;
    },
	step: function() {
		
		if(grounded){
			scaleY = 0.7;
			scaleX = 1.3;
			
			//var sound = audio_play_sound(snd_landing,100,false);
			//audio_sound_pitch(sound,pitch_change(random_range(-2,2)))
			
			if (hinput == 0) state.change("idle");
			else state.change("running");
		}
	},
});

state.add("hurt", {
	enter: function(){
		hurtT = 0;
		screen_shake(20,10);
		hurting = true;
		sprite_index = spr_pengu_hurt;
		
		var sound_file = (irandom_range(1,1000) != 1000) ? snd_pengu_hurt : snd_pengu_uwu;
		var sound = audio_play_sound(sound_file,100,false);
		audio_sound_pitch(sound,pitch_change(random_range(2,10)));
		
		//IF THE PLAYER HAS NO POINTS, THEN KILL THEM
		if (global.points == 0){
			state.change("dying");
		}else{ //OHHH? THE PLAYER DOES HAVE POINTS?
			point_scatter();
			global.points = 0; //REMOVE ALL POINTS
		}
	},
	
	step: function(){
		if(hurtT > 1 * room_speed){
			state.change("idle");
		} else hurtT++
	},
	
	leave: function(){
		hurting = false;
	}
});
	
state.add("dying", {
	enter: function(){
		//MEDAL
		global.deathcounter += 1;
		if global.deathcounter >= 10 and global.medalouch = false {
			ng_unlockmedal("Oof! Ouch! Owie!");
			show_debug_message("OUCHIES MEDAL");
			global.medalouch = true;
		}
		
		
		
		if room != rm_14_secret {
			controlled = false;	
			start_fade_out(function(){
				room_restart();
			});
		}else{
			x = startx;
			y = starty;
			global.points = 10;
		}
	}
});

#endregion
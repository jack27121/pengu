/// @descr Initialize player
//array_push(global.sacred_objects,self);
controlled = true;
invincible = false;
sliding = false;

grounded = false;
mass = 0.26;

//hurting
hurting = false;
hurtT = 0;

hinput = 0;

hcontrol = true;

hspd = 0;
vspd = 0;

maxWalkSpd = 3;
maxSlideSpd = 6;
maxSpd = 6

spd= 0.3;

scaleX = 1;
scaleY = 1;

jumpF = -7.5;

acos = 1;
asin = 0;
angle = 0;

subimg = 0;

#region states
state = new SnowState("idle");

state.event_set_default_function("step", function() {

});

state.event_set_default_function("draw", function() {
	var yoffset = 16 * (1-scaleY);
	draw_sprite_ext(sprite_index,subimg,x,y+yoffset,image_xscale*scaleX,image_yscale*scaleY,image_angle,white,image_alpha);
});

state.add("idle", {
    enter: function() {
		sprite_index = spr_pengu_idle;
    },
	step: function() {
		if (hinput != 0){
			if( hinput != image_xscale ) state.change("turning");
			else state.change("running");
		}
	},
});

state.add("turning", {
    enter: function() {
		image_xscale = -image_xscale;
		sprite_index = spr_pengu_idle;
		subimg = 0;
		
		scaleY = 0.8;
		scaleX = 1.2;
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("idle");
			audio_play_sound(snd_slide_end, 15, false);
		}
	}
});

state.add("running", {
    enter: function() {
		sprite_index = spr_pengu_idle;
    },
	step: function() {
		if (hinput == 0) state.change("idle");
		else if (hinput != image_xscale) state.change("turning");
	},
});

state.add("sliding_begin", {
    enter: function() {
		sliding = true;
		sprite_index = spr_pengu_slide_begin;
		subimg = 0;
		audio_play_sound(snd_down, 20, false);
		audio_play_sound(snd_slide_start, 15, false);
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("sliding");
		}
	}
});

state.add("sliding", {
    enter: function() {
		sliding = true;
		scaleY = 0.8;
		scaleX = 1.2;
		// audio_play_sound(snd_slide_loop, 15, true); NEED TO FIX

		sprite_index = spr_pengu_slide;
		mask_index = spr_pengu_mask;
		
		if(image_xscale > 0) slidingSubimg = 12; //decides wether to start pointing left or right
		else slidingSubimg = 0;
		subimg = slidingSubimg;
		image_xscale = 1;
    },
	step: function() {
		slidingSubimg+=hspd/10;
		slidingSubimg = clamp(slidingSubimg,0,12);
		subimg = slidingSubimg;
		
		if(hinput !=0 ){ //squishes a little bit when moving
			scaleY = 0.95;
			scaleX = 1.05;	
		}
		
		if(!grounded){
			state.change("falling_start")
			image_angle = sign(hspd)*-90;
		}
	},
	leave: function() {
		sliding = false;
		mask_index = spr_pengu_mask;
		if(slidingSubimg<3) image_xscale = -1;	
	}
});

state.add("jumping", {
    enter: function() {
		
		grounded = false;
		sliding = false;
		mask_index = spr_pengu_mask_standing;
		sprite_index = spr_pengu_jump;		
		if( hinput != 0 && hinput != image_xscale ) image_xscale = -image_xscale; //to turn when you start jumping
		audio_play_sound(snd_up, 20, false);
		audio_play_sound(snd_jump, 15, false);
		
		scaleY = 1.9;
		scaleX = 0.5;
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

state.add("falling_start", {
    enter: function() {
		sprite_index = spr_pengu_begin_fall;
		subimg = 0;
		armYOffset = -15;
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
		armYOffset = -15;
    },
	step: function() {
		
		if(grounded){
			scaleY = 0.7;
			scaleX = 1.3;
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
		audio_play_sound(snd_hurt,15,false);
		
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
		controlled = false;	
		start_fade_out(function(){
			audio_stop_all();
			room_restart();
		});
	}
});

#endregion
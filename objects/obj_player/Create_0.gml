/// @descr Initialize player
controlled = true;
invincible = false;
grounded = false;
sliding = false;

mass = 0.3;

//hurting
hurting = false;
hurtT = 0;
ouch = 0;

hinput = 0;
vinput = 0;

hcontrol = true;

hspd = 0;
vspd = 0;

maxWalkSpd = 2.2;
maxSlideSpd = 4;
maxSpd = 6

spd= 0.42;

scaleX = 1;
scaleY = 1;

jumpF = -7;
subimg = 0;
slidingSubimg = 0;

acos = 1;
asin = 0;
angle = 0;

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
		sprite_index = spr_pengu_slide_begin;
		subimg = 0;
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("sliding");
		}
	}
});

state.add("sliding", {
    enter: function() {
		scaleY = 0.8;
		scaleX = 1.2;

		sprite_index = spr_pengu_slide;
		
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
	},
	leave: function() {
		sliding = false;
		if(slidingSubimg<3) image_xscale = -1;	
	}
});

state.add("jumping", {
    enter: function() {
		sprite_index = spr_pengu_idle;		
		if( hinput != 0 && hinput != image_xscale ) image_xscale = -image_xscale; //to turn when you start jumping
		
		scaleY = 1.9;
		scaleX = 0.5;
    },
	step: function() {
		if (!input_check(eVerb.Up) && vspd < 0) vspd*= 0.9 //letting go of jump will make you fall faster
		if (vspd > 0) state.change("falling_start")
	},
});

state.add("falling_start", {
    enter: function() {
		sprite_index = spr_pengu_idle;
		subimg = 0;
		armYOffset = -15;
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("falling");
		}
	},
});

state.add("falling", {
    enter: function() {
		sprite_index = spr_pengu_idle;
		armYOffset = -15;
    },
	step: function() {
		
		if(grounded){
			if (hinput == 0) state.change("idle");
			else state.change("running");
		}
	},
	leave: function() {
		scaleY = 0.7;
		scaleX = 1.3;
	}
});

state.add("hurt", {
	enter: function(){
		//controlled = false;
		screen_shake(20,10);
		hurting = true;
		sprite_index = spr_pengu_hurt;
		
		//IF THE PLAYER HAS NO POINTS, THEN KILL THEM
		if (global.points == 0){
			state.change("dying");
		}else{ //OHHH? THE PLAYER DOES HAVE POINTS?
			repeat(global.points) { //CREATE POINTS AS ... WELL, FIRED POINTS
				var point = instance_create_layer(x,y-8,"Instances",obj_point); 
				point.fired = true; 
				//point.direction = random_range(90-45,90+45);
				//point.speed = 6;
				
				var dir = random_range(90-80,90+80);
				point.hspd = lengthdir_x(6,dir);
				point.vspd = lengthdir_y(6,dir);
				show_debug_message(point.hspd);
				show_debug_message(point.vspd);
				point.grav = 0.4;
			}
			global.points = 0; //REMOVE ALL POINTS
		}
	},
	
	step: function(){
		if(hurtT > 1 * room_speed){
			hurtT = 0;
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
	}
});

#endregion
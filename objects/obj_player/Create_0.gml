/// @descr Initialize player
controlled = true;
invincible = false;
hurting = false;
grounded = false;
sliding = false;

mass = 0.3;

hinput = 0;
vinput = 0;

hspd = 0;
vspd = 0;

maxWalkSpd = 3;
maxSlideSpd = 5;
maxSpd = 8

spd= 0.21;

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
	draw_sprite_ext(sprite_index,subimg,x,y,image_xscale*scaleX,image_yscale*scaleY,image_angle,white,image_alpha);
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
	},
});

state.add("sliding", {
    enter: function() {
		scaleY = 0.8;
		scaleX = 1.2;
		
		sliding = true;
		
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
		armYOffset = 0;
		scaleY = 0.7;
		scaleX = 1.3;
	}
});

state.add("hurt", {
	enter: function(){
		controlled = false;
		screen_shake(20,10);
		hurting = true;
	}
});
	
state.add("dying", {
	enter: function(){
		controlled = false;	
	}
});

#endregion
/// @descr Initialize player
controlled = true;
invincible = false;
hurting = false;

hinput = 0;
vinput = 0;

hspd = 0;
vspd = 0;
hspdMax = 3;
hspdSlidingMax = 6;
vspdMax = 6;

spd= 0.42;

grv=0.21875;

grounded = false;



scaleX = 1;
scaleY = 1;

jumpF = 10;
subimg = 0;
slidingSubimg = 0;

#region states
state = new SnowState("idle");

state.event_set_default_function("step", function() {

});

state.event_set_default_function("draw", function() {
	draw_sprite_ext(sprite_index,subimg,x,y,image_xscale*scaleX,image_yscale*scaleY,0,white,image_alpha);
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

state.add("halt", {
    enter: function() {
		subimg = 0;
		sprite_index = spr_pengu_idle;
    },
	step: function() {
		
		if (hinput != 0){
			if( hinput != sign(image_xscale) ) state.change("turning");
			else state.change("running");
		}
		if (animation_end(sprite_index,subimg)){
			state.change("idle");
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
			state.change("halt");
		}
	}
});

state.add("running", {
    enter: function() {
		sprite_index = spr_pengu_idle;
    },
	step: function() {
		if (hinput == 0) state.change("halt");
		else if (hinput != image_xscale) state.change("turning");
		
		if(input_check_pressed(eVerb.Down)) state.change("sliding_begin");
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
		sprite_index = spr_pengu_slide;
		
		if(image_xscale > 0) slidingSubimg = 6; //decides wether to start pointing left or right
		else slidingSubimg = 0;
		subimg = slidingSubimg;
		image_xscale = 1;
    },
	step: function() {
		if(hinput > 0) slidingSubimg+=0.1;
		if(hinput < 0) slidingSubimg-=0.1;
		slidingSubimg = clamp(slidingSubimg,0,6);
		subimg = slidingSubimg;
	},
	leave: function() {
		if(slidingSubimg<3) image_xscale = -1;	
	}
});

state.add("jumping", {
    enter: function() {
		sprite_index = spr_pengu_idle;
		vspd = jumpF;
		armYOffset = -15;
		
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
			if (hinput == 0) state.change("halt");
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
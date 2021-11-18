/// @descr Initialize player
controlled = true;
invincible = false;
hurting = false;

hinput = 0;
vinput = 0;

hspd = 0;
vspd = 0;

hspdl = 16;
vspdl = 16;

acc= 0.046875;
dcc=0.5;

frc=0.046875;
grv=0.21875;

grounded = false;

acos = 1;
asin = 0;
angle = 0;



scaleX = 1;
scaleY = 1;

jumpF = 10;
subimg = 0;

#region states
state = new SnowState("idle");

state.event_set_default_function("step", function() {

});

state.event_set_default_function("draw", function() {
	draw_sprite_ext(sprite_index,subimg,x,y,image_xscale*scaleX,image_yscale*scaleY,angle,white,image_alpha);
});

state.add("idle", {
    enter: function() {
		sprite_index = spr_pengu_idle;
    },
	step: function() {
		//if (hinput != 0){
		//	if( hinput != image_xscale ) state.change("turning");
		//	else state.change("running");
		//}
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
	},
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
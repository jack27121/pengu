/// @description init vars
dead = false;
grounded = false;
wallBump = false;
mass = 0.3;
hspd = 0;
vspd = 0;

spd= 0.1;
maxSpd = 2

scaleX = 1;
scaleY = 1;

acos = 1;
asin = 0;
angle = 0;

subimg = 0;

#region states
state = new SnowState("walking");

state.event_set_default_function("step", function() {

});

state.event_set_default_function("draw", function() {
	var yoffset = 16 * (1-scaleY);
	draw_sprite_ext(sprite_index,subimg,x,y+yoffset,image_xscale*scaleX,image_yscale*scaleY,image_angle,white,image_alpha);
});

state.add("walking", {
    enter: function() {
		sprite_index = spr_goomba;
    },
	step: function() {
		hspd+=spd*image_xscale;
		if (wallBump){ //turns around when hitting a wall
			wallBump = false;
			image_xscale = -image_xscale;
		}
	},
});

state.add("dead", {
	enter: function(){
		hspd = 0;
		vspd = 0;
		dead = true;
		sprite_index = spr_goomba_crush;
	}
});

//state.add("turning", {
//    enter: function() {
//		image_xscale = -image_xscale;
//		subimg = 0;
//		
//		scaleY = 0.8;
//		scaleX = 1.2;
//    },
//	step: function() {
//		if (animation_end(sprite_index,subimg)){
//			state.change("idle");
//			audio_play_sound(snd_slide_end, 15, false);
//		}
//	}
//});
#endregion
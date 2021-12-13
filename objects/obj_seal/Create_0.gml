/// @description init vars
grounded = false;
mass = 0.2;
hspd = 0;
vspd = 0;

spd = 1;
maxVSpd = 8
maxSpd = 1

scaleX = 1;
scaleY = 1;

acos = 1;
asin = 0;
angle = 0;

subimg = 0;

flip = image_xscale;

#region states
state = new SnowState("walking");

state.event_set_default_function("draw",function() {
	var yoffset = 16 * (1-scaleY);
	draw_sprite_ext(sprite_index,subimg,x,y+yoffset,flip*scaleX,scaleY,image_angle,white,image_alpha);	
});

state.add("walking", {
    enter: function() {
		sprite_index = spr_seal;
    },
	step: function() {

		hspd = flip * spd;
		
		var x_offset = lengthdir_x(8*flip,angle);
		var y_offset = lengthdir_y(8*flip,angle);
		if collision_circle(x+x_offset,y+y_offset,4,obj_wall,true,true){ //turns around when hitting a wall
			flip = -flip;
		}
	},
});

state.add("dying", {
    enter: function() {
		sprite_index = spr_seal_dead;
	  	hspd = 2*sign(hspd); //launches into the air
		vspd = -8;
		rot_rate = 8 * -sign(hspd);
		
		var sound = audio_play_sound(snd_seal_hurt,100,false);
		audio_sound_pitch(sound,pitch_change(random_range(-2,2)))
		
    },
    step: function() {
		vspd += mass * global.gravity;
		x += hspd;
		y += vspd;
		
		image_angle+= rot_rate;
		
		if (out_cam_bounds()) instance_destroy();
    },
    draw: function() {
      draw_self();
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
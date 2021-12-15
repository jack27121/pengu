/// @description
subimg = 0;
state = new SnowState("idle");
placed = false;

state.event_set_default_function("draw", function() {
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,white,1);
});

state.add("idle", {
	enter: function(){
		subimg = 0;	
	},
	step: function() {
		if (place_meeting(x,y,obj_player)){
			state.change("bounce");
			with(obj_player){
				hspd = lengthdir_x(other.force,other.image_angle+90);
				if(!other.grounded){
					vspd = lengthdir_y(other.force,other.image_angle+90);
					angle = other.image_angle;					
					state.change("launch");
					//y = round(other.y);
				} else {
					state.change("sliding");
					maxSlideDeltaSpd = hspd;
					while(!place_meeting(x, y+1, obj_collission)) {
						y += 1;
					}
					
				}
			}
		}
	},
});

state.add("bounce", {
    enter: function() {
		subimg = 1;
		var sound = audio_play_sound(snd_bounce_pad,0,false);
		audio_sound_pitch(sound,random_pitch());
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("idle");
		};
	},
	
	draw: function() {
		draw_sprite_ext(sprite_index,subimg,x,y,image_xscale,image_yscale,image_angle,white,1);
	}
});
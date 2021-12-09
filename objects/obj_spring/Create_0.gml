/// @description

subimg = 0;
force = 60;
state = new SnowState("idle");

state.event_set_default_function("draw", function() {
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,white,1);
});

state.add("idle", {
	step: function() {
		if (place_meeting(x,y,obj_player)){
			state.change("bounce");
			with(obj_player){
				state.change("launch");
				image_angle = other.image_angle+90;
				hspd = lengthdir_x(other.force,image_angle);
				vspd = lengthdir_y(other.force,image_angle);
			}
		}
	},
});

state.add("bounce", {
    enter: function() {
		subimg = 0;
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
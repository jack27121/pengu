/// @description

subimg = 0;
spr_idle = spr_win_pico_idle;
spr_turn = spr_win_pico_turn;
spr_end = spr_win_pico_end;

#region states
state = new SnowState("idle");

state.add("idle", {
    enter: function() {
		sprite_index = spr_idle;
		subimg = 0;
    }
});

state.add("turn", {
    enter: function() {
		sprite_index = spr_turn;
		subimg = 0;
		show_debug_message("im turning")
    },
	step: function() {
		if (animation_end(sprite_index,subimg)){
			state.change("end");
		}
	},
});

state.add("end", {
    enter: function() {
		sprite_index = spr_end;
		subimg = 0;
    }
});
#endregion
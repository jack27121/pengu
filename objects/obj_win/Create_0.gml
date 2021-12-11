/// @description

subimg = 0;
spr_idle = spr_win_pico_idle;
spr_turn = spr_win_pico_turn;
spr_end = spr_win_pico_end;
//medal = false;

win_string = "Found them!"

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
		
		//if (!medal) {
		//	medal = true;	
			
		show_debug_message("submit scores");
		if (room = rm_1_pico)		{ng_unlockmedal("Day 1"); ng_postScore("11149", global.timer)}
		if (room = rm_2_tankman)	{ng_unlockmedal("Day 2"); ng_postScore("11150", global.timer)}
		//}
    }
});
#endregion
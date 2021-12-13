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
		if (room == rm_1_pico)		{ ng_unlockmedal("Day 1"); ng_postScore("11149", global.new_score); }
		if (room == rm_2_tankman)	{ ng_unlockmedal("Day 2"); ng_postScore("11150", global.new_score); }
		if (room == rm_3_ena)		{ ng_unlockmedal("Day 3"); ng_postScore("11152", global.new_score); }
		if (room == rm_4_zone)		{ ng_unlockmedal("Day 4"); ng_postScore("11153", global.new_score); }
		if (room == rm_5_fnf)		{ ng_unlockmedal("Day 5"); ng_postScore("11154", global.new_score); }
		if (room == rm_6_fancypants){ ng_unlockmedal("Day 6"); ng_postScore("11155", global.new_score); }
		if (room == rm_7_mimes)		{ ng_unlockmedal("Day 7"); ng_postScore("11156", global.new_score); }
		if (room == rm_8_meatboy)	{ ng_unlockmedal("Day 8"); ng_postScore("11157", global.new_score); }
		if (room == rm_9_bees)		{ ng_unlockmedal("Day 9"); ng_postScore("11158", global.new_score); }
		//if (room == rm_10_ )		{ ng_unlockmedal("Day 10"); ng_postScore("11159", global.new_score); }
		//if (room == rm_11_ )		{ ng_unlockmedal("Day 11"); ng_postScore("11160", global.new_score); }
		//if (room == rm_11_ )		{ ng_unlockmedal("Day 12"); ng_postScore("11161", global.new_score); }
		
		//}
    }
});
#endregion
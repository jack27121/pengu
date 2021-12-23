/// @description

subimg = 0;
once = false;
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
		
		if global.bonuslevel = false
		{
			var new_score = (global.timer-global.cookietimer);
			show_debug_message("submit scores: "+string(new_score));
		
			if global.points >= 80 and global.medaltasty = false {ng_unlockmedal("Mmm, Tasty!"); global.medaltasty = true; show_debug_message("Mmm tasty");}
			if global.points = 0 and global.medalscuffed = false {ng_unlockmedal("Scuffed Up"); global.medalscuffed = true; show_debug_message("Scuffed Up");}
			if obj_player.slid = 0 and global.medalnoslide = false {ng_unlockmedal("Stomach Ache"); global.medalnoslide = true; show_debug_message("Stomach Ache");}
			if new_score <= 10000 and global.medalspeedrun = false {ng_unlockmedal("Flaming Flippers"); global.medalspeedrun = true; show_debug_message("Flaming Flippers");}
		
			if (room == rm_1_pico)		      { if global.medal1 = false {ng_unlockmedal("Day 1" ); global.medal1 = true; }  ng_postScore("11149", new_score);}
			if (room == rm_2_tankman)	      { if global.medal2 = false {ng_unlockmedal("Day 2" );  global.medal2 = true; }  ng_postScore("11150", new_score);}
			if (room == rm_3_ena)		      { if global.medal3 = false {ng_unlockmedal("Day 3" );  global.medal3 = true; }  ng_postScore("11152", new_score);}
			if (room == rm_4_zone)		      { if global.medal4 = false {ng_unlockmedal("Day 4" );  global.medal4 = true; }  ng_postScore("11153", new_score);}
			if (room == rm_5_fnf)		      { if global.medal5 = false {ng_unlockmedal("Day 5" );  global.medal5 = true; }  ng_postScore("11154", new_score);}
			if (room == rm_6_fancypants)      { if global.medal6 = false {ng_unlockmedal("Day 6" );  global.medal6 = true; }  ng_postScore("11155", new_score);}
			if (room == rm_7_mimes)		      { if global.medal7 = false {ng_unlockmedal("Day 7" );  global.medal7 = true; }  ng_postScore("11156", new_score);}
			if (room == rm_8_meatboy)	      { if global.medal8 = false {ng_unlockmedal("Day 8" );  global.medal8 = true; }  ng_postScore("11157", new_score);}
			if (room == rm_9_bees)		      { if global.medal9 = false {ng_unlockmedal("Day 9" );  global.medal9 = true; }  ng_postScore("11158", new_score);}
			if (room == rm_10_cordelia)	      { if global.medal10 = false {ng_unlockmedal("Day 10"); global.medal10 = true; } ng_postScore("11159", new_score);}
			if (room == rm_11_satina)		  { if global.medal11 = false {ng_unlockmedal("Day 11"); global.medal11 = true; } ng_postScore("11160", new_score);}
			if (room == rm_12_castlecrashers) { if global.medal12 = false {ng_unlockmedal("Day 12"); global.medal12 = true; } ng_postScore("11161", new_score);}
			if (room == rm_14_secret)         { ng_postScore("11182", new_score); }
		}
		else
		{
			if once = false
			{
				once = true
				var new_score = (global.timer-global.cookietimer);
				show_debug_message("BONUS LEVEL COMPLETED!!!!");
				show_debug_message("submit scores: " + string(new_score));
			
				if (room == rm_12_castlecrashers) { 
					ng_postScore("11180", new_score); 
					ng_unlockmedal("?");
				
					//BONUS LEVEL COMPLETE
					ini_open("savedata.ini");
					var last_time = ini_read_real(room_get_name(rm_13_bonuslevel),"beattime",-1);
					if(last_time == -1) last_time = 9999999999;
					var best_time = min(last_time , (new_score));
					show_debug_message(best_time);
					ini_write_real(room_get_name(rm_13_bonuslevel), "beattime", best_time);
					ini_close();
				}
			}
		}
    }
});
#endregion
/// @description
controlled = false;
unlocked_levels = 7; //this and every level before this number will be unlocked
global.playername = "User"; //DEFAULT USERNAME
alarm[0] = 120; // GIVE THE MEDAL A BIT OF TIME TO ENSURE LOGIN
ready = false;

if(!global.started) pandown = 720; //starts in the sky and pans down
else pandown = 0;

global.startotal = 0;
global.levelsbeaten = 0;
 
levels = [
	room_get_name(rm_1_pico),
	room_get_name(rm_2_tankman),
	room_get_name(rm_3_ena),
	room_get_name(rm_4_zone),
	room_get_name(rm_5_fnf),
	room_get_name(rm_6_fancypants),
	room_get_name(rm_7_mimes),
	room_get_name(rm_8_meatboy),
	room_get_name(rm_9_bees),
	room_get_name(rm_10_cordelia),
	room_get_name(rm_11_satina),
	room_get_name(rm_12_castlecrashers)
];

pictures = [
	spr_calendar_pico,
	spr_calendar_tankman,
	spr_calendar_ena,
	spr_calendar_zone,
	spr_calendar_fnf,
	spr_calendar_fancypants,
	spr_calendar_mimes,
	spr_calendar_meatboy,
	spr_calendar_drbees,
	spr_calendar_cordelia,
	spr_calendar_satina,
	spr_calendar_castlecrashers
];


beattime = [];
star = [];
ini_open("savedata.ini");
for (var i = 0; i < array_length(levels); ++i) {
	beattime[i] = ini_read_real(levels[i] ,"beattime",-1);
	star[i] = ini_read_real(levels[i],"star",0);
}
ini_close();
selected_viz = 0;

nr_cords = [
	[594,	144],
	[156,	242],
	[432,	78 ],
	[1005,	196],
	[1132,	301],
	[818,	177],
	[388,	308],
	[556,	429],
	[849,	270],
	[1028,	478],
	[728,	459],
	[286,	489]
];

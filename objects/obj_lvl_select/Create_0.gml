/// @description
controlled = true;
unlocked_levels = 1 //this and every level before this number will be unlocked
global.playername = "User"; //DEFAULT USERNAME
alarm[0] = 60; // GIVE THE MEDAL A BIT OF TIME TO ENSURE LOGIN

levels = [
	rm_1_pico,
	rm_2_tankman,
	rm_3_ena,
	rm_4_zone,
	rm_5_fnf,
	rm_6_fancypants,
	rm_7_mimes,
	rm_8_meatboy,
	rm_9_bees,
	"10",
	"11",
	"12"
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

beattime = [];
ini_open("savedata.ini");
for (var i = 0; i < array_length(levels); ++i) {
	beattime[i] = ini_read_real(levels[i],"beattime",-1);
}
selected_viz = 0;
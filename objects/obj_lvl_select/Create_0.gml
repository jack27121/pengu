/// @description
controlled = true;

levels = [
	rm_1_pico,
	rm_2_ena,
	rm_3_tankman,
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"10",
	"11",
	"12"
];

unlocked_levels = 3 //this and every level before this number will be unlocked

beattime = [];
ini_open("savedata.ini");
for (var i = 0; i < array_length(levels); ++i) {
	beattime[i] = ini_read_real(levels[i],"beattime",-1);
}

offset = 30;
selected = 0;
selected_viz = 0;

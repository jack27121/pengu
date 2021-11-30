/// @description
levels = [
	rm_1_pico,
	rm_2_tankman,
	"3",
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

beattime = [];
ini_open("savedata.ini");
for (var i = 0; i < array_length(levels); ++i) {
	beattime[i] = ini_read_real(levels[i],"beattime",-1);
}

offset = 120;
selected = 0;
selected_viz = 0;

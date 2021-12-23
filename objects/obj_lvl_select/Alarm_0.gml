/// @description GIVE MEDAL FOR PLAYING GAME
if global.medalplay = false {ng_unlockmedal("Winter Bash"); global.medalplay = true; show_debug_message("Winter Bash");}

//CHECK AND SEE IF ALL LEVELS ARE BEATEN
if global.medalall = false {if global.levelsbeaten = 12 {ng_unlockmedal("Lil Helper"); global.medalall = true; show_debug_message("Lil Helper");}}

//STAR MEDALS
if global.medal1star = false {if global.startotal > 0    {ng_unlockmedal("Superstar"); global.medal1star = true; show_debug_message("Superstar");}}
if global.medal3star = false {if global.startotal >= 3   {ng_unlockmedal("Shooting Star"); global.medal3star = true; show_debug_message("Shooting Star");}}
if global.medal6star = false {if global.startotal >= 6   {ng_unlockmedal("Outer Space"); global.medal6star = true; show_debug_message("Outer Space");}}
if global.medal9star = false {if global.startotal >= 9   {ng_unlockmedal("Solar System"); global.medal9star = true; show_debug_message("Solar System");}}
if global.medal12star = false {if global.startotal >= 12 {ng_unlockmedal("Universal Penguin"); global.medal12star = true; show_debug_message("Universal Penguin");}}

//GET PLAYER NAME
global.playername = ng_get_username();
if global.playername = "" {
	global.playername = "User";	
}

ready = true;
/// @description GIVE MEDAL FOR PLAYING GAME
ng_unlockmedal("Winter Bash");
global.playername = ng_get_username();

if global.playername = "" {
	global.playername = "User";	
}
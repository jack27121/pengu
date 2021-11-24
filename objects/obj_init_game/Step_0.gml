/// @desc restart
////restart
if (keyboard_check(ord("R")))
{
	//FMODGMS_Sys_Close();
	audio_stop_all();
	game_restart();
}

if global.counting = true {global.timer++;}
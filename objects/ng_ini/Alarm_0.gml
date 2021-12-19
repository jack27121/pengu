/// @description 

if num = 0 {
	ng_initialize_medals_and_scoreboard();
	num += 1;
	alarm[0] = 20;
}

if num = 1{
	ng_request_login();
	num += 1;
	instance_destroy();
}
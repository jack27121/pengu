/// @description 
if stage = 0 
{	
	rightpress = 1;
	timett = 20;
}
if stage = 1
{
	rightpress = 0;
	timett = 60;
}
if stage = 2
{
	uppress = 1;
	timett = 60;
	with(obj_win){
		state.change("turn");	
	}
}
if stage = 3
{
	uppress = 0;
	timett = 60;
}
if stage = 4
{
	downpress = 1;
	rightpress = 1;
	timett = 120;
}
if stage = 5
{
	global.hasseenend = true;
	ini_open("savedata.ini");
	ini_write_real("game","hasseenend",1);
	ini_close();
	
	instance_create_depth(0,0,0,obj_darkness);
	
	timett = 10*60;
}
if stage = 6
{
	start_fade_out(function(){
				room_goto(rm_lvl_select);
			})	
}

stage += 1;
alarm[0] = timett;
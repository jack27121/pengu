/// @description 
if os_browser == browser_not_a_browser or global.startotal = 12
{
	controlled = false;
	start_fade_out(function(){
		room_goto(rm_14_secret);
		//this runs before each level
		global.counting = true;
	})
}
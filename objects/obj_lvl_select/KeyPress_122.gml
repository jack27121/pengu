/// @description 
if os_browser == browser_not_a_browser
{
	controlled = false;
	start_fade_out(function(){
		room_goto(rm_8_meatboy);
		//this runs before each level
		global.counting = true;
	})
}
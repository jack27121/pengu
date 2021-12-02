///@function start_fade_out(callback)
///@params callback function to run after done 
///@description begins fading out, runs function, begins fading in
function start_fade_out(callback){
	var transition = instance_create_depth(x,y,0,obj_transition);
	transition.callback = callback;
	
	transition.begin_fade_out();
}
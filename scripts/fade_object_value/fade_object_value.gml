///@function fade_object_value(object,variable,value_start,value_end,duration)
///@param object id
///@param variable {string}
function fade_object_value(object,variable,start_value,end_value,duration){
	var fade = (instance_create_depth(x,y,0,obj_fade_object_value))
	fade.object = object;
	fade.variable = variable;
	fade.start_value = start_value;
	fade.end_value = end_value;
	fade.duration = duration;
}
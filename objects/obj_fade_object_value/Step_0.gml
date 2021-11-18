/// @description
var value = ease_linear(t++,start_value,end_value-start_value,duration);
variable_instance_set(object,variable,value);

if (t >= duration) instance_destroy();



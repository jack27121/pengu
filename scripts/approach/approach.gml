/// @function approach(current, target, amount)
/*
 * Example use:
 * x = approach(x, target_x, 2);
 */

function approach(argument0,argument1,argument2){

	var c = argument0;
	var t = argument1;
	var a = argument2;
	if (c < t){
	    c = min(c+a, t); 
	}else{
	    c = max(c-a, t);
	}
	return c;
}
/// @function rotate_vector(x,y,degrees)
/// @description rotates a vector, and returns an array. x[0] y[1]
function rotate_vector(x,y,degrees){
	var radians = degtorad(degrees);
	var x_ = x * cos(radians) - y * sin(radians);
	var y_ = x * sin(radians) + y * cos(radians);
	
	return {
		x : x_,
		y : y_
	}
}

/// @function round_n(num, n)
/// @param num 
/// @param n increment value 
/// @description rounds number to closest n increment
function round_n(num, n) {
    return round(num / n) * n;
}

/// @function abs_rot(rot)
/// @description keep rotation between 0 - 359
function abs_rot(rot) {
    if(rot >= 360) rot = rot-360;
	else if(rot < 0) rot = rot+360;
	return rot
}

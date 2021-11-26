/// @description
if(x != x_dest){
	x = ease_out(t,x_start,x_dest-x_start,duration);
}if(y != y_dest){
	y = ease_in_out(t,y_start,y_dest-y_start,duration);
}

if(x != x_dest || y != y_dest ) t++
else{ //reverses after reaching destination
	t = 0;
	x_dest = x_start;
	y_dest = y_start;
	x_start = x;
	y_start = y;
	
}
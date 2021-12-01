/// @description
if(x_ != x_dest){
	x_ = ease_in_out(t,x_start,x_dest-x_start,duration);
}if(y_ != y_dest){
	y_ = ease_in_out(t,y_start,y_dest-y_start,duration);
}

if(x_ != x_dest || y_ != y_dest ) t++
else{ //reverses after reaching destination
	t = 0;
	x_dest = x_start;
	y_dest = y_start;
	x_start = x_;
	y_start = y_;
}

x = round(x_);
y = round(y_);

show_debug_message("i run now: "+string(current_time));
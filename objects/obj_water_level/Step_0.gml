/// @description
if(y_ != y_dest){
	y_ = ease_in_out(t,y_start,y_dest-y_start,duration);
	t++

}else{ //reverses after reaching destination
	t = 0;
	y_dest = y_start;
	y_start = y_;
}
y = round(y_);

if(obj_player.y > y+16){
	hurtplayer();
}
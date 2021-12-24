/// @description
y_ = sinwave(y_start,y_dest,duration,0);

if(rise_ != rise_dest) rise_ = lerp(rise_,rise_dest,0.04);

y = round(y_+rise_);

if(obj_player.y > y+16){
	hurtplayer();
	//if(!obj_player.hurting) obj_player.vspd = -2;
}
/// @description
if(fading){
	x1 = ease_in(t++,start_,-start_,duration);
	
	if(x1 <= end_){
		fading = false;
		if(fade_out){ //done fading out
			callback();
			begin_fade_in();
		}
		else{ //done fading in
			instance_destroy();
		}
	}
}

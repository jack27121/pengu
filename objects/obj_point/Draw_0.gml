
	wavemod = x/200;
	
	if (speed == 0){
		//BOUNCE UP AND DOWN, HEHE
		ymod = lerp(ymod,sinwave(-5,5,1,wavemod),0.2);
		
		//WE USED lerp SO THAT THE COOKIE DOESNT INSTANTLY SNAP TO ITS OFFSET THE MOMENT IT STOPS BOUNCING
	}else{
		//STAY IN PLACE
		ymod = lerp(ymod,0,0.2);
	}
	
	if(fired && lifetime<=blinktime){ //if hurt it'll flash
		blinktime = lifetime / 1.5;
		image_alpha = 0;
	} else image_alpha = 1;
	
	draw_sprite_ext(sprite_index,image_index,x,y+ymod,image_xscale,image_yscale,sinwave(-10,10,1,wavemod),image_blend,image_alpha);

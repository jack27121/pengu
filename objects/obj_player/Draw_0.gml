/// @desc Draw player
if(hurting && floor(current_time/50) mod 2 == 0){ //if hurt it'll flash
	gpu_set_fog(true, gray,0,0);
}

state.draw();

gpu_set_fog(false, gray,0,0);

//draw_set_alpha(0.5);
//draw_sprite(spr_pengu_mask,0,x,y);
//
//var mask = 4;
//var line = floor(mask*2);
//draw_line(
//	x+(acos*mask)+(asin*mask),
//	y-(asin*mask)+(acos*mask),
//	x+(acos*mask)+(asin*line),
//	y-(asin*mask)+(acos*line));
//	
//draw_line(
//	x-(acos*mask)+(asin*mask),
//	y+(asin*mask)+(acos*mask),
//	x-(acos*mask)+(asin*line),
//	y+(asin*mask)+(acos*line));
//
//draw_set_alpha(1);


	
//draw_point(x,bbox_bottom);
	
	
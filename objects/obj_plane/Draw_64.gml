/// @description draws the plane
//Moves the plane to a destination
if (boxTime <= boxDuration)
{
	boxY = ease_in_out(boxTime++,boxStart,boxDest-boxStart,boxDuration)
}
else boxStart = boxDest;

//If arrows is true. The popup will have arrows
if (arrows) boxSprite = spr_plane_choice;	
else boxSprite = spr_plane	

//If popup is true. A popup will appear. Or disapear if false
if (popup)
{
	boxFrame = min(sprite_anim(boxFrameTime,15),sprite_get_number(boxSprite)-1);
	boxFrameTime++;
}
else if (boxFrame > 0)
{
	boxFrame = boxFrame - min(sprite_anim(boxFrameTime,6),sprite_get_number(boxSprite)-2);
	boxFrameTime++;
	
	if (boxFrame <= 0)
	{
		boxFrameTime = 1;
	}
}

//Draws the sprite
draw_set_color(black);
draw_rectangle(0,boxY+5,view_w,view_h,false);
draw_sprite(boxSprite,boxFrame,0,boxY);

//destorys the object
if (boxY == boxDest && kill) instance_destroy();
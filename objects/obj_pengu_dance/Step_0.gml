/// @description 
if instance_place(x,y,obj_wall)
{
	y -= 1;	
}

if !place_meeting(x,y+1,obj_wall)
{
	y += 1;	
}
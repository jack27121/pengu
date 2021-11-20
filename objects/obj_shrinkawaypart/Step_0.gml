image_xscale -= shrinkspd;
image_yscale -= shrinkspd;

if image_xscale < 0.025
{
	instance_destroy();	
}

if rotate = 1
{
	image_angle += 10;
}

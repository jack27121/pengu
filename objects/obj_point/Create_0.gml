shrink = 0;
spd = 0.01;
wavemod = 0;
fired = false;
lifetime = 2*room_speed;
blinktime = lifetime/1.5;

placed = false;
ymod = 0;
grounded = false;

hspd = 0;
vspd = 0;
grav = 0.2;

acos = 1;
asin = 0;
angle = 0;

var max_frames = sprite_get_number(sprite_index);
image_index = random_range(0,max_frames);

crumbs = function(){
	repeat(5) {
		var sap = instance_create_depth(x,y+sinwave(-5,5,1,wavemod),obj_player.depth-1,obj_shrinkawaypart);
		sap.image_index = image_index;
		sap.direction = random_range(90-30,90+30);
		sap.speed = random_range(2,3);
		sap.gravity = 0.25;
	}
}
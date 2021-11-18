/// @description
image_xscale = 0.5;
image_yscale = 0.5;
depth-=1 //sets it one z above

mass = 0.4;
vspd = 0;
hspd = 0;
rot = 0;

invincible = false;

#region step
global.clock.add_cycle_method(function(){
	//These functions will only take place as long as there isn't a textbox in progress
	if (!instance_exists(obj_dialogue))
	{	
		vspd += mass * global.gravity;
		
		collision(0.9,0.8); //Collissions
		rot-= hspd;
		
		//hurts enemy and entities
		var entity = instance_place(x,y,obj_dynamic);
		if(!invincible && entity!=noone && entity.object_index != obj_player){
			var ballSpd = point_distance(0,0,hspd,vspd);
			if (ballSpd > 5){			
				part_particles_create(global.particles,x,y,global.part_stars,12);
				
				var left = sign(x - entity.x); //makes ball bounce away from center of enemy
				hspd = left * max(3,abs(hspd)); //makes sure ball always goes away;
				vspd = -vspd;
				
				global.score+=ballSpd//adds damage to score
				draw_splashtext(x,y,ballSpd,white);
				hurt(entity,ballSpd,-hspd,-vspd);
			}
		}
	}
});
#endregion
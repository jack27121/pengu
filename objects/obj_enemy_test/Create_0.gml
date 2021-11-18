/// @description state machine
depth = 1;
hp = 25;
invincible = false;
hurting = false;

mass = 0.6;
hspd = 0;
vspd = 0;
grounded = false;
rot_rate = 0;

state = new SnowState("idle");

clock_alarm = 0;

state.event_set_default_function("step", function() {

});

state.event_set_default_function("draw", function() {
	draw_self();	
});

state.add("idle", {
    enter: function() {
      sprite_index = spr_enemy_test;
	  state_timer = global.clock.add_alarm(1500,function(){
	  	state.change("attack_charge");
	  });
    },
	leave: function() {
		state_timer.Cancel();	
	}
});

state.add("attack_charge", {
    enter: function() {
      sprite_index = spr_enemy_test_attack;
	  charge_hspd = 5*sign(obj_player.x-x); //launches into the air
	  //charge_vspd = -6;
	  
	  state_timer = global.clock.add_alarm(400,function(){
	  	state.change("attack");
	  });
    },
	
	leave: function() {
		state_timer.Cancel();	
	}
});

state.add("attack", {
    enter: function() {
      sprite_index = spr_enemy_test_attack;
	  hspd = charge_hspd;
	  vspd = -6;
	},
	
	step: function() {
		//hurts player
		if(place_meeting(x,y,obj_player)){
			hurt(obj_player,15,hspd,vspd);
		}
		if(round(hspd) == 0 && round(vspd) == 0)  state.change("idle");
	}
});

state.add("hurt", {
	enter: function(){
		screen_shake(5,10);
		hurting = true;
		state_timer = global.clock.add_alarm(500,function(){
			state.change("idle");
			hurting = false;
		});
	},
	
	leave: function() {
		state_timer.Cancel();	
	}
});

state.add("dying", {
    enter: function() {
		sprite_index = spr_enemy_test_die;
	  	hspd = 5*sign(hspd); //launches into the air
		vspd = -10;
		rot_rate = 8 * -sign(hspd);
		
		global.clock.add_alarm(2000,function(){
			instance_destroy();
		});
    },
    step: function() {
		vspd += mass * global.gravity;
		x += hspd;
		y += vspd;
		
		image_angle+= rot_rate;
    },
    draw: function() {
      draw_self();
    }
});

#region Time dilated step
global.clock.add_cycle_method(function()
{	
	state.step();
	//runs unless it's dying
	if(!state.state_is("dying")){		
		vspd += mass * global.gravity;
		hspd*=0.99
		
		collision();
	}
});
#endregion
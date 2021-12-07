/// @description

// Inherit the parent event
event_inherited();

hspd = 0;
hspd_max = 12;

t = 0;
mass = 0.5;
delay = 60;

#region states
state = new SnowState("idle");

state.event_set_default_function("draw", function() {
	draw_self();
});

state.add("idle", {
    enter: function() {
		hspd = 0;

    },
	step: function() {
		if place_meeting(x,y-5,obj_player) state.change("shake");
	},
});

state.add("shake", {
    enter: function() {
		delay = 45;
		t = 0;

    },
	step: function() {
		if(t >= delay) state.change("fall");
		t++;
	},
	
	draw: function() {
		var shake_x = random_range(-1,1);
		var shake_y = random_range(-1,1);
		draw_sprite(sprite_index,0,x+shake_x,y+shake_y);	
	}
});

state.add("fall", {
    enter: function() {
		t = 0;
		delay = 60*5;

    },
	step: function() {
		hspd+= mass;
		hspd = min(hspd,hspd_max);
		y+= hspd;
		
		if(t >= delay) state.change("reappear");
		t++;
	},
});

state.add("reappear", {
    enter: function() {
		x = xstart;
		y = ystart;
		t = 0;
		delay = 60;
    },
	step: function() {
		if(t >= delay) state.change("idle");
		t++;
	},
	draw: function(){
		draw_sprite_ext(sprite_index,0,x,y,1,1,0,white,(t/delay))
	}
});

#endregion
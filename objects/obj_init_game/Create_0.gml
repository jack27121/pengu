/// @description initilises game
randomize();
room_speed = 60;
gpu_set_blendenable(true);

//quitting
//i = 0;
//quit_speed = 0.5 * room_speed;
//fading = false;

#region macros
//#macro mousex device_mouse_x_to_gui(0)
//#macro mousey device_mouse_y_to_gui(0)

#macro depth_effects -200

//colors
#macro white c_white
#macro black c_black
#macro gray make_colour_rgb(204,204,204)
#macro darkgray make_colour_rgb(50,50,50)
#macro red make_colour_rgb(255,0,60)
#macro darkred make_colour_rgb(52,4,23)
#macro blue make_colour_rgb(30,130,240)
#macro green make_colour_rgb(0,255,0)
#macro pink make_colour_rgb(255,7,127)
#macro purple make_colour_rgb(200,0,255)
#macro cyan make_colour_rgb(0,235,255)
#macro yellow make_colour_rgb(255,210,0)
#macro orange make_colour_rgb(255,160,0)
#macro brown make_colour_rgb(205,136,21)
#endregion

#region global vars
global.gravity = 1;
global.timer = 0;
global.cookietimer = 0;
global.started = false;
global.hooked = 0;
global.star = 0;
global.startotal = 0;
global.levelsbeaten = 0;
global.deathcounter = 0;
global.gottenstar = 0;
global.bonuslevel = false;
global.bonustime = 0;


//MEDAL VARS
global.medalplay = false;
global.medal1 = false;
global.medal2 = false;
global.medal3 = false;
global.medal4 = false;
global.medal5 = false;
global.medal6 = false;
global.medal7 = false;
global.medal8 = false;
global.medal9 = false;
global.medal10 = false;
global.medal11 = false;
global.medal12 = false;
global.medalall = false; // all the levels beaten
global.medal1star = false;
global.medal3star = false;
global.medal6star = false;
global.medal9star = false;
global.medal12star = false;
global.medaltasty = false;
global.medalovo = false;
global.medalspeedrun = false;
global.medalmach10 = false;
global.medalscuffed = false;
global.medalnoslide = false;
global.medalsealsquash = false;
global.medalrealbird = false;
global.medalouch = false;

cseconds = 0;
cminutes = 0;
ctimer_text = 0;
seconds = 0;
minutes = 0;
timer_text = 0;
showing = false;

global.mute = false;
global.music = music_christmas;

//root note has to be G
#macro scale_pitches [-7,-5,-3,0,2,4,5,7,9,12];
global.scale_pitches_i = 0;

global.selected = 0; //for level select menu;


//layer_create(-100,"particles");
//global.particles = part_system_create_layer("particles", true);

//particle system
//global.part_stars = part_type_create();
//part_type_shape(global.part_stars,pt_shape_star);
//part_type_colour_hsv(global.part_stars, 0, 0, 0, 0, 255, 255);
//part_type_size(global.part_stars,0.4,0.4,-0.03,0);
//part_type_direction(global.part_stars,0,360,0,10);
//part_type_life(global.part_stars,20,30);
//part_type_speed(global.part_stars,2,2,0,2);
//part_type_alpha3(global.part_stars,1,1,0);
#endregion

#region points and timer
global.points = 0;
global.counting = true;
#endregion

#region shaders
application_surface_draw_enable(false);
#endregion

room_goto_next();
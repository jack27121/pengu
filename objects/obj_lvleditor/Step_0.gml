/// @description MOVE AND PLACE
x = mouse_x;
y = mouse_y;
move_snap(16,16);

if mouse_check_button_pressed(mb_middle) {audio_play_sound(snd_seal_hurt,10,false); obj_player.x = mouse_x; obj_player.y = mouse_y;}

if keyboard_check_pressed(ord("E")) {audio_play_sound(snd_seal_hurt,10,false); dir += 15};
if keyboard_check_pressed(ord("Q")) {audio_play_sound(snd_seal_hurt,10,false); dir -= 15};
if keyboard_check_pressed(vk_tab) {audio_play_sound(snd_seal_hurt,10,false); if xscale = 1 {xscale = -1;}else{xscale = 1;}};

if keyboard_check_pressed(ord("1"))    {tool = spr_point;                scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("2"))    {tool = spr_spikes;               scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("3"))    {tool = spr_wall;                 scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("4"))    {tool = spr_wall_icey;            scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("5"))    {tool = spr_wall_top;             scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("6"))    {tool = spr_wall_top_icey;        scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("7"))    {tool = spr_fall_platform;        scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("8"))    {tool = spr_fall_platform_icey;   scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("9"))    {tool = spr_spring;               scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(ord("0"))    {tool = spr_bounce_ball;          scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(vk_f1)       {tool = spr_wall_bump;            scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(vk_f2)       {tool = spr_wall_bump_icey;       scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(vk_f3)       {tool = spr_wall_diagonal;        scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(vk_f4)       {tool = spr_wall_diagonal_icey;   scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }
if keyboard_check_pressed(vk_f5)       {tool = spr_seal;                 scale = 1; dir = 0; xscale = 1; audio_play_sound(snd_pickup,10,false); }

if input_mouse_check_pressed(mb_left) {
	if tool = spr_point              {ob = instance_create_layer(x,y,"Instances",obj_point);}
	if tool = spr_spikes             {ob = instance_create_layer(x,y,"Instances",obj_spikes);}
	if tool = spr_wall               {ob = instance_create_layer(x,y,"Instances",obj_wall);}
	if tool = spr_wall_icey          {ob = instance_create_layer(x,y,"Instances",obj_wall_icey);}
	if tool = spr_wall_top           {ob = instance_create_layer(x,y,"Instances",obj_wall_top);}
	if tool = spr_wall_top_icey      {ob = instance_create_layer(x,y,"Instances",obj_wall_top_icey);}
	if tool = spr_fall_platform      {ob = instance_create_layer(x,y,"Instances",obj_falling_platform);}
	if tool = spr_fall_platform_icey {ob = instance_create_layer(x,y,"Instances",obj_falling_platform_icey);}
	if tool = spr_spring             {ob = instance_create_layer(x,y,"Instances",obj_spring);}
	if tool = spr_bounce_ball        {ob = instance_create_layer(x,y,"Instances",obj_bounce_ball);}
	if tool = spr_wall_bump          {ob = instance_create_layer(x,y,"Instances",obj_wall_diagonal);}
	if tool = spr_wall_bump_icey     {ob = instance_create_layer(x,y,"Instances",obj_wall_diagonal_icey);}
	if tool = spr_wall_diagonal      {ob = instance_create_layer(x,y,"Instances",obj_wall_slope);}
	if tool = spr_wall_diagonal_icey {ob = instance_create_layer(x,y,"Instances",obj_wall_slope_icey);}
	if tool = spr_seal               {ob = instance_create_layer(x,y,"Instances",obj_seal);}
	
	ob.image_xscale = scale*xscale;
	ob.image_yscale = scale;
	ob.image_angle = dir;
	ob.direction = dir;
	
	audio_play_sound(snd_pickup,10,false);
}

if input_mouse_check(mb_right) {
	if tool = spr_point                 {with(obj_point) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_spikes                {with(obj_spikes) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_wall                  {with(obj_wall) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_wall_icey             {with(obj_wall_icey) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_wall_top              {with(obj_wall_top) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_wall_top_icey         {with(obj_wall_top_icey) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_fall_platform         {with(obj_falling_platform) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_fall_platform_icey    {with(obj_falling_platform_icey) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_spring                {with(obj_spring) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_bounce_ball           {with(obj_bounce_ball) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_wall_bump             {with(obj_wall_diagonal) {if distance_to_object(obj_lvleditor) < 8 {instance_destroy(); audio_play_sound(snd_landing,10,false)}}} //TOO BIG AND TOO FAR FROM ORIGIN
	if tool = spr_wall_bump_icey        {with(obj_wall_diagonal_icey) {if distance_to_object(obj_lvleditor) < 8 {instance_destroy(); audio_play_sound(snd_landing,10,false)}}} //TOO BIG AND TOO FAR FROM ORIGIN
	if tool = spr_wall_diagonal         {with(obj_wall_slope) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_wall_diagonal_icey    {with(obj_wall_slope_icey) {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
	if tool = spr_seal                  {with(obj_seal)  {if instance_place(x,y,obj_lvleditor) {instance_destroy(); audio_play_sound(snd_landing,10,false)}}}
}
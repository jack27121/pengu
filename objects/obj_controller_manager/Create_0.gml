/// @description inputs and their bindings
//array_push(global.sacred_objects,self);

//direction macros
#macro dirRight 0
#macro dirUpRight 45
#macro dirUp 90
#macro dirUpLeft 135
#macro dirLeft 180
#macro dirDownLeft 225
#macro dirDown 270
#macro dirDownRight 315
vol = 1;
restart_time = 0;
escape_time = 0;
dataclear_time = 0;

//Declare an enum that stores verb names
enum eVerb
{
	//Move
	Left,
	Right,
	Up,
	Down,

	//buttons
	Jump,
	Escape,
	Restart
}

//Bind gamepad controls to verbs
input_default_gamepad_button(gp_padl, eVerb.Left, );
input_default_gamepad_button(gp_padr, eVerb.Right,);
input_default_gamepad_button(gp_padu, eVerb.Up,   );
input_default_gamepad_button(gp_padd, eVerb.Down, );

input_default_gamepad_button(gp_face1, eVerb.Jump, 0);
input_default_gamepad_button(gp_face2, eVerb.Jump, 1);
input_default_gamepad_button(gp_face3, eVerb.Jump, 2);
input_default_gamepad_button(gp_face4, eVerb.Jump, 3);

input_default_gamepad_button(gp_start, eVerb.Escape, 1);
input_default_gamepad_button(gp_select, eVerb.Restart, 1);

//Bind keyboard controls to verbs
input_default_key(vk_left , eVerb.Left);
input_default_key(vk_right, eVerb.Right);
input_default_key(vk_up	  , eVerb.Up);
input_default_key(vk_down , eVerb.Down);

input_default_key(ord("A"), eVerb.Left,1);
input_default_key(ord("D"), eVerb.Right,1);
input_default_key(ord("W"), eVerb.Up,1);
input_default_key(ord("S"), eVerb.Down,1);

input_default_key(vk_space , eVerb.Jump);
input_default_key(vk_enter , eVerb.Jump,1);

input_default_key(vk_escape, eVerb.Escape);
input_default_key(ord("R"), eVerb.Restart);

//input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
input_player_source_set(INPUT_SOURCE.GAMEPAD);
input_player_gamepad_set(0)


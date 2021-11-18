/// @description inputs and their bindings

//direction macros
#macro dirRight 0
#macro dirUpRight 45
#macro dirUp 90
#macro dirUpLeft 135
#macro dirLeft 180
#macro dirDownLeft 225
#macro dirDown 270
#macro dirDownRight 315

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
	Escape
}

//Bind gamepad controls to verbs
input_default_gamepad_axis(gp_axislh, true,	 eVerb.Left);
input_default_gamepad_axis(gp_axislh, false, eVerb.Right);
input_default_gamepad_axis(gp_axislv, true,  eVerb.Up);
input_default_gamepad_axis(gp_axislv, false, eVerb.Down);


input_default_gamepad_button(gp_padl, eVerb.Left,1);
input_default_gamepad_button(gp_padr, eVerb.Right,1);
input_default_gamepad_button(gp_padu, eVerb.Up,1);
input_default_gamepad_button(gp_padd, eVerb.Down,1);

input_default_gamepad_button(gp_face3, eVerb.Jump, 1);
input_default_gamepad_button(gp_face2, eVerb.Jump, 1);
input_default_gamepad_button(gp_face4, eVerb.Jump, 1);
input_default_gamepad_button(gp_face1, eVerb.Jump, 1);

input_default_gamepad_button(gp_select, eVerb.Escape, 1);

//Bind keyboard controls to verbs
input_default_key(vk_left , eVerb.Left);
input_default_key(vk_right, eVerb.Right);
input_default_key(vk_up	  , eVerb.Up);
input_default_key(vk_down , eVerb.Down);

input_default_key(ord("A"), eVerb.Left);
input_default_key(ord("D"), eVerb.Right);
input_default_key(ord("W"), eVerb.Up);
input_default_key(ord("S"), eVerb.Down);

input_default_key(vk_space, eVerb.Jump);
input_default_key(vk_escape, eVerb.Escape);

//input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
input_player_source_set(INPUT_SOURCE.GAMEPAD);
input_player_gamepad_set(0)


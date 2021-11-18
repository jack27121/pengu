/// @desc get_input()
function get_input() {

	//If key is held down

		//Direction keys
		global.rKey = max(keyboard_check(vk_right), keyboard_check(ord("D")));
		global.lKey = max(keyboard_check(vk_left), keyboard_check(ord("A")));
		global.uKey = max(keyboard_check(vk_up), keyboard_check(ord("W")));
		global.dKey = max(keyboard_check(vk_down), keyboard_check(ord("S")));

		//Interact keys
		global.xKey = max(keyboard_check(ord("X")),keyboard_check(vk_enter),keyboard_check(vk_space));
	
		//Shift
		global.shiftKey = max(keyboard_check(vk_shift), keyboard_check(ord("Z")))
	
	
	//If key is pressed

		//Direction keys
		global.rKeyPressed = max(keyboard_check_pressed(vk_right), keyboard_check_pressed(ord("D")));
		global.lKeyPressed = max(keyboard_check_pressed(vk_left), keyboard_check_pressed(ord("A")));
		global.uKeyPressed = max(keyboard_check_pressed(vk_up), keyboard_check_pressed(ord("W")));
		global.dKeyPressed = max(keyboard_check_pressed(vk_down), keyboard_check_pressed(ord("S")));
	
		//Interact keys
		global.xKeyPressed = max(keyboard_check_pressed(ord("X")),keyboard_check_pressed(vk_enter),keyboard_check_pressed(vk_space));
	
		//Shift
		global.shiftKeyPressed = max(keyboard_check_pressed(vk_shift),keyboard_check_pressed(ord("Z")));
		
		//Tab
		global.tabKeyPressed = keyboard_check_pressed(vk_tab);
	//If key is released

		//Direction keys
		global.rKeyReleased = max(keyboard_check_released(vk_right), keyboard_check_released(ord("D")));
		global.lKeyReleased = max(keyboard_check_released(vk_left), keyboard_check_released(ord("A")));
		global.uKeyReleased = max(keyboard_check_released(vk_up), keyboard_check_released(ord("W")));
		global.dKeyReleased = max(keyboard_check_released(vk_down), keyboard_check_released(ord("S")));

		//Interact keys
		global.xKeyReleased = max(keyboard_check_released(ord("X")),keyboard_check_released(vk_enter),keyboard_check_released(vk_space));

		//Shift
		global.shiftKeyReleased = keyboard_check_released(vk_shift);

	//Mouse 3D movement
		//static mouse_x_def = display_get_width()/2
		//static mouse_y_def = display_get_height()/2
		//global.xMouse = display_mouse_get_x() - mouse_x_def;
		//global.yMouse = display_mouse_get_y() - mouse_y_def;
		//display_mouse_set(mouse_x_def,mouse_y_def);

}

#macro INPUT_MAX_PLAYERS             1      //Maximum number of players that the game supports
#macro INPUT_MAX_ALTERNATE_BINDINGS  2      //Maximum number of alternate bindings per verb per input source
#macro INPUT_DEFAULT_MIN_THRESHOLD   0.7    //Default minimum threshold for gamepad axes. This value is used for detecting gamepad input in input_hotswap_tick() so make sure you set it above 0.0
#macro INPUT_DEFAULT_MAX_THRESHOLD   1.0    //Default maximum threshold for gamepad axes
#macro INPUT_2D_CLAMP                true   //Whether to clamp 2D input to a maximum distance of 1 unit (affects input_x(), input_y(), input_xy(), input_direction(), and input_distance())

#macro INPUT_TIMER_MILLISECONDS       false  //Set to true to use milliseconds instead of frames for input_check_*() functions
#macro INPUT_REPEAT_DEFAULT_DELAY     10     //Default time between input_check_repeat() returning <true>
#macro INPUT_REPEAT_DEFAULT_PREDELAY  10     //Default time between a verb being activated and the first time input_check_repeat() returns <true>
#macro INPUT_DOUBLE_DELAY             12     //Delay between key presses for it to register as a double press. Whether this is in frames or milliseconds is controlled by INPUT_TIMER_MILLISECONDS
#macro INPUT_HISTORY_LENGTH           20     //Maximum number of verb events to record. Each event is a struct containing the time, verb name, and verb value

#macro INPUT_HOTSWAP_DELAY              33     //Number of milliseconds between source swaps. This should be longer than a single frame (>17 ms at 60FPS)
#macro INPUT_HOTSWAP_ON_GAMEPAD_AXIS    true   //Whether to trigger a hotswap when a gamepad axis is moved
#macro INPUT_HOTSWAP_ON_MOUSE_MOVEMENT  true   //Whether to trigger a hotswap when the mouse is moved
#macro INPUT_MOUSE_MODE                 0      //0 = view-space, 1 = GUI-space, 2 = device-space
#macro INPUT_MOUSE_MOVE_DEADZONE        2      //Size of the deadzone for detecting mouse movement, measured in pixels

#macro INPUT_SDL2_REMAPPING       true   //Whether to use our own SDL2 database to remap controllers
#macro INPUT_SDL2_ALLOW_EXTERNAL  true   //Whether to allow external SDL2 database loading from environment variable %SDL_GAMECONTROLLERCONFIG%
#macro INPUT_SDL2_ALLOW_GUIDE     false  //Whether to allow use of SDL2's "guide" binding, accessed using the gp_guide macro. This generally only works with DInput controllers
#macro INPUT_SDL2_ALLOW_MISC1     false  //Whether to allow use of SDL2's "misc1" binding, accessed using the gp_misc1 macro. What this maps to varies from controller to controller

#macro INPUT_ANDROID_KEYBOARD_ALLOWED  false   //Whether to allow (problematic) keyboard input on Android platform
#macro INPUT_SWITCH_KEYBOARD_ALLOWED   false   //Whether to allow keyboard input on Switch platform

#macro INPUT_SWITCH_HORIZONTAL_HOLDTYPE  true  //Whether the game uses the horizontal holdtype for single Joy-Cons. Set this to <false> for vertical holdtype. Input treats these two modes as mutually exclusive (come talk to us if you need to be able to swap at runtime)

#macro INPUT_BINDING_SCAN_TIMEOUT  10000  //Time (in milliseconds) to wait for a new binding before automatically cancelling the binding scan

//The following macro controls default key filtering behaviour on platforms supporting keyboard
//Expected values are:
//  0 = Don't ignore any keys
//  1 = Ignore select nonfunctional keys:
//      - Alt/Options (Mac)
//      - Windows/Command (Mac)
//      - PrintSc on iOS/tvOS
//      - Caps lock in browser on Apple platforms
//      - F10 in browser on Apple platforms
//      - F11 in browser on other platforms
//      - Vendor-reserved (0xFF)
//  2 = Ignore all above keys, and reserved and/or system keys:
//      - Num lock & Scroll lock
//      - IME keys (0x15 - 0x1A, 0xE5)
//      - Browser keys (0xA6 - 0xAC)
//      - Media keys (0xAD - 0xB7)
//You can modify this list at any time by calling input_ignore_key_add() or input_ignore_key_remove()
//This setting only affects Input and will not filter these keys from native GameMaker functions
#macro INPUT_IGNORE_RESERVED_KEYS_LEVEL  2

#macro INPUT_SDL2_DATABASE_PATH    "sdl2.txt"                //Path to the SDL2 database to read gamepad remapping definitions from
#macro INPUT_CONTROLLER_TYPE_PATH  "controllertypes.csv"     //Path to the controller type database to read gamepad types from
#macro INPUT_BLACKLIST_PATH        "controllerblacklist.csv" //Path to the controller blacklist database to read from





#region Forbidden Fruit

#macro INPUT_EXTERNAL_DEBUG_LOG  false  //Do NOT set to <true> unless directed (!)
#macro INPUT_WARNING_DEPRECATED  true   //Whether to show errors when using deprecated functions

#endregion
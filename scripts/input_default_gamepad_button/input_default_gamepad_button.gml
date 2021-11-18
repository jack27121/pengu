/// @param button
/// @param verb
/// @param [alternate]

function input_default_gamepad_button(_button, _verb, _alternate = 0)
{
    if (__INPUT_DEBUG) __input_trace("Setting default gamepad button binding...");
    if (!INPUT_SDL2_ALLOW_GUIDE && (_button == gp_guide)) __input_error("gp_guide not permitted\nSet INPUT_SDL2_ALLOW_GUIDE to <true> to allow gp_guide");
    if (!INPUT_SDL2_ALLOW_MISC1 && (_button == gp_misc1)) __input_error("gp_misc1 not permitted\nSet INPUT_SDL2_ALLOW_MISC1 to <true> to allow gp_misc1");
    
    global.__input_gamepad_valid = true;
    
    if (global.__input_swap_ab)
    {
        if (_button == gp_face1)
        {
            _button = gp_face2;
            __input_trace("Default binding for \"", _verb, "\" swapped from A/O to B/X");
        }
        else if (_button == gp_face2)
        {
            _button = gp_face1;
            __input_trace("Default binding for \"", _verb, "\" swapped from B/X to A/O");
        }
    }
    
    //FIXME - Despite this class being implemented as a fluent interface, GMS2.3.3 has bugs when returning <self> on certain platforms
    var _binding = new __input_class_binding();
    _binding.set_gamepad_button(_button);
    
    global.__input_default_player.set_binding(INPUT_SOURCE.GAMEPAD, _verb, _alternate, _binding);
    
    var _p = 0;
    repeat(INPUT_MAX_PLAYERS)
    {
        //FIXME - Despite this class being implemented as a fluent interface, GMS2.3.3 has bugs when returning <self> on certain platforms
        var _binding = new __input_class_binding();
        _binding.set_gamepad_button(_button);
        
        global.__input_players[_p].set_binding(INPUT_SOURCE.GAMEPAD, _verb, _alternate, _binding);
        ++_p;
    }
}
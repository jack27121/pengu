/// @function getArmInputsPressed()
/// @description returns wether an arm input was just pressed
//function getArmInputsPressed(){
//	with(obj_controller_manager){
//		if (input_check_p(comboInputs)){// || (input_check_r(armArray) && input_check(armArray))){
//			return true;		
//		} else return false
//	}
//}

/// @function getComboInputs()
/// @description returns combo inputs, that was just executed or undefined if it's empty
function getComboInputs(){
	with(obj_controller_manager){
		if(array_length(comboArray) != 0 && pressed) return comboArray;
		else return undefined;
	}
}

/// @function checkCombo(combo)
/// @param combo  to compare against
/// @description checks if given combo was completed
function checkCombo(combo){
	if(array_length(combo) == 0) return true;
	
	var inputs = getComboInputs();
	if (inputs != undefined){
		var combo_length = array_length(combo)
		if(combo_length <= array_length(inputs)){//checks if inputs is long enough to even encompass the combo
			for (var i = 0; i < combo_length; ++i) {
			    if(combo[combo_length-1-i] != inputs[i]) return false
			} //if it matches with all it will return true
			return true
		}
	}
	return false
}

/// @function flipCombo(combo)
/// @param combo to flip
/// @description flips given combo
function flipCombo(combo){
	var combo_length = array_length(combo)
	for (var i = 0; i < combo_length; ++i) {
	    switch (combo[i]) {
		    case dirDownLeft:
		        combo[i] = dirDownRight;
		        break;
			case dirLeft:
		        combo[i] = dirRight;
		        break;
			case dirUpLeft:
		        combo[i] = dirUpRight;
		        break;
			case dirDownRight:
		        combo[i] = dirDownLeft;
		        break;
			case dirRight:
		        combo[i] = dirLeft;
		        break;
			case dirUpRight:
		        combo[i] = dirUpLeft;
		        break;
		}
	}
	return combo;
}

/// @function flipableCombo(combo)
/// @param combo to check
/// @description checks if combo can be flipped
function flipableCombo(combo){
	var combo_length = array_length(combo)
	for (var i = 0; i < combo_length; ++i) {
	    switch (combo[i]) {
		    case dirDownLeft:
			case dirLeft:
			case dirUpLeft:
			case dirDownRight:
			case dirRight:
			case dirUpRight:
			return true;
		}
	}
	return false;
}
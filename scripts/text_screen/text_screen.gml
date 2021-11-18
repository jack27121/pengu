///@func text_box(array, array)
///@desc 
function text_screen() {
	var input = argument[0];

	var output = instance_create_layer(0,0,"Instances",obj_narrator);
	output.font[@ 0] = ""

	for (i = 0; i < array_length_1d(input); i++) {
	//Font indicator
		if string_pos("#f_",input[@ i]) != 0 {
			//Font_indicator position
			var font_start = string_pos("#f_",input[@ i]);
			//Counts the characters from after font_start to the next space
			var font_end = string_pos("#",string_copy(input[@ i],font_start+1,  string_width(input[@ i])-(font_start+1)));
		
			//Copies the font name, and makes sure to leave out indicator and space seperator
			output.font[@ i] = string_copy(input[@ i],font_start+1,font_end-1);
		}
		//If there's no indicator to be found, the textbox will re-use the previously chosen one.
		else if (i > 0) output.font[@ i] = output.font[@ i-1];
		//If there is no indicator to be found, and it's the first message, it'll default to this
		else output.font[@ i] = "f_standard_big";
	//Nosound indicator. self-explanatory. (if used the sound indicator won't do anything)
		if string_pos("#nosound#", input[@ i]) != 0 {
			output.sound[@ i] = "nosound";
		}
		
	//Sound indicator. (The sound to play when letters are typed)
		else {
			if string_pos("#sound_", input[@ i]) != 0 {
				//sound_indicator position
				var sound_start = string_pos("#sound_",input[@ i])+7;
				//Counts the characters from after sound_start to the next #
				var sound_end = string_pos("#",string_copy(input[@ i],sound_start,  string_width(input[@ i])-(sound_start)));
			
				var sound_string = string_copy(input[@ i],sound_start,sound_end-1);
			
				//If the sound indicator ends in _playonce the sound will simply play once
				//Good for a dog making a bark noise or similar.
				if(string_pos("_playonce",sound_string)) {
					output.soundLoop[@ i] = false;		
					sound_string = string_replace(sound_string,"_playonce","");
				}
				else output.soundLoop[@ i] = true;	
			
				//Copies the soundname, and makes sure to leave out indicator
				output.sound[@ i] = asset_get_index(sound_string);
			} else {
				output.sound[@ i] = snd_typewriter;
				output.soundLoop[@ i] = true;
			}
		}

	//Choice indicator. Starts a choice prompt in the box. (If used, none of the following indicators will have effect)
		if string_pos("#choice",input[@ i]) !=0 {
			//Makes a copy of the text to mess with
			var text = input[@ i];
		
			var choices = [];
		
			var ii_count =  string_count("#choice",text);
		
			for (ii = 0; ii < ii_count; ii++ ) {
				//choice indicator position
				var choice_start = string_pos("#choice",text);
			
				//removes the initial #choice text from the string
				text = string_replace(text,"#choice_","");
			
			//finds the goto number	
				var seperator = string_pos(";",text)-choice_start;
			
				var goto = string_copy(text,choice_start,seperator);
			
				text = string_delete(text,choice_start,seperator+1);
			
			//finds the script to execute
				var seperator = string_pos(";",text)-choice_start;
			
				var script_name = string_copy(text,choice_start,seperator);
			
				text = string_delete(text,choice_start,seperator+1);
		
			//finds the choice text
				var seperator = string_pos("#",text)-choice_start;
		
				var choice_text = string_copy(text,choice_start,seperator);
			
				text = string_delete(text,choice_start,seperator+1);
			
			//assigns the choice variables to choices array			
				choices[ii, 0] = real(goto);
				choices[ii, 1] = script_name;
				choices[ii, 2] = choice_text;
			}			
		//message_indicator position
			var question_start = string_pos(";",text);
		//Counts the characters from the start to the end
			var question_end = string_length(text) - question_start;
		
			output.question[@ i] = true;	
			output.message[@ i] = string_copy(text,question_start+1,question_end);
			output.choices[@ i] = choices;
		
			output.autoskip[@ i] = false;
		
		}
		else {
			output.question[@ i] = false;
			output.choices[@ i] = "";
	
	//Autoskip indicator. (Skips message automaticly and types it faster)
			if string_pos("#autoskip#",input[@ i]) != 0 {
				output.autoskip[@ i] = true;
			}
			//If there's no indicator to be found, Autoskip will be set to false.
			else output.autoskip[@ i] = false;
	//Message Indicator
			if string_pos(";",input[@ i]) != 0 {
				//message_indicator position
				var message_start = string_pos(";",input[@ i]);
				//Counts the characters from the start to the end
				var message_end = string_length(input[@ i]) - message_start;
				//Copies the message
				output.message[@ i] = string_copy(input[@ i],message_start+1,message_end);
			}
			//If there's no indicator to be found, the message will be blank.
			else output.message[@ i] = "";
	
	//Goto Indicator (goes to the stated message after the current message is completed)
			if string_pos("#goto_", input[@ i]) != 0 {
				//goto_indicator position
				var goto_start = string_pos("#goto_",input[@ i])+1;
				//Counts the characters from after goto_start to the next #
				var goto_end = string_pos("#",string_copy(input[@ i],goto_start,  string_width(input[@ i])-(goto_start)));
			
				//Copies the goto number, and makes sure to leave out indicator and #
				var goto_number = string_digits(string_copy(input[@ i],goto_start,goto_end-1))
				output.goto[@ i] = real(goto_number);
			}
			//if there is no indicator to be found, it will simply go to the following message when done
			else output.goto[@ i] = -1;
	
	//Execute indicator (executes the stated function after this message )
			if string_pos("#execute_",input[@ i]) != 0 {
				//goto_indicator position
				var execute_start = string_pos("#execute_",input[@ i])+9;
				//Counts the characters from after goto_start to the next #
				var execute_end = string_pos("#",string_copy(input[@ i],execute_start,  string_width(input[@ i])-(execute_start)));
			
				//Copies the goto number, and makes sure to leave out indicator and #
				output.execute[@ i] = string_copy(input[@ i],execute_start,execute_end-1);
			}
			//if there is no indicator to be found, it will simply go to the following message when done
			else output.execute[@ i] = false;
		
	//Close indicator. (Close the dialouge after this message)
			if string_pos("#close#",input[@ i]) != 0 {
				output.close[@ i] = true;
			}
			//If there's no indicator to be found, close will be set to false.
			else output.close[@ i] = false;
		}
	}






}

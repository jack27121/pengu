t++;

//When the message is done writing. A tiny popup,
//will appear reminding that you can skip to the next page (unless autoskip is on)
if (!autoskip[@ message_current])
{
	if (i >= string_length(message[@ message_current]))
	{	
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_middle);
		draw_set_color(white);
		draw_set_alpha(0.2);
		draw_set_font(f_action_man_tiny);
		draw_text(view_w/2,view_h,"Press (X) to continue");
	}
}
draw_set_alpha(1);

//How many messages are in the array
message_end = array_length_1d(message);


//variables
var charWidth = 0;
var lineHeight = 0;
var lineShift = 0;
var lineEnd = view_w - 20;
var modifierShaky = false;
var modifierWavey = false;
var modifierColor = false;
var modifierDelay = false;
var modifierTiny = false;
var modifierBig = false;
var modifierBreak = false;

//Typewriter
if (cutoff < string_length(message[@ message_current]))
{
	if (timer >= delay)
	{
		cutoff += cutoffSpeed;
		timer = 0;
	}
	else timer++;	
}

//Sound
if(sound[@ message_current] != "nosound"){
	if (!audio_is_playing(sound[@ message_current]) && !done && !soundLoopI){
		audio_play_sound(sound[@ message_current],1,soundLoop[@ message_current]);
		if (!soundLoop[@ message_current]) soundLoopI = true;
	}
	
	if ((cutoff >= string_length(message[@ message_current]) && soundLoop[@ message_current]) || delay > 10)
	{
		if audio_is_playing(sound[@ message_current]) {
			audio_stop_sound(sound[@ message_current]);
		}
		if (!soundLoop[@ message_current]) soundLoopI = false;
	}
}
	
//Next message
if ((global.xKeyPressed && !done) || autoskip[@ message_current] || choiceDone)
{
	//If autoskip is enabled the messages go through faster
	if (autoskip[@ message_current])
	{
		//delay = 1;
	}
	else
	{
	delay = 0;
	cutoffSpeed = 5;
	}
	if ((i >= string_length(message[@ message_current]) && !question[@ message_current]) || choiceDone)
	{
		choiceDone = false;
		if ((message_current < message_end-1) && !close[@ message_current])
		{
			lineOffset = 0;
			delay = initialDelay;
			
			if(execute[@ message_current] != false)
			{
				script_execute(asset_get_index(execute[@ message_current]));
			}
			
			//also stops the sound if autoskip is used
			if (sound[@ message_current] != "nosound" && audio_is_playing(sound[@ message_current])) {
				audio_stop_sound(sound[@ message_current]);
			}
			
			//The next message is indicated by the goto indicator if it's used.
			//Else it will simply be the following message
			if (goto[@ message_current] != -1){
				message_current = goto[@ message_current];
			}
			else{
				message_current++;
			}
			
			cutoff = 0;
			cutoffSpeed = 1;

		}
		//Removes everythin'
		else
		{
			done = true;
			
			delay = initialDelay;
			cutoff = 0;
		}
	}
}

i = 1;

//Draw text
while(i <= string_length (message[@ message_current]) && i <= cutoff && done == false)
{
	
	//check for modifier
	while (string_char_at(message[@ message_current], i) == "/" && i <= string_length (message[@ message_current]))
	{
		
		var modifier = string_char_at(message[@ message_current], ++i);
		i++;
		
		switch (modifier)
		{
			//toggles color modifier on/off and saves the color name in a string
			case "c":
			{
				if (modifierColor == false)
				{
					var textColor = ""
					modifierColor = true;
					
					while(string_char_at(message[@ message_current], i+1) != ")")
					{
						textColor = string_insert(string_char_at(message[@ message_current],i),textColor,i++)
					}
					i+=2;
					break;
				}
				else
				{
					modifierColor = false;
					break;
				}
			}
			
			//toggles delay modifier on/off and saves the delay number
			case "d":
			{
				if (modifierDelay == false)
				{
					var textDelay = ""
					modifierDelay = true;
					
					while(string_char_at(message[@ message_current], i+1) != ")")
					{
						textDelay = string_insert(string_char_at(message[@ message_current],i),textDelay,i++);
					}
					i+=2;
					break;
				}
				else
				{
					modifierDelay = false;
					break;
				}
			}
			
			//toggles Shaky modifier on/off
			case "s": if (modifierShaky == false) modifierShaky = true; else modifierShaky = false; break;
			
			//toggles Wavey modifier on/off
			case "w": if (modifierWavey == false) modifierWavey = true; else modifierWavey = false; break;
			
			//toggles Tinny modifier on/off
			case "t": if (modifierTiny == false) modifierTiny = true; else modifierTiny = false; break;
			
			//toggles Big modifier on/off
			case "b": if (modifierBig == false) modifierBig = true; else modifierBig = false; break;
			
			//Break modifier
			case "/": modifierBreak = true; break;
		}		
	}
	//With all the modifiers, we make sure cutoff, can keep up
	cutoff = max(cutoff, i);
	
	//Shaky modifier
	if (modifierShaky == true)
	{
		var shakeX = random_range(-1,1);
		var shakeY = random_range(-1,1);
	}
	else
	{
		var shakeX = 0;
		var shakeY = 0;
	}
	
	//Wavey modifier
	if (modifierWavey == true)
	{
		var so = (t + i);
		var shift = sin((so*pi*freq)/room_speed)*amplitude;
	}
	else
	{
		var shift = 0;
	}
	
	//Tiny/Big modifier
	if (modifierTiny == true)
	{
		draw_set_font(asset_get_index(font[@ message_current] + "_tiny"));
	}
	else if (modifierBig == true)
	{
		draw_set_font(asset_get_index(font[@ message_current] + "_big"));
	}
	else
	{
		draw_set_font(asset_get_index(font[@ message_current]));
	}
	
	
	//Color modifier
	if (modifierColor)
	{
		switch textColor
		{	
			case "red": draw_set_colour(red); break;
			case "blue": draw_set_colour(blue); break;
			case "green": draw_set_colour(green); break;
			case "pink": draw_set_colour(pink); break;
			case "purple": draw_set_colour(purple); break;
			case "cyan": draw_set_colour(cyan); break;
			case "yellow": draw_set_colour(yellow); break;
			case "orange": draw_set_colour(orange); break;
			
			case "rainbow":
			{
				var hue = ((((t+i)*255)/room_speed)*0.5)%255;
				rainbowColor = make_color_hsv(hue,255,255);
				draw_set_colour(rainbowColor); break;
			}
		}
	}
	else
	{
		draw_set_colour(white);
	}
	if (modifierDelay){
		delay = int64(textDelay); 	
	} else delay = initialDelay;
	
	//Go to next line
	var length = 0;
	var wordWidth = 0;

	//Reads the width of the current word
	while (string_char_at(message[@ message_current], i) != " " && i <= string_length(message[@ message_current]))
	{
		wordWidth += string_width(string_char_at(message[@ message_current], i));
		i++;
		length++;
	}
	//This sets i back. to before it checked the remainder of the word
	i -= length;
	

	//if the current word exedes the lineEnd we go to a new line
	if (wordWidth+charWidth > lineEnd || modifierBreak == true){
		charWidth = 0;
		lineHeight += lineShift + 5;
		lineShift = 0;
		modifierBreak = false;
		if(lineOffset*2 < lineHeight) lineOffset+= lineShift/2 + 2.5;
	}
	wordWidth = 0;

	//Text
	//draws the actual text
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	//text position
	var tY = view_h / 2;
	var tX = 10;
	
	//if it's a choice sequence the question will be drawn in the top middle
	if (question[@ message_current]){
		tX = (view_w / 2) - (string_width(message[@ message_current]) / 2);
		tY = (view_h - 110);
	}
	
	draw_text(	(tX + charWidth + shakeX) , (tY + lineHeight + shift + shakeY - lineOffset) , string_char_at(message[@ message_current], i));
		
	//Checks all the letters on the current line, and saves the biggest character as the line height. So the next line will be placed perfectly under it.
	lineShift = max(lineShift,string_height(string_char_at(message[@ message_current], i)));
	
	charWidth += string_width(string_char_at(message[@ message_current], i++));
}

//Choices text
if(question[@ message_current] && cutoff >= string_length(message[@ message_current]))
{
	var choice = choices[@ message_current]
	
	if(global.lKeyPressed) {
		choiceXY[@ 0,2] = true;
		choiceXY[@ 1,2] = false;
		choiceXY[@ 2,2] = false;
		choiceXY[@ 3,2] = false;
			
		audio_play_sound(vo_none,1,false);
	}
	if(global.rKeyPressed) {
		choiceXY[@ 0,2] = false;
		choiceXY[@ 1,2] = true;
		choiceXY[@ 2,2] = false;
		choiceXY[@ 3,2] = false;
		
		audio_play_sound(vo_none,1,false);
	}
	if(global.uKeyPressed) {
		choiceXY[@ 0,2] = false;
		choiceXY[@ 1,2] = false;
		choiceXY[@ 2,2] = true;
		choiceXY[@ 3,2] = false;
		
		audio_play_sound(vo_none,1,false);
	}
	if(global.dKeyPressed) {
		choiceXY[@ 0,2] = false;
		choiceXY[@ 1,2] = false;
		choiceXY[@ 2,2] = false;
		choiceXY[@ 3,2] = true;
		
		audio_play_sound(vo_none,1,false);
	}
	
	var choice = choices[@ message_current];
	
	if(global.xKeyPressed) {
		if (choiceXY[@ 0,2]) {
			goto[@ message_current] = choice[@ 0,0];
			choiceDone = true;
			audio_play_sound(vo_none,1000,false);
			if (choice[@ 0,1] != ""){
				script_execute(asset_get_index(choice[@ 0,1]));
			}
		} else
		if (choiceXY[@ 1,2]) {
			goto[@ message_current] = choice[@ 1,0];
			choiceDone = true;
			audio_play_sound(vo_none,1000,false);
			if (choice[@ 1,1] != ""){
				script_execute(asset_get_index(choice[@ 1,1]));
			}
		} else
		if (choiceXY[@ 2,2]) {
			goto[@ message_current] = choice[@ 2,0];
			choiceDone = true;
			audio_play_sound(vo_none,1000,false);
			if (choice[@ 2,1] != ""){
				script_execute(asset_get_index(choice[@ 2,1]));
			}
		} else
		if (choiceXY[@ 3,2]) {
			goto[@ message_current] = choice[@ 3,0];
			choiceDone = true;
			audio_play_sound(vo_none,1000,false);
			if (choice[@ 3,1] != ""){
				script_execute(asset_get_index(choice[@ 3,1]));
			}
		}
	}
	
	for( var choiceI=0; choiceI < array_height_2d(choices[@ message_current]); choiceI++)
	{
		var text = choice[@ choiceI,2];
		
		if (choiceXY[@ choiceI,2]){
			draw_set_colour(make_colour_rgb(255,160,0));				
		}
		else {
			draw_set_color(c_white);	
		}
		
		draw_text(choiceXY[@ choiceI,0] - string_width(text)/2 , choiceXY[@ choiceI,1], text);
	}
	
}

//Destroys the objects once done
if (done)
{
	instance_destroy(self);
}
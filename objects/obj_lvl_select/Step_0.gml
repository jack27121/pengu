/// @description
if input_check_pressed(eVerb.Right) selected+= 1;
if input_check_pressed(eVerb.Left)	selected-= 1;

if(selected > 11) selected = 0;
else if (selected < 0) selected = 11;

selected_viz = lerp(selected_viz,selected,0.1);

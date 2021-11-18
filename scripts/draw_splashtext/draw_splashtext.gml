/// @func draw_splashtext(layer,object,text,color)
/// @description spawns text over object at specified layer, with specific color
/// @param	x_
/// @param	y_
/// @param	text
/// @param	color
function draw_splashtext(x_,y_,text,color) {
	splash_text = instance_create_depth(x_,y_,depth_effects,obj_splash_text);
	splash_text.text = text;
	splash_text.color = color;
}
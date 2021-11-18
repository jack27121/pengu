///@function margin_scale(scale, margin, sprite_size)
///@description scales sprite but keeps the margin the same
function margin_scale(scale,margin,sprite_size){
	return (((sprite_size - margin) * scale) + margin) / sprite_size
}
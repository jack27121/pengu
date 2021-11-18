/// @function grid_align
/// @description = aligns a value to a specified grid
/// @param	position
/// @param	grid_width
/// @param	grid_offset
function grid_align(position,grid_width,grid_offset) {
	return floor(position/grid_width)*grid_width + grid_offset;
}
/// @func draw_grid(cell_width,cell_height)
/// @description draws a grid
/// @param	cell_width
/// @param	cell_height
function draw_grid() {

	var cell_width = argument[0]; // cell_width
	var cell_height = argument[1]; // cell_height

	draw_set_color(white);
	draw_set_alpha(0.1);

	for(i = 0;i<room_width;i+=cell_width){
		draw_line_width(i,0,i,room_height,1);
	}
	for(i = 0;i<room_height;i+=cell_height){
		draw_line_width(0,i,room_width,i,1);
	}
	draw_set_alpha(1);
}
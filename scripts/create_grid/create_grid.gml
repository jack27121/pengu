function create_grid() {
	maskWidth = mask_index.sprite_width;
	maskHeight = mask_index.sprite_height;
	grid = mp_grid_create(0, 0, room_width / maskWidth, room_height /maskHeight, maskWidth, maskHeight);
	mp_grid_add_instances(grid, obj_wall, true);


}

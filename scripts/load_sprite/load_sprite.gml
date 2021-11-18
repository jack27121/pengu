///@function load_sprite(sprite, subimg)
///@description 
function load_sprite(sprite, subimg){
	var texWidth = sprite_get_width(sprite);
	var texHeight = sprite_get_height(sprite);
	//=== Create Surface ===//
	var _surf=surface_create(texWidth, texHeight);
	surface_set_target(_surf);
	draw_clear_alpha(0, 0);     
	draw_sprite(sprite, subimg, 0, 0);
	surface_reset_target();
	
	//=== Surface to Buffer ===//
	var _buff=buffer_create(4 * texWidth * texHeight, buffer_fixed, 1);
	buffer_get_surface(_buff, _surf, 0);
	surface_free(_surf);// we don't need the surface anymore
	
	//=== Save each pixel color to 2DArray ===//
	var image;
	for(var x_ = 0; x_ < texWidth; x_++)
	for(var y_ = 0; y_ < texHeight; y_++)
	{
		var pixel = buffer_peek(_buff, 4 * (x_ + y_ * texWidth), buffer_u32); // extracts info in ABGR Format
		var a = (pixel >> 24) & $ff,    // Alpha [0-255]    
		var r = pixel & $ff,            // Red [0-255]  
		var g = (pixel >> 8) & $ff,     // Green [0-255]    
		var b = (pixel >> 16) & $ff;    // Blue [0-255] 
	  
		image[x_][y_][0] = make_color_rgb(r,g,b);
		image[x_][y_][1] = a/255;
	}
	return image;
}
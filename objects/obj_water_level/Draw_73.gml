/// @description
var x_ = cam_x();
var y_ = cam_y();

draw_set_alpha(0.9);
draw_set_color(blue);
draw_rectangle(x_,y+4,x_+view_w,y_+view_h,0);
draw_set_alpha(1);
draw_set_color(white);

draw_sprite_tiled_area(sprite_index,image_index,x_,y+4,x_,y,x_+view_w,y+sprite_height);
/// @description
var x_ = cam_x();
var y_ = cam_y();

//draw_set_alpha(0.9);
draw_set_color(color);
draw_rectangle(x_,y+4,x_+view_w,y_+view_h,0);
//draw_set_alpha(1);
draw_set_color(white);

var offset_x = x_ mod width;
for (var i = 0; i < 6; ++i) {
    draw_sprite(sprite_index,image_index,(x_-offset_x)+(i*width),y);
}
/// @description draws background
var x_ = cam_x() + view_w/2;
var y_ = cam_y() + view_h/2;
//Top Left
draw_sprite_ext(sprite_index,subimg,x_,y_,1,1,0,white,1);
//Bottom Left
draw_sprite_ext(sprite_index,subimg,x_,y_,1,-1,0,white,1);
//Top Right
draw_sprite_ext(sprite_index,8-subimg,x_,y_,-1,1,0,white,1);
//Bottom Right
draw_sprite_ext(sprite_index,8-subimg,x_,y_,-1,-1,0,white,1);

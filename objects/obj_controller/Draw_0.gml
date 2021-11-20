//DRAW GUI ELEMENTS
xb = camera_get_view_x(view_camera[0]);
yb = camera_get_view_y(view_camera[0]);

draw_set_font(f_pixel);
outline_text("COOKIES: " + string(cookies) + " / " + string(maxcookies),4 + xb,4 + yb,c_white,c_black,1);
outline_text("SECRET: " + string(secret) + " / 1",4 + xb,12 + yb,c_white,c_black,1);
outline_text(string(timer/60),4 + xb,20 + yb,c_white,c_black,1);
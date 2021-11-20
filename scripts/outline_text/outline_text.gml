function outline_text(outlinestr,outlinex,outliney,maincol,outlinecol,dist){
	draw_set_color(outlinecol);
	draw_text(outlinex-dist,outliney,outlinestr);
	draw_text(outlinex+dist,outliney,outlinestr);
	draw_text(outlinex,outliney-dist,outlinestr);
	draw_text(outlinex,outliney+dist,outlinestr);
	draw_text(outlinex-dist,outliney+dist,outlinestr);
	draw_text(outlinex+dist,outliney-dist,outlinestr);
	draw_text(outlinex+dist,outliney+dist,outlinestr);
	draw_text(outlinex-dist,outliney-dist,outlinestr);
	draw_set_color(maincol);
	draw_text(outlinex,outliney,outlinestr);
	draw_set_color(c_white);
}
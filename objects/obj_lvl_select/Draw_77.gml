/// @description
var w = view_w*upscale;
var h = view_h*upscale;

draw_sprite_stretched(spr_calendar,0,0,0,w,h);

for (var i = 0; i < array_length(levels); ++i) {
	draw_set_font(f_hyper);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(white);
	
	if !(unlocked_levels > i) draw_set_alpha(0.5);
    draw_text(w/2+(i*offset)-(selected_viz*offset),h+12,string(i+1));
	draw_set_alpha(1);
}
/// @description
#region Escape level / restart menu
if(escape_time != 0){
	draw_set_font(f_credits);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_alpha(escape_time);
	draw_text(view_w-5,5,"Exiting level");
	draw_set_alpha(1);
}

if(restart_time != 0){
	draw_set_font(f_credits);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_alpha(restart_time);
	draw_text(view_w-5,5,"Restarting level");
	draw_set_alpha(1);
}

if(dataclear_time != 0){
	draw_set_font(f_credits);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_alpha(dataclear_time);
	draw_text(view_w-5,5,"!!!Clearing Data!!!");
	draw_set_alpha(1);
}
#endregion
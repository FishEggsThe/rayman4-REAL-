draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_font(Font1);
if isNaming
	draw_text(50, 50, "Name: " + name + (putThingy ? "|" : ""));
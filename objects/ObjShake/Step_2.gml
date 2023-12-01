camera_set_view_pos(view_camera[0], x+random_range(-shake, shake), y+random_range(-shake, shake))
reduce = !reduce;
if(reduce)
	shake -= 1.5;
shake = clamp(shake, 0, 999999);
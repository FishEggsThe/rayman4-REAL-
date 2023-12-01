if (!keyboard_check_pressed(vk_space)){
	y = other.y - sprite_yoffset + 0.5;
	airborne = false;
	jump = 0;
	helicopter = false;
}
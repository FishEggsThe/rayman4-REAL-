if ObjDialogue.isNaming == false{
	if (keyboard_check(vk_left) && !flung){
		if fistStrength == 1 {
			damage = 2;
			fistSpeed = 22.5;
			orbitRadianInc = 0.5;
		}
		if fistStrength == 2 {
			damage = 5;
			fistSpeed = 27.5;
			orbitRadianInc = 1;
			image_blend = c_yellow;
		}
	
		orbitRadian -= orbitRadianInc;
		if orbitRadian > pi*2
			orbitRadian -= pi*2;
		x = ObjRayman.x + (orbitRadius*cos(orbitRadian));
		y = ObjRayman.y + (orbitRadius*sin(orbitRadian));
		image_angle = -orbitRadian*(180/pi)+90;
	}
	if (keyboard_check_released(vk_left) && !flung){
		x = ObjRayman.x;
		y = ObjRayman.y;
		flung = true;
		speed = fistSpeed;
		image_angle = 0;
	}

	if flung{
		alarm[0] = 999;
		speed -= fistSlowdown;
		if speed < 0 {
			direction = point_direction(x, y, ObjRayman.x, ObjRayman.y) + 180;
			image_xscale = -1;
			image_angle = direction;
		}
	}
}
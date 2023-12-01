hspeed = 0;
if ObjDialogue.isNaming == false{
	//Movement
	if keyboard_check(ord("A")){
		move -= moveAdd;
		left = true;	
	}
	else if keyboard_check(ord("D")){
		move += moveAdd;
		left = false;
	}
	else if move != 0
		move += (left ? moveAdd : -moveAdd);

	//Jumping & Helicopter Hair
	if (keyboard_check_pressed(vk_space) && !airborne){
		jump = jumpSet;
		airborne = true;
	} 
	else if (keyboard_check_pressed(vk_space) && airborne){
		helicopter = !helicopter;
		heliFall = (jump < 0 ? heliFallSet : 0)
	}

	//Regarding the airborne state, or airbourne, idk you pick one
	if airborne{
		if helicopter {
			if !audio_exists(SndHelicopter)
				audio_play_sound(SndHelicopter, 3, false);
			y += heliFall;
			heliFall += heliFallFall;
			heliFall = clamp(heliFall, 0, heliFallSet);
			jump = -heliFall;
		}
		else {
			audio_stop_sound(SndHelicopter);
			y -= jump;
			jump -= jumpFall;
			jump = clamp(jump, jumpMin, jumpSet);
		}
	}

	//THE FIST
	if (keyboard_check_pressed(vk_left) && !instance_exists(ObjFist)){
		instance_create_layer(x, y, "Instances", ObjFist);
	}
	
	// Important
	if keyboard_check(ord("S")){
		image_xscale = 1.5;
		image_yscale = 0.5;
		airborne = true;
	}
	else {
		image_xscale = 1;
		image_yscale = 1;
	}

	//Finalizing horizontal movement
	move = clamp(move, (left ? -moveMax : 0), (left ? 0 : moveMax));
	hspeed = move;
	x = clamp(x, 0, room_width);
}
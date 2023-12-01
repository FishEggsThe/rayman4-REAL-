if isNaming {
	if keyboard_check_pressed(vk_anykey){
		if keyboard_key == vk_enter
			isNaming = false;
		else {
			if (keyboard_key >= 65 && keyboard_key <= 90)
				name = name + chr(keyboard_key + (keyboard_check(vk_shift) ? 0 : 32));
			if (keyboard_key >= 48 && keyboard_key <= 57)
				name = name + chr(keyboard_key);
			else if (keyboard_key == vk_space)
				name = name + chr(keyboard_key);
			else if (keyboard_key == vk_backspace)
				name = string_copy(name, 0, string_length(name)-1);;
			putThingy = true;
			alarm[0] = thingySet;
		}

	}
}

if (current < array_length(dialogue) && !audio_is_playing(dialogue[current]) && !instance_exists(ObjHoodlum) && !isNaming && !instance_exists(ObjCage) && !instance_exists(ObjOneGameLater) && !ObjMurphy.inCombat) { 
	current++;
	if current >= array_length(dialogue)
		room_goto(RmCredits);
	if current < array_length(dialogue){
		if current == 1
			instance_create_layer(544, -64, "Instances", ObjHoodlum);
		else if current == 3
			isNaming = true;
		else if current == 5
			instance_create_layer(544, -64, "Instances", ObjCage);
		else if current == 7
			instance_create_layer(0, 0, "Instances", ObjOneGameLater);
		else if current == 9
			ObjTeensie.hspeed = -20;
		else if current == 10 {
			instance_create_layer(736, 160, "Instances", ObjFakeMurphy);
			instance_destroy(ObjTeensie);
			ObjFakeMurphy.hspeed = -0.5;
		}
		else if current == 11 {
			ObjFakeMurphy.hspeed = 0;
			ObjMurphy.oX = ObjFakeMurphy.x;
			ObjMurphy.oY = ObjFakeMurphy.y;
		}
		else if current == 12 {
			ObjFakeMurphy.x = 1000;
			ObjMurphy.health = 20;
			ObjMurphy.inCombat = true;
		}
		else if current == 13 {
			ObjMurphy.inCombat = false;
			ObjFakeMurphy.x = ObjMurphy.x;
			ObjFakeMurphy.y = ObjMurphy.y;
			ObjMurphy.x = 1000;
			ObjFakeMurphy.vspeed = -0.5;
		}
			
		audio_play_sound(dialogue[current], 10, false);
	}
}
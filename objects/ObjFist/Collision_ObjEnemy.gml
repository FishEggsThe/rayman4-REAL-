if flung {
	with(other){
		health -= ObjFist.damage;
		if health <= 0 {
			if isntMurphy
				instance_destroy();
			else {
				inCombat = false;
				x = oX;
				y = oY;
				audio_stop_sound(Snd12);
			}
		}
			
	}
	instance_destroy();
}
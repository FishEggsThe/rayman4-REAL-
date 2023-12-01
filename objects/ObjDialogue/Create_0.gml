dialogue = [Snd0, // hello im rayman
			Snd1, // i am hoodwinker
			Snd2, // wow good job
			SndEmpty, // name
			Snd4, // good name also look teensie cage
			SndEmpty, // cage spawns
			Snd6, // help us rayman
			SndEmpty, // one video game later
			Snd8, // wow we did it
			Snd9, // i wonder who it was
			Snd10, // murphy appears
			Snd11, // WHAT THE FUCK
			Snd12, // murphy fight
			Snd13, // murphy is dead
			Snd14]; // the game is over
//dialogue = [goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, goldfeather, Snd12, goldfeather, goldfeather];
current = 0;
isNaming = false;
name = "";
putThingy = true;
thingySet = 0.5*room_speed;
alarm[0] = thingySet;

audio_play_sound(dialogue[current], 10, false);
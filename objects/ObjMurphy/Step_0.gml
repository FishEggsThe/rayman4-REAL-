if inCombat {
	orbitRadian -= orbitRadianInc;
	if orbitRadian > pi*2
		orbitRadian -= pi*2;
	x = oX + (orbitRadius*cos(orbitRadian));
	y = oY + (orbitRadius*sin(orbitRadian));
}


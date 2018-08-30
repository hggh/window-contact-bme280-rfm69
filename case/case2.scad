

VIERKANT = 7.5;
BREITE = 32;
HOEHE = 68;
BOHRUNGEN = 11;

difference() {
	cube([HOEHE, BREITE, 3]);

	// Bohrung oben
	translate([((HOEHE-43)/2), (BREITE/2), 0]) {
		cylinder($fn=40,h=3,r=(BOHRUNGEN/2));
	}

	// Bohrung unten
	translate([(HOEHE-((HOEHE-43)/2)), (BREITE/2), 0]) {
		cylinder($fn=40 ,h=3, r=(BOHRUNGEN/2));
	}

	// Vierkant
	translate([((43/2)+((HOEHE-43)/2)),(BREITE/2),-1]) {
		cylinder($fn=X, h=10, r=10.5);
	}

	// Leitungen links oben
	translate([19, (BREITE-4.5), 0]) {
		cube([19, 2.5, 2]);
	}

	// Leitungen rechts oben
	translate([19, 2, 0]) {
		cube([20, 2.5, 2]);
	}


	// Leitung links unten
	translate([48, (BREITE-4.5), 0]) {
		cube([30, 2.5, 2]);
	}


	// Leitung rechts unten
	translate([48, 2, 0]) {
		cube([30, 2.5, 2]);
	}

	// Leitung oben
	translate([19, 2, 0]) {
		cube([2.5, 28 , 2]);
	}

	// Reed Konakt Oben
	translate([20.3, (BREITE / 2) - 12, 0]) {
		cube([3, 25, 2]);
	}

	// Reed Kontakt Seite
	translate([((43/2)+ ((HOEHE-43)/2)), (BREITE-2-3),0]) {
		cube([15,3,2]);
	}

	// Reed Kontakt Seite
	translate([((43/2) + ((HOEHE-43)/2)), 2, 0]) {
		cube([15, 3, 2]);
	}

}
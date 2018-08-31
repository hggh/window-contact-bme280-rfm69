VIERKANT = 7.5;
BREITE = 32;
HOEHE = 68;
BOHRUNGEN = 11;

translate([10, 50, 0]) {
	inlay();
}

case();

module inlay() {
	difference(){
		cylinder($fn=40, h=4, r=((32/2) - 6.5));
		cube([(VIERKANT + 0.5), (VIERKANT + 0.5), 10], center=true);
		translate([(((32/2)-6)- 2.5), 0, 0]) {
			cube([2.5, 4.5, 10], center=true);
		}
	}
}

module case() {
	difference() {
		cube([HOEHE, BREITE, 3.5]);
	
	
		// sparen von material
		translate([5, 6, 0]) {
			cylinder($fn=40, h=1.5, r=3);
		}
		translate([5, 26, 0]) {
			cylinder($fn=40, h=1.5, r=3);
		}
	
		// Bohrung oben
		translate([((HOEHE-43)/2), (BREITE/2), 0]) {
			cylinder($fn=40, h=4, r=(BOHRUNGEN/2));
		}
	
		// Bohrung unten
		translate([(HOEHE-((HOEHE-43)/2)), (BREITE/2), 0]) {
			cylinder($fn=40 ,h=4, r=(BOHRUNGEN/2));
		}
	
		// Vierkant
		translate([((43/2)+((HOEHE-43)/2)),(BREITE/2),-1]) {
			cylinder($fn=40, h=10, r=10.5);
		}
	
		// Leitungen links oben
		translate([19, (BREITE-4.5), 0]) {
			cube([19, 2.5, 2.5]);
		}
	
		// Leitungen rechts oben
		translate([19, 2, 0]) {
			cube([20, 2.5, 2.5]);
		}
	
	
		// Leitung links unten
		translate([48, (BREITE-7), 0]) {
			cube([30, 5, 2.5]);
		}
	
	
		// Leitung rechts unten
		translate([48, 2, 0]) {
			cube([30, 5, 2.5]);
		}
	
		// Leitung oben
		translate([19, 2, 0]) {
			cube([2.5, 28 , 2.5]);
		}
	
		// Reed Konakt Oben
		translate([20.3, (BREITE / 2) - 12, 0]) {
			cube([3, 25, 2.5]);
		}
	
		// Reed Kontakt Seite
		translate([((43/2)+ ((HOEHE-43)/2)), (BREITE-2-3),0]) {
			cube([15,4,2.5]);
		}
	
		// Reed Kontakt Seite
		translate([((43/2) + ((HOEHE-43)/2)), 1, 0]) {
			cube([15, 4, 2.5]);
		}
	}
}
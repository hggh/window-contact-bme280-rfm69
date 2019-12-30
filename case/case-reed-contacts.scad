VIERKANT = 7.5;
BREITE = 40;
HOEHE = 68;
BOHRUNGEN = 10.75;

module inlay() {
	difference(){
		cylinder($fn=40, h=4, r=((32/2) - 6.5));
		cube([(VIERKANT + 0.5), (VIERKANT + 0.5), 10], center=true);
		translate([(((32/2)-6)- 3.3), 0, 0]) {
			cube([4, 4.5, 10], center=true);
		}
	}
}

module box() {
    difference() {
        cube([HOEHE, BREITE, 3.5]);
        // Bohrung unten
		translate([(HOEHE - ((HOEHE - 43) / 2)), (BREITE / 2), -1]) {
			cylinder($fn=40 ,h=7, r=(BOHRUNGEN / 2));
		}       
        // Bohrung oben
		translate([((HOEHE - 43) / 2), (BREITE / 2), -1]) {
			cylinder($fn=40, h=6, r=(BOHRUNGEN / 2));
		}
        // Mitte
        translate([((43/2)+((HOEHE-43)/2)),(BREITE/2),-1]) {
			cylinder($fn=40, h=10, r=10.5);
		}
        //Reed Contact
        translate([ (HOEHE-43)/2, (BREITE - 2.2 - 3), -1]) {
            cube([30, 3, 3.3]);
		}
        //Reed Contact
        translate([ (HOEHE-43)/2, 2.2, -1]) {
			cube([30, 3, 3.3]);
		}
    }
}


translate([40, 60, 0]) {
    difference() {
        union() {
            box();
            // Rundung oben
            translate([HOEHE, BREITE / 2, 0]) {
                difference() {
                    cylinder($fn=120, r=BREITE / 2 , h=3.5);
                    translate([-BREITE, - BREITE / 2,-1]) cube([BREITE, BREITE, 10]);
                    translate([0, 0, -1]) cylinder($fn=80, r=BREITE / 2.4 , h=3);
                }
            }
            translate([-40, -3, 0]) {
                difference() {
                    cube([40, 46, 6]);
                    translate([1, 1.5, 1]) {
                        cube([38, 43, 10]);
                    }
                    translate([3, 2, -1]) {
                        cube([36, 42, 5]);
                    }
                    translate([40/2 +1 , -10, 2]) {
                        rotate([0, 0, 90]) cube([60, 2, 2]);
                    }
                }
            }
        }
        translate([-4, 4, -1]) {
            cube([75, 5, 3.7]);
        }
        translate([-4, 31, -1]) {
            cube([75, 5, 3.7]);
        }
    }
    
}


translate([0, 10, 0]) {
    inlay();
}



module deckel() {
    D_BREITE = 40;
    D_HOEHE = 43;
    D_TIEFE = 11;

    union() {
        difference() {
            cube([D_BREITE + 2.8, D_HOEHE  + 2.8,  D_TIEFE + 1.5]);
            translate([1.2, 1.2, 0]) {
                cube([D_BREITE + 0.4, D_HOEHE + 0.4,  D_TIEFE]);
            }
            translate([-1, 1.5 + 1.2, 0]) {
                cube([4, 40 +0.4, 3.5]);
            }
        }
        difference() {
            translate([40/2 + 1.2 +1 , 0, 2]) {
                rotate([0, 0, 90]) cube([D_HOEHE + 2.4,, 2, 2]);
            }
            translate([1.2, 1.2 +2, 0]) {
                cube([D_BREITE, D_HOEHE-4,  D_TIEFE +1]);
            }
        }
    }
}


translate([60, 120, 0 ]) {
    deckel();
}
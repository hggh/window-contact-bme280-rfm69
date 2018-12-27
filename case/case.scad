VIERKANT = 7.5;
BREITE = 40;
HOEHE = 68;
BOHRUNGEN = 11;



module box() {
    difference() {
        cube([HOEHE, BREITE, 3.5]);
        // Bohrung unten
		translate([(HOEHE - ((HOEHE - 43) / 2)), (BREITE / 2), 0]) {
			cylinder($fn=40 ,h=4, r=(BOHRUNGEN / 2));
		}
        
        // Bohrung oben
		translate([((HOEHE - 43) / 2), (BREITE / 2), 0]) {
			cylinder($fn=40, h=4, r=(BOHRUNGEN / 2));
		}
        
        translate([((43/2)+((HOEHE-43)/2)),(BREITE/2),-1]) {
			cylinder($fn=40, h=10, r=7);
		}
        
        translate([((43/2)+((HOEHE-43)/2)) - 12,(BREITE/2) - 15, 0]) {
            cube([24, 30, 2.7]);
        }
        
        translate([((43/2)+((HOEHE-43)/2)) - 13,(BREITE/2) - 16, 0]) {
            cube([26, 32, 0.8]);
        }
    }
}


// neue Box
translate([40, 80, 0]) {
    difference() {
        union() {
            box();
            translate([-40, -1.5, 0]) {
                difference() {
                    cube([40, 43, 6]);
                    translate([1, 1.5, 1]) {
                        cube([38, 40, 10]);
                    }
                    translate([20, 21.5, 0]) {
                        cylinder($fn=80, r=18, h=2, center=true);
                    }
                }
			
            }
        }
        translate([-4, 4, 0]) {
            cube([26, 4, 2.7]);
        }
        translate([-4, 32, 0]) {
            cube([26, 4, 2.7]);
        }
    }
}


// Deckel innen
translate([120, 120, 0]) {
    difference() {
        cube([26, 32, 0.8]);
        translate([13, 16, 0 ]) {
            cylinder($fn=40, h=10, r=7, center=true);
        }
    }
}


// Vierkant
translate([0, 140, 0]) {
    difference(){
        union() {
            cylinder($fn=40, h=2, r=8);
            translate([-23 /2, -1.5 , (2 - 0.8) / 2]) {
                cube([23, 3, 0.8]);
            }
            translate([+1.5, - (23 / 2) , (2 - 0.8) / 2]) {
                rotate([0, 0, 90]) cube([23, 3, 0.8]);
            }
        }
        cube([(VIERKANT + 0.5), (VIERKANT + 0.5), 10], center=true);
    }
}


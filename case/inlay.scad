difference() {
	union() {
		cylinder(h=0.3, r=9.5, $fn=40);
		translate([0,0, 0.3]) {
			cylinder(h=2.7, r=8, $fn=40);
		}
	}
	translate([-3.5, -3.5, 0]) {
		cube([7, 7, 3]);
	}
	translate([5.7, 0, 0.9]) {
		cylinder(h=2.1, r=2, $fn=40);
	}
}

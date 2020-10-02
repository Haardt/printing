$fn = 200;

width = 60;
length = 40;
height = 20;
thick = 2;
magnet = 4;
magnetHeight = 2;

module caseBottom (width, length, height, thick) {
    cube([width, length, thick]);
    cube([width, thick, height]);
    cube([thick, length, height]);
    translate([0, length-thick, 0]) cube([width, thick, height]);
    cube([width, thick, height]);
    translate([width-thick, 0, 0]) cube([thick, length, height]);
}

module magnetBase(width, length, magnet, thick) {
    translate([width - thick -magnet , magnet+thick, height / 2]) color("red")
        cylinder(height, magnet, magnet, center = true);
    translate([thick + magnet , magnet+thick, height / 2]) color("red")
        cylinder(height, magnet, magnet, center = true);

    translate([width - thick -magnet , length - magnet - thick, height / 2]) color("red")
        cylinder(height, magnet, magnet, center = true);
    translate([thick + magnet , length - magnet - thick, height / 2]) color("red")
        cylinder(height, magnet, magnet, center = true);
}


caseBottom(width, length, height, thick);

module magnetHolder(width, length, magnet, magnetHeight, thick) {
    difference() {
        magnetBase(width, length, magnet, thick);
        translate([1, 1, height - magnetHeight]) 
            magnetBase(width - 2, length - 2, magnet -1, thick);
    }
}

magnetHolder(width, length, magnet, magnetHeight, thick);


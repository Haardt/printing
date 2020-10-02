
$fn=320;
fanWidth = 81;
fanHeight = 81;
fanDeep = 10.8;
fanHole = 6;
module fan() {
        cube([fanWidth, fanHeight, fanDeep]);
        translate([3,3, fanDeep/2]) cylinder(30, 3, 3, center = true);
        translate([fanWidth - 3,3, fanDeep/2]) cylinder(30, 3, 3, center=true);
        translate([fanWidth - 3, fanHeight - 3, fanDeep/2]) cylinder(30, 3, 3, center=true);
        translate([3, fanHeight - 3, fanDeep/2]) cylinder(30, 3, 3, center = true);
}

module case(padding, paddingX) {
    difference() {
    translate([0, 0, 0]) cube([(fanWidth * 2) + paddingX, fanHeight + padding, fanDeep + 2.2]);
    translate([paddingX/2, padding/2, -1]) cube([(fanWidth * 2), fanHeight, fanDeep + 4]);
    }
    screwHole = 10;
    difference() {
    union() {
        translate([paddingX/2, padding/2, 0]) cube([screwHole, screwHole, 3]);
        translate([paddingX/2, fanHeight + padding/2 - screwHole, 0]) cube([screwHole, screwHole, 3]);
        translate([(fanWidth * 2) + paddingX/2 - screwHole, padding/2, 0]) cube([screwHole, screwHole, 3]);
        translate([(fanWidth * 2) + paddingX/2 - screwHole, fanHeight + padding/2 - screwHole, 0]) cube([
         screwHole, screwHole, 3]);
        translate([(fanWidth) + paddingX/2 - screwHole, padding/2, 0]) cube([screwHole, screwHole, 3]);
        translate([(fanWidth) + paddingX/2 - screwHole, fanHeight + padding/2 - screwHole, 0]) cube([
         screwHole, screwHole, 3]);
        translate([(fanWidth + screwHole) + paddingX/2 - screwHole, padding/2, 0]) cube([screwHole, screwHole, 3]);
        translate([(fanWidth + screwHole) + paddingX/2 - screwHole, fanHeight + padding/2 - screwHole, 0]) cube([
         screwHole, screwHole, 3]);
    }
        translate([paddingX/2, padding/2, 1.1]) fan();
        translate([paddingX/2 + fanWidth, padding/2, 1.1]) fan();
  }
}

module mounting() {
  difference() {
    case(8, 22);
    translate([1.5, 2, -10]) cube([8,20,40]);
    translate([(11/2), 10, 6]) rotate([90,0,0]) cylinder(20, 2, 2);
    translate([(fanWidth*2 + 10) + 22/2 - 10,0 ,0]) {
      translate([1.5, 2, -10]) cube([8,20,40]);
      translate([(11/2), 10, 6]) rotate([90,0,0]) cylinder(20, 2, 2);
    }
  }
}

mounting();
//fan();
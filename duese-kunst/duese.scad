include <BOSL2/std.scad>
include <BOSL2/bottlecaps.scad>

$fn=200;

difference() {
    pco1810_cap(wall=3, spin=0);
    translate([0,0, -5])cylinder(20, 13, 13);
}


color("red")translate([0, 0, -19.9]) difference() {
    cylinder(20, 0.1, 17.3);
    translate([0,0, 0.1]) cylinder(20, 0.1, 15);
    translate([-5,  -5,  -8.0]) cube([10,10,10]);
}
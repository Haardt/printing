

module rohr(l, innen, dicke) {
difference() {
    
    cylinder(l, innen+dicke, innen+dicke);
    translate([0, 0, -1]) cylinder(l+2, innen, innen);
}
}

rohr(30, 20, 2);
translate([0, 0, 30]) {
    difference() {
      cylinder(20, 20 + 2, 15 + 2);
      translate([0, 0, -1]) cylinder(22, 20, 15);
    }
}
translate([0, 0, 50]) rohr(30, 15, 2);
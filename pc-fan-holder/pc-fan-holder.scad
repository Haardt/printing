
$fn=216;

module holes() {
    cylinder(20, 2.5, 2.5);
    translate([105,0,0]) cylinder(20, 2, 2);
}


module ring() {
    difference() {
        linear_extrude(10) circle(d = 150);
        translate([0,0, -1]) linear_extrude(12) circle(d = 130);
        translate([105 / 2 * -1, 45, -2]) holes();
        translate([105 / 2 * -1, -45, -2]) holes();
    }
};

module wall() {
    difference() {
        linear_extrude(62) circle(d = 130);
        translate([0,0, -1]) linear_extrude(64) circle(d = 129);
        translate([105 / 2 * -1, 45, -2]) holes();
        translate([105 / 2 * -1, -45, -2]) holes();
    }
};

module fan_holder() {
    ring();
     translate([0, 0, 25]) ring();
    difference() {
        wall();
        for(x = [-100: 6: 10]) {
            translate([x + 45, -100 ,0]) cube([5, 100, 100]);
      }
    }
    translate([0, 0, 60]) ring();
}

difference() {
    fan_holder();
    translate([-150, 0, -1 ]) cube([300,100,100]);
}



module ring() {
  linear_extrude(80, center = true, 60, 20, slices = 20, scale = 1.0, $fn=100) {
    difference() {
      circle(110);
      circle(40);
    }  
  }
}

module substractRing() {
  difference() {  
  linear_extrude(80, center = true, 60, 20, slices = 20, scale = 1.0, $fn=100) {
    difference() {
      circle(100);
      circle(40);
    }  
  }
  translate([0,0,1])
  linear_extrude(80, center = true, 60, 17, slices = 20, scale = 1.0, $fn=100) {
    difference() {
      circle(120);
      circle(41);
    }  
  }
  }
}

module subSphere() {
  difference() {
    sphere(r = 100);
    sphere(r = 99);
    translate([0,0, 70]) ring();
    translate([0,0, 30]) ring();
  }
}

module outClean() {
  difference() {
    sphere(r = 141);
    sphere(r = 100);
  }
}
module half() {
  difference() {
    union() {
      subSphere();
      translate([0,0, 70]) substractRing();
      translate([0,0, 30]) substractRing();
    }
    outClean();
  
    translate([-100, -100, -200]) cube(200);
  }
}


half();
difference() {
  cylinder(97, 20, 20);
  translate([0, 0, -5]) cylinder(110, 19, 19);
}




module m1() {
    hull() {
      translate([0, 0, 150]) cylinder(r=30,  h=1, $fn=36);
      translate([0, 0, 100]) cylinder(  r=3,  h=1 ,$fn=36);
      translate([0, 0, 80]) cylinder(  r=4,  h=1 ,$fn=36);
      translate([0, 0, 10]) cylinder(  r=30  ,h=1, $fn=36);
      translate([0, 0, 0]) scale([20, 20/1.5, 1]) cylinder(r1=1,r2=1, h=1, $fn=36);
    }
}
difference() {
 scale([1.1, 1.1, 1.0])m1();
 translate([0,0,1]) m1();
}

 translate([0,0,-1])scale([0.7, 0.7, 1.0])
difference() {
 scale([1.1, 1.1, 1.0])m1();
 translate([0,0,1]) m1();
}
//m1();
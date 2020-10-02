// by Les Hall

// started 4-16-2014


amplitude = 20;

periods = 3;

minDetail = 2.5;

ringDiameter = (90) + amplitude + minDetail/2;

numTheta = PI*(ringDiameter+4*amplitude+4*minDetail)/minDetail;

$fn = 255;

module ring() {
for(t = [0:numTheta], k = [0:periods-1]) {
  hull() {
         //first slice
rotate(t*360/numTheta, [0, 0, 1])
translate([ringDiameter/2, 0, 0])
rotate(-360/numTheta*periods*amplitude*cos(t*360/numTheta*periods-k*360/periods),
[0, 0, 1])
translate([0, 0, amplitude*cos(t*360/numTheta*periods-k*360/periods)])
rotate(90-360/numTheta*periods*amplitude*sin(t*360/numTheta*periods-k*360/periods),
[1, 0, 0])
translate([amplitude*sin(t*360/numTheta*periods-k*360/periods), 0, 0])
cylinder(d=minDetail, h = 0.1, center = true);
         //second slice

rotate((t+1)*360/numTheta, [0, 0, 1])
translate([ringDiameter/2, 0, 0])
rotate(-360/numTheta*periods*amplitude*cos((t+1)*360/numTheta*periods-k*360/periods),
[0, 0, 1])
translate([0, 0, amplitude*cos((t+1)*360/numTheta*periods-k*360/periods)])
rotate(90-360/numTheta*periods*amplitude*sin((t+1)*360/numTheta*periods-k*360/periods),
[1, 0, 0])
translate([amplitude*sin((t+1)*360/numTheta*periods-k*360/periods), 0, 0])
cylinder(d=minDetail, h = 0.1, center = true);
     }
  }
}

module armreif() {
  //translate([0,0, 1.0])ring();
  scale([1.0, 1.0 , 1.1]) donut();
}

module donut() {
rotate_extrude()
translate([50, 0, 0])
circle(r = 13);
}

module armreifWithHole() {
  difference() {
    armreif();  
    translate([0, 0, 3.5]) scale([0.64, 0.64, 0.3]) donut();  
  }
}

//translate([0, 0, 0]) cube([145, 10, 10], center = true);
//translate([35, 0, 0]) cube([20, 10, 10], center = false);


difference() {
 armreifWithHole();
 battRad = 12.3;
 springHole = 4;   
 for(t = [0:3]) {
  translate([50, 2.5, 0]) rotate([90, 0, 0]) cylinder(t * 3.5, battRad, battRad);
 }
  translate([50, 0, 0]) rotate([90, 0, 0]) cube([30, 22, 3.6],
     center=true);
  
  translate([50, -1, 0]) rotate([90, 0, 0]) cylinder(25, springHole, springHole, center = true);

ledHole = 4.5;
  translate([-50, 0, 0]) rotate([90, 0, 90]) cylinder(40, ledHole, ledHole, center = true);
  translate([-35, 32, 0]) rotate([90, 0, 60]) cylinder(50, ledHole, ledHole, center = true);
  translate([-35, -32, 0]) rotate([90, 0, 120]) cylinder(50, ledHole, ledHole, center = true);
  
 }

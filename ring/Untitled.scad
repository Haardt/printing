// by Les Hall

// started 4-16-2014


amplitude = 5.6;

periods = 4;

minDetail = 1.5;

ringDiameter = (67) + amplitude + minDetail/2;

numTheta = PI*(ringDiameter+4*amplitude+4*minDetail)/minDetail;

$fn = 16;

module ring() {
for(t = [0:numTheta], k = [0:periods-1])

{

hull()

     {
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
  translate([0, 0, 0.5]) ring();
  donut();
}

module donut() {
$fn = 96;
rotate_extrude()
translate([37, 0, 0])
circle(r = 6);
}
difference() {
  armreif();  
  translate([0,0, 0.3]) scale([0.8, 0.8 , 0.4]) donut();  
}

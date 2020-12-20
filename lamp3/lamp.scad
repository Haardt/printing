
$fn=80;

module cubes(hole) {
angles = 9.4;
floors = 24;
instances = angles*floors;
cube_height=30;    

//rotate([0, 0, $t*360])
for (i = [1:instances])
{
        rotate([0, 0, -360*i/angles]) // rotate around the vertical axis
        rotate([i, -90+180*i/instances, i]) // slowly lower the cube
        translate([110, 0, 0]) // the radius of the sphere
        scale((1.4*sin(180*i/instances))+0.4) // small near the poles, bigger at the equator
    if (hole == true) {
    difference() {
        cube([cube_height,15,15], center=true); // the object being repeated: a cube.
        translate([-12,0,0])
        cube([cube_height-1,14,14], center=true); // the object being     
        }
    }
    else {
     cube([cube_height,15,15], center=true); // the object being 
    }
}
}

module cubeSphere() {
    translate([0, 0, 110]) {
            cubes(false);
            sphere(120);
    }
}

module cubeSphereWithSockel() {
    difference() {
        cubeSphere();
        translate([-250, -250, -100]) cube([500, 500, 100]);
    }
}

module part(pos) {
    difference() {
        cubeSphereWithSockel();
        translate([-250, -250,  30 + (pos * 40) ]) cube([500, 500, 300]);
        translate([-250, -250,  -300 + (pos * 40) ]) cube([500, 500, 300]);
    }
}
// 1
part(0);

//2

 difference() {
          part(1);
          cylinder(100, 90, 90);
 }
difference() {
  translate([0,0, -35]) cylinder(20, 91, 91);
  translate([0,0, -36]) cylinder(22, 90, 90);
}


// 3

 difference() {
          part(2);
          cylinder(150, 90, 90);
 }
difference() {
  translate([0,0, -35]) cylinder(20, 91, 91);
  translate([0,0, -36]) cylinder(22, 90, 90);
}


//4

 difference() {
          part(3);
          cylinder(200, 110, 110);
 }
difference() {
  translate([0,0, -35]) cylinder(20, 111, 111);
  translate([0,0, -36]) cylinder(22, 110, 110);
}


//5 last

 difference() {
          part(4);
          cylinder(250, 85, 85);
 }

difference() {
  translate([0,0, -35]) cylinder(20, 85, 85);
  translate([0,0, -36]) cylinder(22, 84, 84);
}


part(5);





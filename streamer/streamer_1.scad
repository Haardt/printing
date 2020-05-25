
$fn=30;

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

module baseSphereWithHoles() {
color("#333333") difference() {
 difference() {
     sphere(105);
     sphere(104);
 }
scale(0.88)cubes();
 }
}


//cylinder(127,37, 37, center = true);


//cubes();

module lcdFront() {
 difference() {
   difference() {  
     translate([-26,0,0]) cylinder(127,38, 38, center = true);
     translate([-29,0,0]) cylinder(126,38, 38, center = true);
   }
   translate([0,0,0]) cube([27,38,126], center = true);   
  }
}

module sphereWithDisplayHole() {
 difference() {
  baseSphereWithHoles();
  translate([-64,0,0]) {
      translate([-26,0,0]) cylinder(127,38, 38, center = true);
   }
  }
}

module sphereWithLCDHole() {
 sphereWithDisplayHole();
 translate([-64,0,0]) lcdFront();
}

module sphereCubesLCD() {
sphereWithLCDHole();
cubes(true);
}

module soundCubeMax() {
  difference() {
  sphereCubesLCD();
    translate([-65,0,0]) {
      translate([-26,0,0]) cylinder(126,38, 38, center = true);
    }
    translate([-110,0,0]) {
      translate([-26,0,0]) cylinder(138,38, 38, center = true);
    }
  }
}

difference() {
  soundCubeMax();
  difference() {
    sphere(150);
    sphere(120);
  }
  translate([-200,-200, -400])
  cube([400,400,400], center=false);
}

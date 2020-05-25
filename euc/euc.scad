

$fn=16;

color("red") difference() {
    $fn=200;
rotate([90,0,90]) cylinder(5,10,10, center=true);

translate([10,0,0]) sphere(12);
translate([-10,0,0]) sphere(12);
}

difference() {
$fn=200;
rotate([90,0,90]) cylinder(2,10,10, center=true);
translate([-4,0,0])rotate([0,90,0]) cylinder(8,3,3);
}

module plate() {
    translate([-4,0,-1]) cube([2,3,7], center = true);
    translate([-5,0,-5]) cube([5,7,1], center = true);
}

plate();

translate([-0.1,0, 0]) mirror([1,0,0]) plate();

translate([-4,0,0])rotate([0,90,0]) {
    $fn=200;
    cylinder(8,2,2);
}

module shell() {
  difference() {
   translate([0,0, 5]) rotate([90,0,90]) cylinder(7,12,12, center=true);
   translate([0,0, 0]) rotate([90,0,90]) cylinder(6,12,12, center=true);    
  }
}

module raster() {
    translate([-3.5,0,0]) #cube([4.5, 0.5, 10]);
}

module eucText(rotation) {


 translate([-3.2, 4, 10.2]) {

   rotate([rotation,0,270]) linear_extrude(height = 0.7) {
       text("EUC", 3);
   }
  }
 translate([-3.2, 8.4, 7.5]) {
   rotate([rotation,0,270]) linear_extrude(height = 0.7) {
       text("IS NO CRIME", 2);
   }
  }  
  
 }
 
 
 difference() {
    shell();
     translate([3.2,0,4.2])#cube([1,19.5,2], center=true);
     translate([-3.2,0,4.3])#cube([1,19.5,2], center=true);
     translate([-4,0,15])rotate([0,90,0]) {
//    $fn=160;
    cylinder(8,1.5,1.5);
}
 }
    translate([0.0,0,-2])eucText(95); 
    translate([7.0,0,-2])  mirror([0,1,0]) eucText(85);
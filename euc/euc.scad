

$fn=16;

difference() {
    $fn=120;
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


module eucText() {

 translate([-2.8, 4,10]) {
   rotate([90,0,270]) linear_extrude(height = 4) {
       text("EUC", 3);
   }
  }
 translate([-2.8, 9.5,6]) {
   rotate([90,0,270]) linear_extrude(height = 4) {
       text("IS NOT CRIME", 2);
   }
  }  
  
 }
 
 
 difference() {
//     union() {
    shell();
    eucText(); 
    translate([9.5,0,0]) mirror([0,1,0]) eucText();
     
     translate([-4,0,15])rotate([0,90,0]) {
    $fn=160;
    cylinder(8,1.5,1.5);
}
 };

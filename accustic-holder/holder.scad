

polster = 69;
length = 50;

cube([2,50,length]);
cube([polster,2,length]);
translate([polster,0,0]) cube([2,50,length]);
translate([polster,0,0]) cube([30,2,length]);
translate([polster + 30,-25,0]) difference() {
 cube([2,50,length]);
 translate([-1,length/4, length/6]) rotate([0, 90, 0]) cylinder(4, 1.5, 1.5);   
 translate([-1,length/4, length - (length/6)]) rotate([0, 90, 0])cylinder(4, 1.5, 1.5);   

 translate([-1, length - length/4, length/6]) rotate([0, 90, 0]) cylinder(4,1.5, 1.5);   
 translate([-1,length - length/4, length - (length/6)]) rotate([0, 90, 0]) cylinder(4, 1.5, 1.5);   
   
}
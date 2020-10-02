

width=175;
height=35;
length=50;



module bottomBox() {
  difference() {
      cube([width, length, height]);
      translate([2,2,2]) cube([width-4, length-4, height]);
      translate([-10, length-5,5]) rotate([0, 90, 0]) cylinder(20, 3.0, 3.0); 
  }
}

//bottomBox();

module top() {
difference() {
    cube([width, length, 2]);
   translate([8, length / 2 - 4.5/2, -1]) cube([width- 16, 4.5, 4]);    
}    

color("red") translate([5, length/2 -10, 20])cube([width - 10, 20, 1]);
color("red") translate([5, length/2 -10, 0])cube([width - 10, 1, 20]);
color("red") translate([5, length/2 + 9, 0])cube([width - 10, 1, 20]);

color("yellow") translate([5, length/2 -4.5/2 -1.5, 0])cube([width - 10, 1, 10]);
color("yellow") translate([5, length/2 + 4.5/2 + 0.5, 0])cube([width - 10, 1, 10]);

}

translate([0, length +1,0 ]) bottomBox();
difference() {
    top();
      translate([10,7,-15]) cylinder(20, 6.0, 6.0) ;   
}

// holder
width =     75;
depth =     70;
height = 35;
thick =       2;
plateSpacing = 40;
holder = 4;

difference() {
    cube([width + plateSpacing , depth + plateSpacing ,  thick]);
    translate([plateSpacing / 2, holder + plateSpacing / 2, -1]) cube([width , depth - (holder * 2) ,  thick + 2]);
    translate([width+ plateSpacing - 8,  height + plateSpacing -5, -1]) rotate([0,  0, -90]) linear_extrude(height = 10) {
        text("KINGOSONG 16X", size = 4);
    }
    translate([(plateSpacing)/4 , plateSpacing / 2 - 5, -1])cylinder(20, 2,2);
    translate([(plateSpacing)/4 , depth + plateSpacing / 2 + 5 , -1])cylinder(20, 2,2);
    translate([width + plateSpacing / 1.5, plateSpacing / 2 - 5, -1])cylinder(20, 2,2);
    translate([width + plateSpacing / 1.5, depth + plateSpacing / 2 + 5 , -1])cylinder(20, 2,2);
}

module case() {
    cube([width, thick, height]);
    translate([0, depth,0]) cube([width, thick, height]);
    bottomHole = 4;
    difference() {
        cube([thick, depth, height]);
        translate([-10, bottomHole, bottomHole]) cube([20, depth - bottomHole * 2 , height - bottomHole * 2]);
    }

    topHole = 5;
    translate([0, 0, height]) difference() {
        cube([width, depth  + thick, 2]);
        translate([topHole, topHole, -5]) cube([width - topHole * 2, depth + 2 - topHole * 2 , 10]);
    }
}

translate([plateSpacing / 2, (plateSpacing / 2) -( holder / 4), thick]) case();

module support() {
    translate([0,0, height]) { 
        rotate([0,180,180])difference() {
        cube([20, 20, height]);
        rotate([-15, 0, 0]) translate([-5, 0,  -5]) cube([40, 40, height + 20]);
        }
    }
}
translate([20,20,0])support();
translate([60,20,0])support();

translate([20, depth + plateSpacing / 2, 0]) mirror([0,1,0]) support();
translate([60, depth + plateSpacing / 2, 0]) mirror([0,1,0]) support();

translate([45, 7.5, 7]) {
    rotate([0, -90, 0])
    difference() {
      cylinder(25, 6, 6);
      translate([0,0,-2.5])cylinder(30, 5, 5);
       translate([2.5,-2.5,-2.5]) cube([10,5, 50]); 
    }
}

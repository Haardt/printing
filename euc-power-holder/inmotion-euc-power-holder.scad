width =     160/2;
depth =     73.5;
height = 36.5;
thick =      2;
plateSpacing = 40;
holder = 5;

difference() {
    cube([width + plateSpacing , depth + plateSpacing ,  thick]);
    translate([plateSpacing / 2, holder + plateSpacing / 2, -1]) cube([width , depth - (holder * 2) ,  thick + 2]);
    translate([(plateSpacing)/4 , plateSpacing / 2 - 5, -1])cylinder(20, 2,2);
    translate([(plateSpacing)/4 , depth + plateSpacing / 2 + 5 , -1])cylinder(20, 2,2);
    translate([width + plateSpacing / 1.5, plateSpacing / 2 - 5, -1])cylinder(20, 2,2);
    translate([width + plateSpacing / 1.5, depth + plateSpacing / 2 + 5 , -1])cylinder(20, 2,2);
}

module case() {
    cube([width, thick, height]);
    translate([0, depth,0]) cube([width, thick, height]);
    bottomHole = 6.5;
    translate([-thick + 1, 0, 0]) difference() {
        cube([thick, depth + thick, height + thick]);
        translate([-10, bottomHole +1.5, bottomHole]) cube([20, depth - bottomHole * 2 , height - bottomHole * 2]);
    }

    topHole = 6;
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
translate([20,20,0]) support();
translate([60,20,0]) support();
translate([20, depth + plateSpacing / 2, 0]) mirror([0,1,0]) support();
translate([60, depth + plateSpacing / 2, 0]) mirror([0,1,0]) support();

module supportBottom() {
    translate([0,0, height]) { 
        rotate([0,180,90])difference() {
        cube([5, 10, height]);
        rotate([-15, 0, 0]) translate([-5, 0,  -5]) cube([40, 40, height + 20]);
        }
    }
}
translate([20,24,0]) supportBottom();
translate([20, depth + plateSpacing - 19,0]) supportBottom();

//translate([45, 7.5, 7]) {
//    rotate([0, -90, 0])
//    difference() {
//      cylinder(25, 6, 6);
//      translate([0,0,-2.5])cylinder(30, 5, 5);
//       translate([2.5,-2.5,-2.5]) cube([8,4, 50]); 
//    }
//}
powerHolderPos = 50;
translate([34 + powerHolderPos, 10.0, 0]) cube([12, 3, height / 2]); 
translate([35 + powerHolderPos, 1.0, 0]) cube([12, 3, height / 2]); 
translate([40 + powerHolderPos + 6, 10.0, height / 2 - 5]) cube([6 ,3, 5]); 
translate([40 + powerHolderPos + 6, 1.0, height / 2 - 5]) cube([6, 3, 5]); 

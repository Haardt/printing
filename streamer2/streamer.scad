
shellH = 280;
shellW = 120;


module shell(h, w) {
  difference() {
    color("yellow") cube([w, w, h]);
    color("yellow") translate([-1,1, 1]) cube([w-2,w-2, h-2]);
  }
}

module light(w, l, d) {
    difference() {
        color("red") cube([w, l, d]);
        translate([1, -1, 1]) cube([w, l + 2 , d -2]);
        translate([-10, (l / 2) - 7.5, (d / 2) - 7.5]) 
            cube([15, 15 , 15], center=false);
    }        
}

module lightHole(w, d) {
    cube([w, w + 2, d]);
}

module shellWithHoles(h, w, d) {
    offset = 0;
    holes = [offset + 20, offset + 60, offset + 100];
    difference() {
        shell(h, w);
        translate([ w / 3, -1, holes[0]]) lightHole(w, d);
        translate([ w / 3, -1, holes[1]]) lightHole(w, d);
        translate([ w / 3, -1, holes[2]]) lightHole(w, d);
        translate([ w / 3, 1, holes[2] + 50]) cube([w + 1, w - 2, h /2.38]);
        translate([ w - 3 , -1, holes[2] + 50]) cube([4, w + 2, h]);
    }
    translate([w / 3, 0, holes[0]]) light(w - (w / 3), w, d);
    translate([w / 3, 0, holes[1]]) light(w - (w / 3), w, d);
    translate([w / 3, 0, holes[2]]) light(w - (w / 3), w, d);
}

module tube(l) {
    difference() {
        cube([20, 20 , l]);
        translate([1, 1, 1]) cube([18, 18 , l - 2]);
    }
}
//light(shellH, she2llW, 40);
module housing(w, d, h) {
    padding = 30;
    
    translate([15, 12, 0]) cube([w - padding, d - padding+4, 4], center = false);    
    translate([15, 11.5, 0]) cube([w / 1.40, d - 23.5, 4], center = false);    
    translate([15, 12.5, 0]) rotate([90, 0, 0]) cube([w - 30, h+7, 4], center = false);
    translate([15, w - 12.5, 0]) rotate([90, 0, 0]) cube([w - 30, h+7, 2], center = false);
    translate([w - 15, 0, 0]) rotate([0, -90, 0]) cube([h+5, 12.5, 4], center = false);
    translate([w - 15, d-12.5, 0]) rotate([0, -90, 0]) cube([h+5, 12.5, 4], center = false);
    translate([14, 11.0, h+5]) cube([w / 1.35, d - 24, 4], center = false);    
    translate([w - 15, 0, h+5]) rotate([0, -90, 0]) cube([15, w, 4], center = false);

    translate([15, 11.0, 0]) rotate([0, -90, 0]) cube([h+7, d - padding+5.5, 2], center = false);    
}

shellWithHoles(shellH, shellW, 20);
translate([(shellW / 3) - 20, (shellW/2) - 10, 20]) tube(shellH - 20);
translate([15, 0, 127]) housing(shellW, shellW, 133);


//translate([100,12.5,125])%cube([10,95,135]);

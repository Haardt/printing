





module wand(w, t, h) {
  difference() {  
    cube([w, t, h]);
    translate([0.5, -1, 0.5])cube([w-1, t, h-1]);      
  }
}

module wandLeft(w, t, h) {
  difference() {  
    cube([w, t, h]);
    translate([-0.5, -1, 0.5])cube([w - 1, t, h-1]);      
  }
}

module wandRight(w, t, h) {
  difference() {  
    cube([w, t, h]);
    translate([0.5, -1, 0.5])cube([w, t, h-1]);      
  }
}

module wandTop(w, t, h) {
  difference() {  
    cube([w, t, h]);
    translate([0.5, -1, -0.5])cube([w - 1, t, h]);      
  }
}

module wandBottom(w, t, h) {
  difference() {  
    cube([w, t, h]);
    translate([0.5, -1, 0.5])cube([w - 1, t, h]);      
  }
}

h = 160;
dh = 150.5;
dw = 230.5;
wall_thick = 20;
module shell(lift) {
translate([wall_thick,0, lift+wall_thick]) wand(dw, 40, dh);

translate([dw+wall_thick, 0, 0]) wandLeft(wall_thick, 40, dh+(2*wall_thick) + lift);
translate([0, 0, 0]) wandRight(wall_thick, 40, dh+(2*wall_thick + lift));

translate([0, 0, lift + dh + (wall_thick)]) wandTop(dw + wall_thick*2, 40, wall_thick);

translate([0, 0, 0]) wandBottom(dw + wall_thick*2, 40, lift+wall_thick);
    
translate([wall_thick-5, 35, lift+wall_thick-5]) cube([dw+10, 5, dh+10]);

}


shell(30);
translate([(wall_thick*2 + dw)/2, 20, 50/2])rotate([90, 0, 0])cylinder(h=40, d = 10, center = true);
color("red")translate([(wall_thick*2 + dw)/2, 20, 37])rotate([0, 0, 90])cylinder(h=25, d = 9, center = true);

//translate([0, -55, 0])wandBottom(dw+(wall_thick*2),60,20);

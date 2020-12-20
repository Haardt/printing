
width = 45;
length = 50;
thick = 2;

module sockel(width, length) {
    difference() {
        cube([width, length,10]);
        translate([width,-1, -1])rotate([00, -45, 00 ]) cube([20,length+2,30]);
    }
}

difference() {
   sockel(width, length);
   translate([thick, thick,-1])sockel(width-thick*2 - 1, length - thick * 2);
}
translate([44, 25, -0.0]) rotate([45, 0, 90])  {

    translate([0, 5, 0])  linear_extrude(height = 2) {   
        text("Rainer", 2.8, halign="center");
    }

    translate([0, 10, 0]) linear_extrude(height = 2) {   
        text("TEAM NEON", 2.8, halign="center");
    }

    linear_extrude(height = 2) {   
        text("\"THE MECHANIC\"", 2.8, halign="center");
    }
}




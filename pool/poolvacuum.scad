   /*[Global] */
// Length
h0=80; // [50:200] 
//Radius
r2=14.5; //[7:50] 
//wall thickness
th=2.5; //[1:thin,2.5:normal,4:strong]

/* [Hidden]*/
$fn=90;
overlap=1;
h1=h0/2+overlap; //large funnel
h2=h0/2; //output length
r1=r2-1.5; //large radius
r3=r2-1.5; //small radius



difference(){
    union(){
    translate([0,0,90]) rotate([180,0,0]) net(5);
    rotate([0,0,0]) rohr();
         translate([0,-10,13]) rotate([40,0,0]) halter();
    }
    cylinder(r=r2-th,h=50);
    translate([1.6,-1.6,84]) rotate([180,0,0]) net(0);
}



module net(x){
    difference() {
        difference() {
            hull() {
                #translate([0,0,55]) cylinder(r=20.5+x,h=30+x);
                translate([-102,-12.5,85]) cube([200+x,33+x,5]);
            }
        }
        for(x = [0:40:40*4]) {
          translate([-90 + x,-50, 88]) cube([20,100,20]);
        }  
    }
}


module halter(){
    difference(){
cylinder(r=17,h=80);
cylinder(r=15,h=80);
translate([-15,0,55]) rotate([0,90,0]) cylinder(r=3.25,h=30);
}
}



module rohr(){
 


difference(){
union(){
	cylinder(h=h1,r1=r1,r2=r2);
	translate([0,0,h1-overlap])	cylinder(h=h2,r1=r2,r2=r3);

//lower rings
	translate([0,0,6]) cylinder(h=5,r1=r1,r2=r1+1.5);
	translate([0,0,12]) cylinder(h=5,r1=r1,r2=r1+1.5);
	translate([0,0,18]) cylinder(h=5,r1=r1,r2=r1+1.5);
//upper rings
	translate([0,0,h1+h2-11]) cylinder(h=5,r1=r3+1.5,r2=r3);
	translate([0,0,h1+h2-17]) cylinder(h=5,r1=r3+1.5,r2=r3);
	translate([0,0,h1+h2-23]) cylinder(h=5,r1=r3+1.5,r2=r3);
}
	translate([0,0,0]) cylinder(h=h1,r1=r1-th,r2=r2-th);
	translate([0,0,h1-overlap])	cylinder(h=h2,r1=r2-th,r2=r3-th);
}
    
}
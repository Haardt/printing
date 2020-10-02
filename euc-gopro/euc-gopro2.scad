/*
 * Go Pro triple mount for Paint Pole
 * CCv3 SA BY 
 * by Michael Erwin 7-Dec-2013
 *
 * Much thanks goes to additional code work the following:
 *
 * GoPro variables from MoonCactus
 *
 * OpenSCAD Threads Module v1.3 by
 * Dan Kirshner - dan_kirshner@yahoo.com
 * http://dkprojects.net/openscad-threads/
*/


// Go Pro Parameters
/* [Rod and captive nut] */

// This tab is useful only if you have selected "rod" as the secondary head. The optional rod diameter (also the captive nut internal diameter)
gopro_captive_rod_id= 3.8;
// The angle the rod makes with the axis (0 is colinear, 90 is a right angle)
gopro_captive_rod_angle= 45; // [0:90]
// Optional captive nut thickness with freeplay (tightest would be 3.2)
gopro_rod_nut_th= 3.6;
// Optional captive nut diameter with freeplay (from corner to corner)
gopro_rod_nut_od= 8.05;
// How much is the protruding output of the rod on the rod attachment (can be zero), useful if you don't want a captive nut with still a tight coupling
gopro_captive_protruding_h= 0.5;
// The gopro connector itself (you most probably do not want to change this but for the first two)

// The locking nut on the gopro mount triple arm mount (keep it tight)
gopro_nut_d= 9.2;
// How deep is this nut embossing (keep it small to avoid over-overhangs)
gopro_nut_h= 2;
// Hole diameter for the two-arm mount part
gopro_holed_two= 5;
// Hole diameter for the three-arm mount part
gopro_holed_three= 5.5;
// Thickness of the internal arm in the 3-arm mount part
gopro_connector_th3_middle= 3.1;
// Thickness of the side arms in the 3-arm mount part
gopro_connector_th3_side= 2.7;
// Thickness of the arms in the 2-arm mount part
gopro_connector_th2= 3.04;
// The gap in the 3-arm mount part for the two-arm
gopro_connector_gap= 3.1;
// How round are the 2 and 3-arm parts
gopro_connector_roundness= 1;
// How thick are the mount walls
gopro_wall_th= 3;

gopro_connector_wall_tol=0.5+0;
gopro_tol=0.04+0;

gopro_connector_z= 2*gopro_connector_th3_side+gopro_connector_th3_middle+2*gopro_connector_gap;
gopro_connector_x= gopro_connector_z;
gopro_connector_y= gopro_connector_z/2+gopro_wall_th;






// Examples:
//metric_thread(8, 1, 10);

module gopro() {
gopro =true;

difference(){
union(){

//add a GoPro style mount?
			// add the base wall
			translate([-(gopro_connector_x/2),-(gopro_connector_z/2),30])	
				cube([gopro_connector_x,gopro_connector_z,gopro_connector_z]);


			// add the rounded top
			translate([7.25,0,gopro_connector_z+30])
				rotate([0,-90,0])
					cylinder(r=7.25, h=gopro_connector_z);

			// add the optional nut emboss
			rotate([0,0,0])
			translate([-7.25,0,gopro_connector_z+30])
				rotate([0,-90,0])
				difference()
				{
  				cylinder(r1=gopro_connector_z/2-gopro_connector_roundness/2, r2=11.5/2, h=gopro_nut_h+gopro_tol);
				cylinder(r=gopro_nut_d/2, h=gopro_connector_z/2+3.5+gopro_tol, $fn=6);
				}


	difference()
	{
		translate([0,0,4+1.5])cylinder (r=13,h=26-1.5);
		english_thread(7/8, 5, 1, internal=true);
	}


}//end the union of the base shapes & start removing

			//GoPro Screw Hole
			translate([8,0,gopro_connector_z+30])
				rotate([0,-90,0])
					cylinder(r=2.6, h=gopro_connector_z+2);

			//GoPro Mount Slots
			translate([-((gopro_connector_x/2)-2.6),-7.5,30])	
				cube([3.1, gopro_connector_x+1,gopro_connector_z*2]);

			translate([-((gopro_connector_x/2)-2.6)+3.1+3.3,-7.5,30])	
				cube([3.1, gopro_connector_x+1,gopro_connector_z*2]);
	

}
}



h = 21-1.5;
h2 = 3.0;
translate([0,0, -4]) {
for(i = [0: 30: 30*3]) {
  translate([0, i, h2 - 1]) cube([70,15,1]);
}
translate([0,0,0]) cube([20, 15 * 3+ 30 * 2, h2]);
translate([0,0,0]) cube([10, 15 * 3 + 30 * 2, h]);

translate([0,0, h]) cube([30, 15 * 3 + 30 * 2, 5]);

}
translate([-3, 12, -8-1.5]) mirror([0,0,0]) rotate([0,0, 160])gopro();




















// Rohloff hub thread:
//metric_thread(34, 1, 10, internal=true, n_starts=6);

//english_thread(3/4, 5, 2, internal=true);


//metric_thread(8, 2, 4);



// ----------------------------------------------------------------------------
pi = 3.14159265;


// ----------------------------------------------------------------------------
function segments(diameter) = min(50, ceil(diameter*6));


// ----------------------------------------------------------------------------
// internal - true = clearances for internal thread (e.g., a nut).
//            false = clearances for external thread (e.g., a bolt).
//            (Internal threads should be "cut out" from a solid using
//            difference()).
// n_starts - Number of thread starts (e.g., DNA, a "double helix," has
//            n_starts=2).  See wikipedia Screw_thread.
module metric_thread(diameter=8, pitch=1, length=1, internal=false, n_starts=1)
{
   // Number of turns needed.
   n_turns = floor(length/pitch);
   n_segments = segments(diameter);
   h = pitch * cos(30);

   union() {
      intersection() {
         // Start one below z = 0.  Gives an extra turn at each end.
         for (i=[-1*n_starts : n_turns+1]) {
            translate([0, 0, i*pitch]) {
               metric_thread_turn(diameter, pitch, internal, n_starts);
            }
         }

         // Cut to length.
         translate([0, 0, length/2]) {
            cube([diameter*1.1, diameter*1.1, length], center=true);
         }
      }

      // Solid center, including Dmin truncation.
      if (internal) {
         cylinder(r=diameter/2 - h*5/8, h=length, $fn=n_segments);
      } else {

         // External thread includes additional relief.
         cylinder(r=diameter/2 - h*5.3/8, h=length, $fn=n_segments);
      }
   }
}


// ----------------------------------------------------------------------------
// Input units in inches.
// Note: units of measure in drawing are mm!
module english_thread(diameter=0.25, threads_per_inch=20, length=1,
                      internal=false, n_starts=1)
{
   // Convert to mm.
   mm_diameter = diameter*25.4;
   mm_pitch = (1.0/threads_per_inch)*25.4;
   mm_length = length*25.4;

   echo(str("mm_diameter: ", mm_diameter));
   echo(str("mm_pitch: ", mm_pitch));
   echo(str("mm_length: ", mm_length));
   metric_thread(mm_diameter, mm_pitch, mm_length, internal, n_starts);
}


// ----------------------------------------------------------------------------
module metric_thread_turn(diameter, pitch, internal, n_starts)
{
   n_segments = segments(diameter);
   fraction_circle = 1.0/n_segments;
   for (i=[0 : n_segments-1]) {
      rotate([0, 0, i*360*fraction_circle]) {
         translate([0, 0, i*n_starts*pitch*fraction_circle]) {
            thread_polyhedron(diameter/2, pitch, internal, n_starts);
         }
      }
   }
}


// ----------------------------------------------------------------------------
// z (see diagram) as function of current radius.
// (Only good for first half-pitch.)
function z_fct(current_radius, radius, pitch)
   = 0.5*(current_radius - (radius - 0.875*pitch*cos(30)))
                                                       /cos(30);

// ----------------------------------------------------------------------------
module thread_polyhedron(radius, pitch, internal, n_starts)
{
   n_segments = segments(radius*2);
   fraction_circle = 1.0/n_segments;

   h = pitch * cos(30);
   outer_r = radius + (internal ? h/20 : 0); // Adds internal relief.
   //echo(str("outer_r: ", outer_r));


   inner_r = radius - 0.875*h; // Does NOT do Dmin_truncation - do later with
                               // cylinder.

   // Make these just slightly bigger (keep in proportion) so polyhedra will
   // overlap.
   x_incr_outer = outer_r * fraction_circle * 2 * pi * 1.005;
   x_incr_inner = inner_r * fraction_circle * 2 * pi * 1.005;
   z_incr = n_starts * pitch * fraction_circle * 1.005;

   /*    
    (angles x0 and x3 inner are actually 60 deg)

                          /\  (x2_inner, z2_inner) [2]
                         /  \
   (x3_inner, z3_inner) /    \
                  [3]   \     \
                        |\     \ (x2_outer, z2_outer) [6]
                        | \    /
                        |  \  /|
             z          |   \/ / (x1_outer, z1_outer) [5]
             |          |   | /
             |   x      |   |/
             |  /       |   / (x0_outer, z0_outer) [4]
             | /        |  /     (behind: (x1_inner, z1_inner) [1]
             |/         | /
    y________|          |/
   (r)                  / (x0_inner, z0_inner) [0]

   */

   x1_outer = outer_r * fraction_circle * 2 * pi;

   z0_outer = z_fct(outer_r, radius, pitch);
   //echo(str("z0_outer: ", z0_outer));

   //polygon([[inner_r, 0], [outer_r, z0_outer], 
   //        [outer_r, 0.5*pitch], [inner_r, 0.5*pitch]]);
   z1_outer = z0_outer + z_incr;

   // Rule for triangle ordering: look at polyhedron from outside: points must
   // be in clockwise order.
   polyhedron(
      points = [
                [-x_incr_inner/2, -inner_r, 0],                                    // [0]
                [x_incr_inner/2, -inner_r, z_incr],                    // [1]
                [x_incr_inner/2, -inner_r, pitch + z_incr],            // [2]
                [-x_incr_inner/2, -inner_r, pitch],                                // [3]

                [-x_incr_outer/2, -outer_r, z0_outer],                             // [4]
                [x_incr_outer/2, -outer_r, z0_outer + z_incr],         // [5]
                [x_incr_outer/2, -outer_r, pitch - z0_outer + z_incr], // [6]
                [-x_incr_outer/2, -outer_r, pitch - z0_outer]                      // [7]
               ],

      triangles = [
                [0, 3, 4],  // This-side trapezoid, bottom
                [3, 7, 4],  // This-side trapezoid, top

                [1, 5, 2],  // Back-side trapezoid, bottom
                [2, 5, 6],  // Back-side trapezoid, top

                [0, 1, 2],  // Inner rectangle, bottom
                [0, 2, 3],  // Inner rectangle, top

                [4, 6, 5],  // Outer rectangle, bottom
                [4, 7, 6],  // Outer rectangle, top

                [7, 2, 6],  // Upper rectangle, bottom
                [7, 3, 2],  // Upper rectangle, top

                [0, 5, 1],  // Lower rectangle, bottom
                [0, 4, 5]   // Lower rectangle, top
               ]
   );
}


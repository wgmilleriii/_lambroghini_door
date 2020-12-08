// https://www.robmiles.com/journal/2020/1/30/using-arrays-in-openscad
// https://piano.interlochen.org/wiki/135/mediawiki-1.35.0/index.php/Piano_Technology_Department#2020_tools
// https://github.com/wgmilleriii/_lambroghini_door


// https://www.youtube.com/watch?v=FCPElvdzgmc&feature=emb_logo

module yellow() {
	
	
	difference() {

	// down 

	translate([0,0,-grey_depth1])	{
		// move to first grey pin

		translate([-grey_width,0,0]) 

		{
	
			// two support brackts		
			translate([-yw*.2,-yr/2,0]) 
			cube([yr, yr, yh]);

			translate([-yw*.8,-yr/2,0]) 
			cube([yr, yr, yh]);

			translate([-yw*.25,-yr/2,0]) 
			cube([yr, yr, yh]);

			translate([-yw*.75,-yr/2,0]) 
			cube([yr, yr, yh]);


			rounded_beam(yr, yw, yir);

			translate([0,0,yh])
			rounded_beam(yr, yw, yir);

		}		

		// left
		
	}

	pins();
	}


}

module pins() {
		translate([-grey_width,0,-grey_depth1-2]) 
		cylinder(yh+10,yellow_pin_radius, yellow_pin_radius);

		translate([-grey_width-yw,0,-grey_depth1-2]) 
		cylinder(yh+10,yellow_pin_radius, yellow_pin_radius);

}
module rounded_beam(height, length, circle_radius) {
			// first yir
			cylinder(height,circle_radius, circle_radius);

			// last yir
			translate([-length,0,0]) {
				
				translate([0,-height/2,0]) 
				cube([length, height, height]);
				
				cylinder(height,circle_radius, circle_radius);


			}

}
module frame() {

	difference() {

		union() {
			hull() {
				cube([10,10,2]);

				translate([-grey_width,0,0])
				cylinder(2,5,5);
			}

			hull() {
				translate([-grey_width,0,0])    
				cylinder(2,5,5);

				translate([-grey_width*grey_angle,-grey_width,0])
				cylinder(2,5,5);
			}

			translate([-grey_width,0,-grey_depth1]) {
				difference() {
					cylinder(yh, grey_sleeve_width, grey_sleeve_width);
				
					translate([0,0,-10]) scale([1,1,3])
					cylinder(yh, yellow_pin_radius+1, yellow_pin_radius+1);
				}
			}
		}

		// hold at end of angle
		translate([0,0,-1]) scale([1,1,3])
		translate([-grey_width*grey_angle,-grey_width,0])
		cylinder(2,3,3);
	}


	translate([8,0,0])
	rotate([0,90,0])
	hull() {
		cube([10+door_thickness,10+door_thickness,2]);

		translate([grey_height,5,0])
		cylinder(2,5,5);
	}
}


module cylinder_with_base (c1h,c1r,c2h,c2r) {
	cylinder(c1h,c1r,c1r);
	cylinder(c2h,c2r,c2r);
}

module green_bar() {
	/translate([-grey_width*grey_angle,-grey_width,0])
	
}

door_thickness=2;
grey_width=20;
grey_height=60;
grey_depth1=10;
grey_angle=2;
grey_sleeve_width=4; 

// yellow frame variables
yellow_pin_radius=2;
yh=70; //height
yw=240; // width
yr=2.5; // bar radius
yir=6; // eye radius

yrh=5; // bar radius hiehgt
yrr=7.5;


lam_door();
module lam_door() {
	color("grey")	frame();
	color("yellow") 	yellow();  
	color("black") pins();
	color("green") green_bar();
}
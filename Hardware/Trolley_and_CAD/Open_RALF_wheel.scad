
// Aifred - FabLab Open Source Autonomous Troley
q      =  5;

use <Open_RALF_utils.scad>

play    =  0.3;

axis_di = 16.0;
axis_le = 52.0;
axis_lc = 45.0;
axis_hc =  3.0;
axis_ga =  3.0;


wheel();


module axis() color([0.6,0.6,0.65,1]) {
    translate([0,0,-axis_le]) difference() {
        cylinder(d=axis_di, h=axis_le+10, $fn=axis_di*q);
        translate([-10-axis_di/2+axis_hc,-10,2.9]) cube([10, 20, axis_lc]);
    }
}


module wheel() rotate([0,-90,0]){
    h1= 4.3;
    h2=46.0;
    h3=12.0;
    wt=44.5;
    axis();
    color([0.8,0.8,0.8,1]) {
    difference() {
        cylinder(d1=35,d2=46,h=h1,$fn=46*q);
        cylinder(d=25,h=100,center=true,$fn=25*q);
    }
    translate([0,0,h1   ]) cylinder(d=135,h=h2,$fn=135*q);
    translate([0,0,h1+h2]) cylinder(d1=128,d2=110,h=h3,$fn=135*q);
    }
    //translate([0, 0,h1+1+wt/2]) cylinder(d=175,h=1,$fn=135*q);
    //translate([0, 0,h1+1     ]) cylinder(d=152,h=1,$fn=135*q);
    color([0.2,0.2,0.2,1]) 
    difference()  {
        translate([0, 0,h1+1+wt/2]) rotate_extrude(convexity = 10, $fn = 100)
        translate([60.5, 0, 0]) circle(r = 27, $fn = 55*q);
        translate([-200,-200,h1+1+wt]) cube([400,400,100]);
        translate([-200,-200,h1+1-100]) cube([400,400,100]);
    }
    
}


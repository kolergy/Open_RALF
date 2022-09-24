
// Aifred - FabLab Open Source Autonomous Troley
q      =  5;



play    =  0.3;

axis_di = 16.0;
axis_le = 52.0;
axis_lc = 45.0;
axis_hc =  3.0;
axis_ga =  3.0;

feet_le = 25.0;
feet_wi = 25.0;
feet_di = 10.0;
feet_th =  1.5;

fix_ra  =  3.0;

feet(100);

ax_fix();
//wheel();


module ax_fix() color([0.99,0.7,0.1,1]){
    translate([ (axis_le+5)/2, feet_wi/2,-axis_di*1.25]) difference() {
        rcube([axis_le+5, axis_di*2.5, axis_di*2.5], fix_ra);
        translate([-50,-50,-50]) cube([100,50,100]);
        translate([-(axis_le+5)/2-1.5, 0,0   ]) rotate([0,90,0]) cylinder(d=axis_di+play,h=axis_le,$fn=axis_di*q);
        translate([-15, 0,-axis_di*1.25]) cylinder(d= 8, h=16,$fn=8*q);
        translate([ 10, 0,-axis_di*1.25]) cylinder(d= 8, h=16,$fn=8*q);
        translate([-15, 0,-axis_di*1.25+7]) cylinder(d=12, h= 6,$fn=6  );
        translate([ 10, 0,-axis_di*1.25+7]) cylinder(d=12, h= 6,$fn=6  );
        translate([-(axis_le+5)/2+feet_le/2,0,0]) cylinder(d= 8, h=30,$fn=8*q);
        translate([-(axis_le+5)/2+feet_le/2,0,6]) cylinder(d=12, h=6,$fn=6);
    }
}


module feet(hi) color([0.3,0.3,0.35,1]) {
    cube([feet_le,feet_th,     hi]);
    cube([feet_th,feet_wi,     hi]);
    difference() {
        cube([feet_le,feet_wi,feet_th]);
        translate([feet_le/2,feet_wi/2, -1]) cylinder(d=feet_di, h=100, $fn=feet_di*q);
    }
}


module axis() color([0.6,0.6,0.65,1]) {
    translate([0,0,-axis_le]) difference() {
        cylinder(d=axis_di, h=axis_le+10, $fn=axis_di*q);
        translate([-10-axis_di/2+axis_hc,-10,2.9]) cube([10, 20, axis_lc]);
    }
}


module wheel() translate([-2, feet_wi/2,-axis_di*1.25]) rotate([0,-90,0]){
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


module rcube(siz, rad) {            // rounded cube 
    xi = max(0.0001,siz[0]-2*rad);  // need to always ahve a value > 0
    yi = max(0.0001,siz[1]-2*rad);
    hi = max(0.0001,siz[2]-2*rad);
    minkowski() {
        cube([xi, yi, hi], center=true);
        sphere(r=rad, $fn=2*rad*q);
    }  
}


module srcube(siz, rad) {           // semi rounded cube
    xi = max(0.0001,siz[0]-2*rad);
    yi = max(0.0001,siz[1]-2*rad);
    hi =            siz[2]/2;
    minkowski() {
        cube([xi, yi, hi], center=true);
        cylinder(r=rad, h=hi, center=true, $fn=2*rad*q);
    }  
}
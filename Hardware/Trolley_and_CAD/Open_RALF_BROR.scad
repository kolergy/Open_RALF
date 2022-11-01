
// Open RALF - FabLab Open Source Autonomous Troley
use <Open_RALF_utils.scad>

q      =  5;

T_lenght = 850;
T_widith = 550;
T_height = 880;
W_height = 100;

shelf_thk =  50;
hi_shelf1 = 230;
dz_shlf12 = 400; 
hi_shelf2 = hi_shelf1 + dz_shlf12;

feet_le = 40.0;
feet_wi = 40.0;
feet_di =  8.0;
feet_th =  1.9;
feet_hi = T_height - W_height;

wheel_d = 80;

BROR();


module BROR() {
    translate([-T_lenght/2, -T_widith/2, 0]) rotate([0,0,  0]) feet(feet_hi);
    translate([ T_lenght/2, -T_widith/2, 0]) rotate([0,0, 90]) feet(feet_hi);
    translate([ T_lenght/2,  T_widith/2, 0]) rotate([0,0,180]) feet(feet_hi);
    translate([-T_lenght/2,  T_widith/2, 0]) rotate([0,0,270]) feet(feet_hi);

    translate([          0,           0, 880      ]) top_shelf();
    translate([          0,           0, hi_shelf1]) shelf();
    translate([          0,           0, hi_shelf2]) shelf();
}

module feet(hi) {
    color([0.3,0.3,0.35,1]) translate([0, 0, W_height]) {
        cube([feet_le,feet_th,     hi]);
        cube([feet_th,feet_wi,     hi]);
        difference() {
            cube([feet_le,feet_wi,feet_th]);
            translate([feet_le/2,feet_wi/2, -1]) cylinder(d=feet_di, h=100, $fn=feet_di*q);
        }
    }
    color([0.1,0.1,0.1,1]) translate([feet_le/2+20,feet_wi/2, wheel_d/2]) BROR_Wheel();
}

module top_shelf() color([0.5,0.4,0.3,1]) {
    rcube([T_lenght, T_widith, 20], 5);
}

module shelf() color([0.32,0.32,0.35,1]) translate([0,0,shelf_thk/2]){
    difference() {
        rcube([T_lenght-feet_th*2, T_widith-feet_th*2, shelf_thk          ], 2);
         cube([T_lenght-feet_th*4, T_widith-feet_th*4, shelf_thk-feet_th*2], center=true);
        translate([0,0,-10]) cube([T_lenght-feet_th*4-20, T_widith-feet_th*4-20, shelf_thk], center=true);
    }
}

module BROR_Wheel() {
    rotate([90,0,0]) cylinder(d=wheel_d,h=20,$fn=wheel_d*q, center=true);

}
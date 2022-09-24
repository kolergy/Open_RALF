
// Open RALF - FabLab Open Source Autonomous Troley
use <Open_RALF_utils.scad>

q      =  5;

T_lenght = 850;
T_widith = 550;

feet_le = 40.0;
feet_wi = 40.0;
feet_di =  8.0;
feet_th =  1.9;

translate([-T_lenght/2, -T_widith/2,   0]) feet(100);
translate([          0,           0, 880]) shelf();

module feet(hi) color([0.3,0.3,0.35,1]) {
    cube([feet_le,feet_th,     hi]);
    cube([feet_th,feet_wi,     hi]);
    difference() {
        cube([feet_le,feet_wi,feet_th]);
        translate([feet_le/2,feet_wi/2, -1]) cylinder(d=feet_di, h=100, $fn=feet_di*q);
    }
}

module shelf() {
    rcube([T_lenght, T_widith, 20], 5);
}

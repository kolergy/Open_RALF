
// Aifred - FabLab Open Source Autonomous Troley
q      =  5;



use <Open_RALF_utils.scad>
use <Open_RALF_BROR.scad>
use <Open_RALF_wheel.scad>
use <Open_RALF_wheel_fix.scad>


BROR();

translate([0,-210,175/2]) rotate([0, 90+plate_an,  0]) {
    wheel();
    ax_fix();
}
translate([0, 210,175/2]) rotate([0, 90-plate_an,180]) {
    wheel();
    ax_fix();
}
ry_plate();

plate_th =  10;
plate_wi = 412;
plate_le = 470;
plate_an = -23;

module ry_plate() {
    translate([-40, 0,82]) rotate([0,plate_an,0]) 
        translate([0,-plate_wi/2,-plate_th/2]) cube([plate_le,plate_wi,plate_th]);

}



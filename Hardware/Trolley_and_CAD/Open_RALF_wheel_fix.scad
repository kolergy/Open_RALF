q      =  5;



use <Open_RALF_utils.scad>

play    =  0.3;

fix_ra  =  3.0;

axis_di = 16.0;
axis_le = 52.0;
feet_le = 40.0;
feet_wi = 40.0;


ax_fix();

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
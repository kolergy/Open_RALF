q  = 10;       // Quality level of the rounded edges 1 rough 10 super smooth
wi = 100;      // plate widith
hi = 50;       // hinge lenght
di = 30;       // Hinge Diameter
th = 15;       // plate thickness
pl =  0.2;     // play
n  =  5;       // number of hinges (need to be odd)
dh = 10;       // fix hole diam
nh = [2,2];    // number of holes in rows

nr = len(nh);  // number of rows
lx = (wi-di)/2;// lengh available for holes in x
ly = hi:       // lengh available for holes in y
dx = 20;       // fix holes spacing x
dy = 10;       // fix holes spacing y


module srcube(siz, rad) {           // semi rounded cube
    xi = max(0.0001,siz[0]-2*rad);
    yi = max(0.0001,siz[1]-2*rad);
    hi =            siz[2]/2;
    minkowski() {
        cube([xi, yi, hi], center=true);
        cylinder(r=rad, h=hi, center=true, $fn=10*q);
    }  
}

module hinge() {
    difference() {
        translate([0,0,-di/2+th/2]) srcube([wi,hi,th], 5);
        rotate([90,0,0]) cylinder(d=di+2*pl, h=hi+1, center=true, $fn=8*q);
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*dx,j*dy,-di/2-1]) cylinder(d=5.2, h=th+2, $fn=6*q);
                translate([i*dx,j*dy,-di/2+th-2]) cylinder(d1=5.2, d2=9, h=2.01, $fn=6*q);
            }
        }
    }
    for(i=[0:n-1]){
        if(i%2 ==1){
            translate([0,-hi/2+(i)*(hi/n),0]) difference() {
                union() {
                    rotate([-90,0,0]) cylinder(d=di, h=hi/n-pl, $fn=8*q);
                    translate([0,0,-di/2]) cube([di*0.6,hi/n-pl, th]);
                }
                translate([0,-pl,0]) rotate([-90,0,0]) cylinder(d=di*0.5, h=hi/n+pl, $fn=8*q);
            }
        } else translate([0,-hi/2+(i)*(hi/n),0]){
            rotate([-90,0,0]) cylinder(d=di, h=hi/n-pl, $fn=8*q);
            translate([-di*0.6,0,-di/2]) cube([di*0.6,hi/n-pl, th]);
        }
        translate([0,hi/2-pl,0]) rotate([-90,0,0]) cylinder(d=di, h=pl, $fn=8*q);

    }
    rotate([-90,0,0]) cylinder(d=di*0.5-2*pl, h=hi, center=true, $fn=8*q);
}
hinge();
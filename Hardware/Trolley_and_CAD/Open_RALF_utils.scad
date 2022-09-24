q      =  5;


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
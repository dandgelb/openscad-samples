module stairs_up() {
    cube([36,36,7]);
f1 = 36;
f3 = 7;

for(i=[0:5]) {
    x = f1 + i * 11;
    z = f3 + i * 7;
    translate([x,0,z]) {
        cube([11,36,7]);
    }
    
}
translate([102, 0, 49]) {
    cube([36,36,7]);
}

translate([102, -11, 56]) {
cube([36,11,7]);
}
}

module ground_floor() {
cube([36,36,7]);
f1 = 36;
f3 = 7;

for(i=[0:5]) {
    x = f1 + i * 11;
    z = f3 + i * 7;
    translate([x,0,z]) {
        cube([11,36,7]);
    }
    
}
translate([102, 0, 49]) {
    cube([36,36,7]);
}

translate([102, -45, 63]) {
    cube([36,36,7]);
}

f4 = 91;
f6 = 70;
for(i=[0:5]) {
    p = f4 - i * 11;
    q = f6 + i * 7;
    translate([p, -45, q]) {
        cube([11, 36, 7]);
    }
}

translate([0, -45, 112]) {
    cube([36,36,7]);
}

translate([0, -11, -7]) {
cube([36,11,7]);
}

translate([102, -11, 56]) {
cube([36,11,7]);
}

}

module ground_walls() {
    //side - wall 
rotate([90,0,0]) {
 translate([0, -126, -36]) {
    color("lightgrey", 0.7) square([138,370]);
 }
}

rotate([90,0,90]) {
 translate([-207, -126, 0]) {
    //color("lightgrey", 0.5) square([243,370]);
 }
}
//ground - ceiling
translate([0, -207, 119]) {
    //color("lightblue", 0.3) square([138, 160]);
}
//ground - floor
translate([0, -207, -7]) {
    //color("lightblue", 0.3) square([102, 207]);
}
translate([0, -207, -7]) {
    color("lightblue", 0.3) square([138, 157]);
}
//first - ceiling
translate([0, -207, 245]) {
    //color("lightblue", 0.3) square([138, 160]);
}

//base - floor
translate([0, -207, -126]) {
    color("lightblue", 0.3) square([138, 160]);
}
}

module sample() {
    cube([36,36,7]);
}

module translate_ground() {
    translate([0, 0, 126]) {
        color("blue") ground_floor();
    }
}

module translate_stairs_up() {
    translate([0, 0, -84]) {
        color("lightgreen") stairs_up();
    }
    m = 11; 
    n = 91;
    for(i=[0:5]) {
        p = -(m + i * 11);
        q = -(n + i * 7);
        translate([0, p, q]) {
            color("lightgreen") cube([36,11,7]);
        }
    }
}

module body() {
    translate([100,-50,-14]) {
        //color("red", 0.8) cube([24, 12, 72]);
    }
}

module ground_stair_clearance() {
    translate([102, -47, -21]) {
     color("lightgreen") cube([36,36,7]);
    }    
}
body();
ground_floor();
ground_walls();
translate_ground();
translate_stairs_up();
ground_stair_clearance();


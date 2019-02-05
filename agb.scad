module ground() {
    color("lightgreen", 0.7) square([46*12,36*12]);
    translate([9*12+6,0,1]) {
        color("lightgrey", 0.7) square([13*12+6,24*12]);
    }
    translate([23*12,0,1]) {
        color("lightgrey", 0.7) square([17*12+6,27*12+6]);
    }
}

module hall_ota() {
    cube([9*12+6, 4*12, 7]);
    translate([0, 4*12, 0]) {
        cube([2*12, 2*12, 7]);
    }
}

module side_ota() {
    translate([0, 0, 0]) {
        cube([2*12, 22*12, 2*7]);
    }
}
module gate_level() {
    translate([-12*12, 22*12, 0]) {
        color("Salmon") cube([14*12, 14*12, 7]);
    }
}

module main_ota() {
    translate([2*12, 21*12, 0]) {
        cube([7*12+6, 15*12, 2*7]);
    }
    //step
    translate([2*12, 20*12, 0]) {
        cube([7*12+6, 14*12, 7]);
    }
    //side step
    translate([2*12, 24*12, 0]) {
        cube([8*12+6, 12*12, 7]);
    }
}

module compound_wall() {
    //left
    translate([46*12-10,0,0]) {
        cube([10, 36*12, 5*12]);
    }
    //front
    translate([0,36*12-10,0]) {
        cube([46*12,10,5*12]);
    }
    //front right
    translate([-24*12,36*12-10,0]) {
        cube([12*12,10,5*12]);
    }
    
}

module coconut_grove() {
    translate([24, 19*12, 0]) {
        difference() {
            cylinder(h=7, r=2*12, center=false);
            cylinder(h=8, r=1.25*12, center=false);
        }
    }
}

module left_room() {
    translate([-6*12, 6*12, 0]) {
    color("grey", 0.9) cube([6*12, 16*12, 10*12]);
    }
}

module right_room() {
    translate([9*12+6, 0, 0]) {
    color("grey", 0.9) cube([13*12+6, 24*12, 10*12]);
    }
}
module other_room() {
    translate([23*12, 0, 0]) {
    color("grey", 0.9) cube([17*12+6, 27*12+6, 10*12]);
    }
}
module rooms() {
    //left room
    left_room();
    //right_room
    right_room();
    //other room
    other_room();
} 

//motor chamber
module motor_chamber() {
    translate([34*12, 32*12,0]) {
        difference() {
            color("green", 0.9) cube([6*12, 4*12, 7]);
            translate([6,6,0]) {
                color("green", 0.9) cube([5*12, 3*12, 8]);
            }
        }
    }
}
//lawn

module lawn() {
    
        translate([46*12,36*12,2]) {
            rotate ([0,0,180]) {
            intersection(){
                color("green", 0.9) square(12*8);
                color("green", 0.9) circle(12*8);
            }
        } // square and circle
    }
}



module ortho() {
    ground();
    hall_ota();
    side_ota();
    main_ota();
    gate_level();
    coconut_grove();
    compound_wall();
    rooms();
    motor_chamber();
    lawn();
}

module center() {
    translate([10*15, -10*12,0]) {
    //translate(){
        ortho();
    }
}

center();
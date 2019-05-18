module ground() {
    W = 60*3.281;
    H = 40*3.281;
    f = 1;
    
    color("lightgreen", 0.7) square([H*f,W*f]);
   
    
    lw = 25;
    lh = H;
    translate([0, 0, 1]) {
        //color("grey", 0.7) square([H,lw]);
    }   
    
    tw = W;
    th = 12;
    translate([0, 0, 1]) {
        //color("grey", 0.7) square([th,tw]);
    }
    
    w = 60;
    h = 40;
    translate([12, 25, 1]) {
        color("blue", 0.7) square([h,w]);
    }
    
}

module fencing() {
    h = 5;
    //top
    cube([1, 60*3.281, h]);
    //bottom
    translate([40*3.281, 0, 0]) {
        cube([1, 60*3.281, h]);
    }
    //left
    cube([40*3.281, 1, h]);
    //right
    translate([0, 60*3.281, 0]) {
        cube([40*3.281, 1, h]);
    }
}


 module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
       
       // preview unfolded (do not include in your function
       z = 0.08;
       separation = 2;
       border = .2;
       translate([0,w+separation,0])
           //cube([l,w,z]);
       translate([0,w+separation+w+border,0])
           //cube([l,h,z]);
       translate([0,w+separation+w+border+h+border,0])
           //cube([l,sqrt(w*w+h*h),z]);
       translate([l+border,w+separation+w+border+h+border,0])
           polyhedron(
                   points=[[0,0,0],[h,0,0],[0,sqrt(w*w+h*h),0], [0,0,z],[h,0,z],[0,sqrt(w*w+h*h),z]],
                   faces=[[0,1,2], [3,5,4], [0,3,4,1], [1,4,5,2], [2,5,3,0]]
                   );
       translate([0-border,w+separation+w+border+h+border,0])
           polyhedron(
                   points=[[0,0,0],[0-h,0,0],[0,sqrt(w*w+h*h),0], [0,0,z],[0-h,0,z],[0,sqrt(w*w+h*h),z]],
                   faces=[[1,0,2],[5,3,4],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
                   );
  }
   
   //prism(6, 6, 6);


module water() {
    h = 3;
    w = 60 * 3.281;
    translate([0, 0, 1]){
        color("blue") square([h, w]);
    }
    
    translate([3, 25+60+6, 1]){
        color("blue") square([12, 12]);
    }
    
    //border
    linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
    translate([20, 20, 0])
     polygon( points=[[0,0],[3,3],[0,6]] );
    //
    //cylinder(10,20,15,$fn=3);
    translate([12,25,0]) {
        rotate ([90+45,0,0]) {
            //prism(40, 6, 6);
        }
    }
    translate([12,25+60+6,0]) {
        rotate ([90+45,0,0]) {
            //prism(40, 6, 6);
        }
    }
    
     translate([12-8,25-6,0]) {
        rotate([0,45+90,0]) { 
            rotate ([0,0,90]) {
                //prism(60+10, 6, 6);
            }
        }
    }
    translate([12+40,25-6,0]) {
        rotate([0,45+90,0]) { 
            rotate ([0,0,90]) {
               // prism(60+10, 6, 6);
            }
        }
    }
}

module full() {
    translate([-20*3.281, -30*3.281, 0]) {
        ground();
        fencing();
        water();
    }
    
}

full();

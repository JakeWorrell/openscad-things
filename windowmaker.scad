frameThickness=1;
hingeGap = 0.2;
hingeThickness = 0.1;

mainHeight = 40;
raisedSectionLift = 8;

doorHeight = 30;
doorWidth = 10;

translate([0,raisedSectionLift,0]) {
    doubleFrame(10,mainHeight,30); //leftmost window
    translate([10,0,0])
        hinge(mainHeight);
    translate([10+hingeGap,0,0])
        doubleFrame(60,mainHeight,30);
}
//TODO Add hinge here

translate([60+10+(hingeGap*2),0,0]) {
    frame(60, mainHeight+raisedSectionLift,[0,-frameThickness,0]);
    
    frame(doorWidth,doorHeight); //door
    
    translate([0,doorHeight]) 
        quadFrame(60,18,30,5);
    
    
}

module quadFrame(width, height, horizontalBreak, verticalBreak) {
    union() {
        doubleFrame(width,height,verticalBreak);
        frame(horizontalBreak,height);
    }
}

module doubleFrame(width, height, break){
    union() {
        frame(width,height);
        translate([0,break-frameThickness])
            frame(width,height-break+frameThickness);
    }
}

module frame(width, height, offsetInternal=[0,0]) {

    linear_extrude(frameThickness) {
        difference() {
            square([width,height]);
            translate(offsetInternal){
                offset(-frameThickness){
                    square([width,height]-offsetInternal);
                }
            }
        }
    }
}

module hinge(height) {
    
    linear_extrude(hingeThickness) {
        square([hingeGap,height]);   
    }
}
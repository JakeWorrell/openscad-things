internalDiameter = 3.1;
externalDiameter = 8;
thickness = 0.8;

linear_extrude(thickness) {
    scale(.1) { // scale for increased resolution
        difference() {
            circle(d=externalDiameter*10);
            circle(d=internalDiameter*10);
        }
    }
}
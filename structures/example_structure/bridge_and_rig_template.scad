bridgeLength = 120;
bridgeSupportSize = 10;
weightAttachCutout = 3;
gapWidth = 100;

bridgeWidth = 25;

testingRig();
basicBridge();

module basicBridge() {
	translate([-bridgeLength/2, -bridgeWidth/2, -bridgeSupportSize]) {
		difference() {
			cube([bridgeLength, bridgeWidth, 20]);
			translate([bridgeLength-bridgeSupportSize, -1, -1]) cube([bridgeSupportSize+1, bridgeWidth+2, bridgeSupportSize+1]);
			translate([-1, -1, -1]) cube([bridgeSupportSize+1, bridgeWidth+2, bridgeSupportSize+1]);
			translate([bridgeLength/2, -bridgeWidth/2, 20]) weightCutout();
		}
	}
}

module weightCutout() {
	translate([-weightAttachCutout/2, bridgeWidth/2-1, -weightAttachCutout]) cube([weightAttachCutout, bridgeWidth+2, weightAttachCutout+1]);
}

module testingRig() {
	assign(width=120, general=20, height=70, base=3) 
	translate([0, 0, -height]) {
		color([0.8,0.5,0]) translate([-general-gapWidth/2, -width/2]) cube([general, width, height]);
		color([0.8,0.5,0]) translate([gapWidth/2, -width/2]) cube([general, width, height]);
		color([0.8,0.4,0]) translate([-gapWidth/2, -width/2]) cube([gapWidth, width, base]);
	}
}




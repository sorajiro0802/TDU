#include "colors.inc"
#include "woods.inc"
#include "metals.inc"
camera {
	location <0, 3, -3>
	look_at <0, 0, 0>
}

light_source{<0, 5, -5>White}

plane {<0, 1, 0>, -0.5
	pigment{ checker White Black}
}
cylinder {<0, 0, -0.5>, <0, 0, 0.5>, 0.5
	pigment{ color Yellow}
}
box{<0.5, -0.5, -0.5>, <1, 0.5, 0.5>
	pigment{color Red}
}
sphere{<-1, 0, 0>, 0.5
	pigment{ color White}
}
cylinder{<-1, 0, 0>, <2, 0, 0>, 0.1
	texture{ T_Silver_1A}
	//pigment{ color Blue}
}

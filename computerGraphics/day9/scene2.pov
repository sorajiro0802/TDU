#include "colors.inc"

camera {
	location <0, 3, -3>
	look_at <0, 0, 0>
}

light_source{
	<0, 5, -5> 
	White
}

plane {<0, 1, 0>, -0.5
	pigment{ checker White Black}
}
cylinder {<0, 0, -0.5>, <0, 0, 0.5>, 0.5
	pigment{ color Yellow}
}

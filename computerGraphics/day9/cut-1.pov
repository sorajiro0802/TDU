#include "colors.inc"

camera {
	location <0, 3, -5>
	look_at <0, 0, 0>
}
light_source { <0, 5, -5>, White}

plane {	<0, 1, 0> , -1.5 pigment{checker Black White}}

difference {
	intersection{
		sphere {
			<-0.5, 0, 0>, 1
			pigment { color Blue}
		}
		sphere {
			<0.5, 0, 0>, 1
			pigment { color Red}
		}
		rotate <0, 30, 0>
	}
	cylinder {<1, 0, 0>,<-1, 0, 0>, 0.5
		pigment { color Green}
	}
	rotate < 0, 60, 0>
}
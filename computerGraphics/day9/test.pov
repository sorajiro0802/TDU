#include "colors.inc"
camera {
	location <0, 3, -10>
	look_at < 0, 0, 0>
	angle 60
}
light_source {
	<0, 5, -5> color White
}
sphere{
	<0, 0, 0>, 2
	pigment{ color Blue }
}
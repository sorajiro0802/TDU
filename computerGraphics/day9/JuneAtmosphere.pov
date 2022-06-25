#include "colors.inc"
#include "woods.inc"

camera {
	location <2, 4, 5>
	look_at <0, -0.3, 0>
}
light_source { <0, 5, 5>, White}

plane {	<0, 1, 0> , -1.5 texture{T_Wood7}}

prism {
	#declare r =3;
	linear_sweep
	linear_spline
	-2, 0.5
	3
	<r*cos(0), r*sin(0)>
	<r*cos(2*pi/3), r*sin(2*pi/3)>
	<r*cos(4*pi/3), r*sin(4*pi/3)>
	pigment{ rgbf<1, 1, 1, 0.3>}
}
#declare n = 12;
#declare cnt = 0;
#declare azukiX = array[n]{0, 3, -1.5, -1.5, 0, 0, -1.5, 1, 1, 2, -1.3, -1.3}
#declare azukiZ = array[n]{0, 0, -2.6, 2.6, 1.8, -1.8, 0, 1.3, -1.3, 0, 1.3, -1.3}
#while(cnt < n)
	sphere{ <azukiX[cnt], 1, azukiZ[cnt]>,0.4
		scale<0.8, 0.5, 0.8>
		pigment{rgb<125/255, 0, 34/255>}
	}
	#declare cnt = cnt + 1;
#end
	
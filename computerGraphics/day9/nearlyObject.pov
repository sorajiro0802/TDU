#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"


camera {
	location <0.7, 10, -2>
	look_at <-1, 3, 4>
	angle 100
}
light_source{<2, 10, -4>White}

plane {<0, 1, 0>, -0.5
	pigment{ 
		wood color_map { [0 rgb <0.9,0.7,0.3>][1 rgb <0.8,0.5,0.2>]
	} 
	turbulence 0.5
	scale <1, 1, 20>*0.2
	}
}
union{
	difference{
		cylinder{<0, 8, 0>, <0, 0, 0>, 1
			texture{ White_Wood}
		}
		cylinder{<0, 7.8, 0>, <0, 8.1, 0>, 0.9
			texture{ White_Wood}
		}
	}

}
	text{
		ttf "timrom.ttf",
		 "K.S",
		0.2,0
		rotate <90, 0, -180>
		scale 0.8
		translate<0.6, 7.8, -0.3>
		texture{DMFWood1}
	}
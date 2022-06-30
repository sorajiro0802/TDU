#include "colors.inc"

#macro parts(r)
sphere_sweep{ 
  linear_spline
  2,
  <0,0,0>,r
  <0,-2,0>,r
  }
#end

background { color Cyan }
camera{
 location <0, 0,-10>
 look_at<0,0,0>    }
light_source{ < 0,5,-10> color White}

#macro finger()
union{ 
 object{    parts(0.4)   }
 object{    parts(0.4)
       rotate<0,0,-30>
       translate <1,2,0>  }

 pigment { color Blue}
}
#end

#macro hand(r)
// hand
union{
#for(c, 0, 3, 1)
	object{finger()
			rotate<0, 0, c*20>
			translate<-c, -c/3, 0>
	}
#end
	union{
		object{
			parts(0.5)
			rotate<0, -1, 120>
			translate<0, -2, 0>
		}
		object{
			parts(0.5)
			rotate<0, 0, -10>
			translate<2.3, 1.2,0>
		}
	}
		object{
			parts(0.6)
			translate<-0.5, -2.5, 0>
		}
		object{
			parts(0.6)
			translate<-0.5, -5.5, 0>
		}

rotate<0, r, 0>
scale(0.4)
}
#end

object{
	hand(0)
	translate<0, 4, 0>
	rotate<0, 0, 40+40*cos(-2*pi*clock)>
}
object{
	hand(-180)
	translate<0, 4, 0>
	rotate<0, 0, -40-40*cos(2*pi*clock)>
}





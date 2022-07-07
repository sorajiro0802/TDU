#include "colors.inc"
#include "woods.inc"

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
 location <5,9,-15>
 look_at<0,0,0>
 angle 90
 }

plane{
 <0,1,0>, -5.5
 pigment { color White}
}

light_source{ < 10,10,-10> color White}
light_source{ <-10,10,-10> color White}
light_source{ < 0,5,-10> color White}

#if( clock <0.5 )
#declare ck1=clock*2;
#else
#declare ck1=1;
#end

#if( clock <0.5 )
#declare ck2=0;
#else
#declare ck2=(clock-0.5)*2;
#end

union{

cylinder{            // Body
 <0,-1,0>,<0,3,0>,1
 scale<1,1,0.3> texture{T_Wood20}  }

sphere{             // Head
 <0,0,0>,1.0  texture{T_Wood15}
 translate<0,4,0>
 }
 

union{            // right_leg
 object{ parts(0.4) }     // upper
 object{ parts(0.4)       // lower
    translate <0,-2,0> }
 pigment { color Blue}
 translate<-0.5,-1,0> 
}

union{            // left_leg
 object{ parts(0.4) }   // upper
 object{ parts(0.4)     // lower
    translate <0,-2,0> }
 pigment { color Blue}
 translate<0.5,-1,0> 
} 
 /*
union{            // right_hand
 object{ parts(0.4) }   // upper
 object{ parts(0.4)     // lower
 
//   rotate<0,0,-90>     // attension !!

   translate <0,-2,0>}
 pigment { color Blue}

rotate<0,0,-180*ck1>       // attension!!
rotate<-180*ck2,0,0>
 translate<-1.3,2.7,0> 
}

union{            // left_hand
 object{ parts(0.4) }   // upper
 object{ parts(0.4)    // lower
    translate <0,-2,0> }
 pigment { color Blue}
rotate<0,0,180*ck1>       // attension!!
rotate<-180*ck2,0,0>
 translate<1.3,2.7,0> 
}
*/ 
}
#macro parts(r)
sphere_sweep{ 
  linear_spline
  2,
  <0,0,0>,r
  <0,-2,0>,r
  }
#end

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
union{
	object{
		hand(0)
		translate<cos(-2*pi*clock), 5-0.2*clock, 0>
		rotate<0, 0, 80+40*cos(-2*pi*clock)>
	}
	object{
		hand(-180)
		translate<-2*cos(2*pi*clock), 5-0.2*clock, 0>
		rotate<0, 0, -80-40*cos(2*pi*clock)>
	}
	translate<0, 1.6, -0.2>
}



          
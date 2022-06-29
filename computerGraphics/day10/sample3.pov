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
 location <0,0,-10>
 look_at<0,0,0>    }
light_source{ < 0,5,-10> color White}

//case-1
union{ 
 object{    parts(0.4)   }
 object{    parts(0.4)
       rotate<0,0,45>
       translate <0,-2,0>  }

 rotate<0,0,45>
 pigment { color Blue}
}



union{ 
 object{    parts(0.4)   }
 object{    parts(0.4)
         translate <0,-2,0>  }

 rotate<0,0,45>
 translate<1.5,0,0>
 pigment { color Blue}
}

union{ 
 object{    parts(0.4)   }
 object{    parts(0.4)
               translate <0,-2,0>  }

  rotate<0,0,-45> 
 translate<-1.5,0,0>
 pigment { color Blue}
}






#if( clock<0.5 )
#declare ck=clock*2;
#else
#declare ck=(1-clock)*2;
#end



union{ 
 object{    parts(0.4)   }
 object{    parts(0.4)
//       rotate<0,0,90*clock>
         translate <0,-2,0>  }

 rotate<0,0,180>
 translate<1.5,0,0>
 pigment { color Blue}
}

union{ 
 object{    parts(0.4)   }
 object{    parts(0.4)
//         rotate<0,0,-90*clock>
               translate <0,-2,0>  }
  rotate<0,0,-90> 
 translate<-1.5,0,0>
 pigment { color Blue}
}



 
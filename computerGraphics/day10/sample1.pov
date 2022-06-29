#include "colors.inc"

background{Cyan}
camera{
 location <0,6,-10>
 look_at<0,0,0>    }
 
light_source{ < 0,5,-10> color White}

/*
lathe {
 linear_spline
  5,<0,0>, <1,1>, <3,2>, <2,3>, <2,4>
  pigment { Red }
  finish { ambient .1  phong .75 }
}
*/

/*

 lathe {
 cubic_spline
  7,<-1,0>,<0,0>, <1,1>, <3,2>, <2,3>, <2,4>,<4,4>
  pigment { Red }
  finish { ambient .1  phong .75 }
}
*/

/*

 sphere_sweep {
    linear_spline
    4,
    <-3, -3, 0>, 0.5
    <-3, 3, 0>, 0.5
    < 3, -3, 0>, 0.5
    < 3, 3, 0>, 0.5
    pigment{color Blue}
  }
*/
/*
 sphere_sweep {
    cubic_spline
    6,
    <-2,-3,0>,0.5
    <-3, -3, 0>, 0.5
    <-3, 3, 0>, 0.5
    < 3, -3, 0>, 0.5
    < 3, 3, 0>, 0.5
    <2,3,0>,0.5
    pigment{color Blue}
  }
  */



text {
    ttf "timrom.ttf" "POV-Ray 3.6" 1, 0.2
    scale<2,2,2>
    translate<-6,0,0>
    pigment { Red }
  }

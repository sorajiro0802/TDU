#include "colors.inc"


camera{
 location <0,10,0>
 look_at<0,0,0>    }
 
light_source{ < 0,10,0> color White}

/*
#declare c=-5;
#while(c<6)
  sphere{
      <0,0,0>,0.2
      translate<c,0,0>
      pigment{ color Red}
    }
#declare c=c+1;
#end    */




#for(c,-5,5,1)
  sphere{
      <0,0,0>,0.2
      translate<c,0,0>
 
  #if(c<0)  pigment{ color Red}
  #else  pigment{color Green}
  #end
 }
#end


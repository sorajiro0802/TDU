#include "colors.inc"
camera {
	location <0, 10, 0>
	look_at <0, 0, 0>
	angle 60	
}

light_source { <0, 5, 0> color White}

plane {
	<0, 1, 0>, -1.5
	pigment {color White}
}

#declare I = -2;
#while ( I < 2)
	#declare X = -2;
	#while(X < 2)
			sphere{
				<0, 0, 0>, 0.5
				pigment { color Green}
				#if(X > 0 & I > 0)
					pigment{ color Red}
				#end
			
				translate<X, 0, I>
		}
		#declare X = X+1.2;
	#end
	#declare I = I + 1.2;
#end


//#declare I = -2;
//#while(I  < 3)
//			yoko(I)
//			
//	#declare I = I +1.2;
//#end
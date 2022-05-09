float BP[][][]=
{
 { {0,0},{100,300},{300,300},{400,0} },
 { {0,300},{100,0},{300,0},{400,300} }
};

void setup()
{
  size(400, 400);
  background(0);
  noLoop();
}

void draw()
{
  stroke(color(255,255,255));
  draw_Bezier(BP[0]);
  draw_Bezier(BP[1]);
}

void draw_Bezier(float cp[][])
{
 for(float t=0;t<1;t+=0.05)
 {
  float xs=BezierP(cp[0][0],cp[1][0],cp[2][0],cp[3][0],t);
  float ys=BezierP(cp[0][1],cp[1][1],cp[2][1],cp[3][1],t);
  float xe=BezierP(cp[0][0],cp[1][0],cp[2][0],cp[3][0],t+0.05);
  float ye=BezierP(cp[0][1],cp[1][1],cp[2][1],cp[3][1],t+0.05);
  line(xs,ys,xe,ye);
 }
}

float BezierP(float v0, float v1, float v2,float v3,float t)
 {
   float v=pow((1-t),3)*v0 + 3*pow((1-t),2)*t*v1 + 3*(1-t)*pow(t,2)*v2 + pow(t,3)*v3;
   return(v);
 }

void keyPressed() {
  if ( key== 's' ) { saveFrame("Result.jpg");}  // Save File Name
} 

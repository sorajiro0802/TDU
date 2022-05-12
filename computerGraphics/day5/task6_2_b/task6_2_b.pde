float BP[][][]=
{
 // 耳
 { {200,0},{-200,50},{70,600},{200,0} },
 // 頭上
 { {200,0},{350,80},{150,100},{400,200} },
 // 口元
 { {400,200},{380,390},{250,200},{200,400} },
 // 鼻
 { {370,190},{350,240},{390,230},{393,230} },
 // 目
 { {220,150},{170,120},{240,100},{220,150} },
 // 口
 { {380,270},{250,300},{270,280},{250,250} },
 // 首後ろ
 { {35,275},{35,330},{40,350},{25,400} },
 // 眉
 { {200,60},{210,65},{215,68},{220,70} },
 // シワ
 { {220,230},{180,220},{190,280},{180,300} },
 // 鼻の穴
 { {390,200},{395,202},{395,208},{390,215} }
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
  for(int i = 0; i<10; i++){
    draw_Bezier(BP[i]);
  }
  for(int i = 0; i< 10; i++){
    strokeWeight(2);
    stroke(25.5*i,50,9*i);
    line(BP[i][0][0],BP[i][0][1],BP[i][1][0],BP[i][1][1]);
    line(BP[i][1][0],BP[i][1][1],BP[i][2][0],BP[i][2][1]);
    line(BP[i][2][0],BP[i][2][1],BP[i][3][0],BP[i][3][1]);
  }
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

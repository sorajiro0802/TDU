void setup() {
   size(512,512);
   background(0);
   noStroke();
}

void draw(){
  int i,j;
  for(j=0; j<512;j++){
   for(i=0;i<512;i++){
     //RGB:(255,0,0)、(0,0,255)、(0,255,0)、(255,0,255)
     int rkxy=intp(intp(255,0,i),intp(0,255,i),j);  
     int gkxy=intp(intp(0,0,i),  intp(255,0,i),j); 
     int bkxy=intp(intp(0,255,i),intp(0,255,i),j);
     pixel(i,j,rkxy,gkxy,bkxy);
    }
   } 
  }
  
  
int intp(int v1, int v2, int x)
{
  return( (v2-v1)*x/512+v1 );
}

//
// Don't rewrite and delete following functions!!
//


void keyPressed(){
  if( key== 's' ) {
    saveFrame("Result.jpg");  // Save File Name
  }
}
void pixel(int x, int y, int r,int g, int b)
{
    stroke(color(r,g,b));
    point(x,y);
}

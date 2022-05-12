void setup()
{
   size(500,500);
   background(0);
   stroke(256, 256, 256 ); // 線の色
   strokeWeight(3); // 線の太さsizable(true);
   noLoop();
}


void draw(){

  drawcircle(200,250,250,10);
  drawcircle(100,250,250,30);


  //drawellipse(200,100,250,250,10);
  //drawellipse(100,50,250,250,30);

}

void  drawcircle(int r, int x0,  int y0,  int n) {
  float d,ths,the;
  int xs,ys,xe,ye;
  d=2*PI/n;
  for( int i=0;  i<n ; i++){
    ths=d*i;  
    the=ths+d; 
    xs = int( float(r)*cos(ths) ) + x0;
    ys = int( float(r)*sin(ths) ) + y0;
    xe = int( float(r)*cos(the) ) + x0; 
    ye = int( float(r)*sin(the) ) + y0; 
    line(xs,ys,xe,ye);
  }
}



void  drawellipse(int r1, int r2, int x0,  int y0,  int n) {
  float d,ths,the;
  int xs,ys,xe,ye;
  d=2*PI/n;
  for( int i=0;  i<n ; i++) {
    ths=d*i;  
    the=ths+d;
    xs = int( float(r1)*cos(ths) ) + x0;
    ys = int( float(r2)*sin(ths) ) + y0;
    xe = int( float(r1)*cos(the) ) + x0; 
    ye = int( float(r2)*sin(the) ) + y0; 
    line(xs, ys, xe, ye);
  }
}



// 以下の関数は変更しないこと．３行下のファイル名を除いて．
void keyPressed(){
  if( key== 's' ) {
    saveFrame("Result.jpg");  // Save File Name
  }
}

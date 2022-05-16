float rx = 0.0;  // x軸まわりの回転角度
float ry = 0.0;  // y軸まわりの回転角度
float rz = 0.0;  // z軸まわりの回転角度
float scl=250.0;  //拡大縮小

class Point{  float x; float y; float z; }

void setup() {
  size(800, 800, P3D);  // 3Dモード
  noFill();
}

void draw() {
  // 画面をリフレッシュ
  background(64);
  ortho(-width/2, width/2, -height/2, height/2);  // 並行投影 

  // 画面の中心に原点を移動
  translate(width/2, height/2, 0);
  rotateX(rx);  // x軸まわりの回転
  rotateY(ry);  // y軸まわりの回転
  rotateZ(rz);  // z軸まわりの回転
  scale(scl);    // 250倍に拡大
  strokeWeight(2/scl); 
  
// 立方体を描画
   stroke(255);
   drawConewf(24);
//   drawCylinderwf(48);

}

void drawConewf(int n)
{
  Point P1,P2,P3,P4;
  float dt,dti,dtip1;
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();
  dt=2*3.1415/float(n);
  for(int i=0;i<n;i++){
      dti=dt*float(i); dtip1=dt*float(i+1);
      // << P1～P4座標値を求め代入>>
      P1.x = cos(dti);   P1.y = sin(dti);   P1.z = 0;
      P2.x = cos(dtip1); P2.y = sin(dtip1); P2.z = 0;
      P3.x = 0;          P3.y = 0;          P3.z = 0;
      draw_triangle(P1,P2,P3);
      draw_triangle(P1,P2,P4);
    }  
}


void drawCylinderwf(int n){
  Point P1,P2,P3,P4,P5,P6;
  float dt,dti,dtip1;
  P1=new Point();P2=new Point();P3=new Point();P4=new Point();
  P5=new Point();P6=new Point();

 // <<P1～P6を求め、１つの４辺形と２つの３辺形を描く>>

}


// simple-3D-shape から、以下２関数をコピー
void draw_quad(Point P1, Point P2, Point P3, Point P4)
{
  beginShape(QUADS);
   vertex(P1.x, P1.y, P1.z);
   vertex(P2.x, P2.y, P2.z);
   vertex(P3.x, P3.y, P3.z);
   vertex(P4.x, P4.y, P4.z);
  endShape(CLOSE);  
}

void draw_triangle(Point P1,Point P2, Point P3)
{
  beginShape(TRIANGLES);
    vertex(P1.x, P1.y, P1.z);
    vertex(P2.x, P2.y, P2.z);
    vertex(P3.x, P3.y, P3.z);
   endShape(CLOSE); 
}




void keyPressed() {
  if (keyCode == UP)          { rx = rx + PI/30.0; }
  else if (keyCode == DOWN)   { rx = rx - PI/30.0; }
  else if (keyCode == LEFT)   { rz = rz - PI/30.0; }
  else if (keyCode == RIGHT)  { rz = rz + PI/30.0; }
  else if( key== '+' ) { scl=scl+10;}
  else if( key== '-' ) { scl=scl-10;}
  else if( key== 'r' ) { rx=0.0; rz=0.0; scl=250;}
  else if( key== 's' ) { 
  saveFrame("save-60.jpg");
  println("saved");}  // Save File Name
}
